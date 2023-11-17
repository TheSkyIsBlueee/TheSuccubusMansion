extends RefCounted

enum Descriptor {
	HAIR = 0,
	FACE,
	NOSE,
	LIPS,
	ARMS,
	FINGERS,
	BREASTS,
	NIPPLES,
	STOMACH,
	BACK,
	GROIN,
	BUTT,
	VAGINA,
	THIGHS,
	LEGS,
	FEET
};

const CleanlinessKey = "cleanliness";
enum Cleanliness {
	CLEAN=1,
	WATER=2,
	CUM=4,
	GIRL_CUM=8,
	SALIVA=16,
	WATER_DRENCHED=32,
	CUM_DRENCHED=64,
	GIRL_CUM_DRENCHED=128,
	SALIVA_DRENCHED=256
};

const SizeKey = "size";
# Used for attributes that don't change.
const SizeSmall = "small";

const HairLengthKey = "length";
const HairColorKey = "color";
const NipplesLactatingKey = "lactating";
const StomachCumExpansion = "cumexpansion";
enum CumExpansion {
	SMOOTH=0,
	SMALL,
	MEDIUM,
	LARGE,
	HEAVILY_PREGNANT
};
const GroinPubicHairKey = "pubichair";
signal OnDescriptionUpdate;

var data: Dictionary : set = _setData, get = _getData;
func _init():
	data = getInitialDescription();

func _getData() -> Dictionary:
	return data;

func _setData(_data: Dictionary):
	data = _data;
	OnDescriptionUpdate.emit(_data);

func getHairLength() -> String:
	return _getAttribute(Descriptor.HAIR, HairLengthKey);

func getHairColor() -> String:
	return _getAttribute(Descriptor.HAIR, HairColorKey);

func getCleanlinessAttributeText(descriptor: Descriptor) -> String:
	return _cleanlinessToText(
		getCleanlinessAttribute(descriptor)
	);

func getCleanlinessAttribute(descriptor: Descriptor) -> Cleanliness:
	return _getAttribute(descriptor, CleanlinessKey);

func setCleanlinessAttribute(descriptor: Descriptor, cleanliness: Cleanliness):
	_setAttribute(descriptor, CleanlinessKey, cleanliness);

func addCleanlinessAttribute(descriptor: Descriptor, cleanliness: Cleanliness, allowDrenched: bool = true):
	var current = getCleanlinessAttribute(descriptor);
	
	if (cleanliness & Cleanliness.WATER || cleanliness & Cleanliness.WATER_DRENCHED):
		if current & Cleanliness.WATER == 0:
			current += Cleanliness.WATER;
		elif allowDrenched && current & Cleanliness.WATER_DRENCHED == 0:
			current += Cleanliness.WATER_DRENCHED;
	
	if (cleanliness & Cleanliness.CUM || cleanliness & Cleanliness.CUM_DRENCHED):
		if current & Cleanliness.CUM == 0:
			current += Cleanliness.CUM;
		elif allowDrenched && current & Cleanliness.CUM_DRENCHED == 0:
			current += Cleanliness.CUM_DRENCHED;
	
	if (cleanliness & Cleanliness.GIRL_CUM || cleanliness & Cleanliness.GIRL_CUM_DRENCHED):
		if current & Cleanliness.GIRL_CUM == 0:
			current += Cleanliness.GIRL_CUM;
		elif allowDrenched && current & Cleanliness.GIRL_CUM_DRENCHED == 0:
			current += Cleanliness.GIRL_CUM_DRENCHED;
	
	if (cleanliness & Cleanliness.SALIVA || cleanliness & Cleanliness.SALIVA_DRENCHED):
		if current & Cleanliness.SALIVA == 0:
			current += Cleanliness.SALIVA;
		elif allowDrenched && current & Cleanliness.SALIVA_DRENCHED == 0:
			current += Cleanliness.SALIVA_DRENCHED;
	
	setCleanlinessAttribute(descriptor, current);

func subtractCleanlinessAttribute(descriptor: Descriptor, cleanliness: Cleanliness):
	var current = getCleanlinessAttribute(descriptor);
	
	if (cleanliness & Cleanliness.WATER || cleanliness & Cleanliness.WATER_DRENCHED):
		if current & Cleanliness.WATER_DRENCHED == 1:
			current -= Cleanliness.WATER_DRENCHED;
		elif current & Cleanliness.WATER == 1:
			current -= Cleanliness.WATER;
	
	if (cleanliness & Cleanliness.CUM || cleanliness & Cleanliness.CUM_DRENCHED):
		if current & Cleanliness.CUM_DRENCHED == 1:
			current -= Cleanliness.CUM_DRENCHED;
		elif current & Cleanliness.CUM == 1:
			current -= Cleanliness.CUM;

	if (cleanliness & Cleanliness.GIRL_CUM || cleanliness & Cleanliness.GIRL_CUM_DRENCHED):
		if current & Cleanliness.GIRL_CUM_DRENCHED == 1:
			current -= Cleanliness.GIRL_CUM_DRENCHED;
		elif current & Cleanliness.GIRL_CUM == 1:
			current -= Cleanliness.GIRL_CUM;

	if (cleanliness & Cleanliness.SALIVA || cleanliness & Cleanliness.SALIVA_DRENCHED):
		if current & Cleanliness.SALIVA_DRENCHED == 1:
			current -= Cleanliness.SALIVA_DRENCHED;
		elif current & Cleanliness.SALIVA == 1:
			current -= Cleanliness.SALIVA;
	
	setCleanlinessAttribute(descriptor, current);

func combineCleanlinessAttributes(descriptor1: Descriptor, descriptor2: Descriptor, allowDrenched: bool = true):
	var c1 = getCleanlinessAttribute(descriptor1);
	var c2 = getCleanlinessAttribute(descriptor2);
	
	var mask = Cleanliness.WATER + Cleanliness.CUM + Cleanliness.GIRL_CUM + Cleanliness.SALIVA;
	
	if allowDrenched:
		mask += Cleanliness.WATER_DRENCHED + Cleanliness.CUM_DRENCHED + Cleanliness.GIRL_CUM_DRENCHED + Cleanliness.SALIVA

	setCleanlinessAttribute(descriptor1, c1 | (c2 & mask));
	setCleanlinessAttribute(descriptor2, c2 | (c1 & mask));

func getSizeAttributeText(descriptor: Descriptor) -> String:
	var size = _getAttribute(descriptor, SizeKey);
	
	if descriptor == Descriptor.STOMACH:
		size = _cumExpansionToText(size);
	
	return size;

func getCumExpansion() -> CumExpansion:
	return _getAttribute(Descriptor.VAGINA, SizeKey);

func setCumExpansion(cumexp: CumExpansion):
	_setAttribute(Descriptor.VAGINA, StomachCumExpansion, cumexp);

func increaseCumExpansion():
	var cExp = getCumExpansion();
	var newExp: CumExpansion = CumExpansion.SMOOTH;
	
	match cExp:
		CumExpansion.LARGE: newExp = CumExpansion.HEAVILY_PREGNANT;
		CumExpansion.MEDIUM: newExp = CumExpansion.LARGE;
		CumExpansion.SMALL: newExp = CumExpansion.MEDIUM;
		CumExpansion.SMOOTH: newExp = CumExpansion.SMALL;
		_:
			return;
	
	setCumExpansion(newExp);

func reduceCumExpansion():
	var cExp = getCumExpansion();
	var newExp: CumExpansion = CumExpansion.SMOOTH;
	
	match cExp:
		CumExpansion.HEAVILY_PREGNANT: newExp = CumExpansion.LARGE;
		CumExpansion.LARGE: newExp = CumExpansion.MEDIUM;
		CumExpansion.MEDIUM: newExp = CumExpansion.SMALL;
		CumExpansion.SMALL: newExp = CumExpansion.SMOOTH;
		_:
			return;
	
	setCumExpansion(newExp);

func isLactating() -> bool:
	return _getAttribute(Descriptor.NIPPLES, NipplesLactatingKey);

func setLactating(lactating: bool):
	_setAttribute(Descriptor.NIPPLES, NipplesLactatingKey, lactating);

func getPublicHair() -> String:
	return _getAttribute(Descriptor.GROIN, GroinPubicHairKey);


static func getInitialDescription() -> Dictionary:
	return {
		_descriptorToKey(Descriptor.HAIR): {
			HairLengthKey: "long",
			HairColorKey: "black",
			CleanlinessKey: Cleanliness.CLEAN
		},
		_descriptorToKey(Descriptor.FACE): {
			CleanlinessKey: Cleanliness.CLEAN,
			SizeKey: SizeSmall
		},
		_descriptorToKey(Descriptor.NOSE): {
			CleanlinessKey: Cleanliness.CLEAN,
			SizeKey: SizeSmall
		},
		_descriptorToKey(Descriptor.LIPS): {
			CleanlinessKey: Cleanliness.CLEAN,
			SizeKey: "plump"
		},
		_descriptorToKey(Descriptor.ARMS): {
			CleanlinessKey: Cleanliness.CLEAN
		},
		_descriptorToKey(Descriptor.FINGERS): {
			SizeKey: "slender",
			CleanlinessKey: Cleanliness.CLEAN
		},
		_descriptorToKey(Descriptor.BREASTS): {
			SizeKey: "bountiful",
			CleanlinessKey: Cleanliness.CLEAN
		},
		_descriptorToKey(Descriptor.NIPPLES): {
			CleanlinessKey: Cleanliness.CLEAN,
			NipplesLactatingKey: false
		},
		_descriptorToKey(Descriptor.STOMACH): {
			CleanlinessKey: Cleanliness.CLEAN
		},
		_descriptorToKey(Descriptor.BACK): {
			CleanlinessKey: Cleanliness.CLEAN,
		},
		_descriptorToKey(Descriptor.GROIN): {
			CleanlinessKey: Cleanliness.CLEAN,
			GroinPubicHairKey: "shaved"
		},
		_descriptorToKey(Descriptor.BUTT): {
			SizeKey: "big heart-shaped",
			CleanlinessKey: Cleanliness.CLEAN
		},
		_descriptorToKey(Descriptor.VAGINA): {
			CleanlinessKey: Cleanliness.GIRL_CUM,
			StomachCumExpansion: CumExpansion.SMOOTH
		},
		_descriptorToKey(Descriptor.THIGHS): {
			CleanlinessKey: Cleanliness.CLEAN
		},
		_descriptorToKey(Descriptor.LEGS): {
			CleanlinessKey: Cleanliness.CLEAN
		},
		_descriptorToKey(Descriptor.FEET): {
			CleanlinessKey: Cleanliness.CLEAN
		}
	};

static func descriptorToText(descriptor: Descriptor) -> String:
	match descriptor:
		Descriptor.HAIR: return "Hair";
		Descriptor.FACE: return "Face";
		Descriptor.NOSE: return "Nose";
		Descriptor.LIPS: return "Lips";
		Descriptor.ARMS: return "Arms";
		Descriptor.FINGERS: return "Fingers";
		Descriptor.BREASTS: return "Breasts";
		Descriptor.NIPPLES: return "Nipples";
		Descriptor.STOMACH: return "Stomach";
		Descriptor.BACK: return "Back";
		Descriptor.GROIN: return "Groin";
		Descriptor.BUTT: return "Butt";
		Descriptor.VAGINA: return "Vagina";
		Descriptor.THIGHS: return "Thighs";
		Descriptor.LEGS: return "Legs";
		Descriptor.FEET: return "Feet";
		_:
			printerr("Unsupported descriptor in _descriptorToKey - " + str(descriptor));
			return "";


func _setAttribute(descriptor: Descriptor, attribute: String, value: Variant):
	data[_descriptorToKey(descriptor)][attribute] = value;
	OnDescriptionUpdate.emit(data);

func _getAttribute(descriptor: Descriptor, attribute: String) -> Variant:
	return data[_descriptorToKey(descriptor)][attribute];

static func _descriptorToKey(descriptor: Descriptor) -> String:
	match descriptor:
		Descriptor.HAIR: return "hair";
		Descriptor.FACE: return "face";
		Descriptor.NOSE: return "nose";
		Descriptor.LIPS: return "lips";
		Descriptor.ARMS: return "arms";
		Descriptor.FINGERS: return "fingers";
		Descriptor.BREASTS: return "breasts";
		Descriptor.NIPPLES: return "nipples";
		Descriptor.STOMACH: return "stomach";
		Descriptor.BACK: return "back";
		Descriptor.GROIN: return "groin";
		Descriptor.BUTT: return "butt";
		Descriptor.VAGINA: return "vagina";
		Descriptor.THIGHS: return "thighs";
		Descriptor.LEGS: return "legs";
		Descriptor.FEET: return "feet";
		_:
			printerr("Unsupported descriptor in _descriptorToKey - " + str(descriptor));
			return "";

static func _cleanlinessToText(value: Cleanliness) -> String:
	var drenched = [];
	var wet = [];
	
	if value & Cleanliness.WATER_DRENCHED:
		drenched.append("water");
	elif value & Cleanliness.WATER:
		wet.append("water");

	if value & Cleanliness.CUM_DRENCHED:
		drenched.append("cum");
	elif value & Cleanliness.CUM:
		wet.append("cum");

	if value & Cleanliness.GIRL_CUM_DRENCHED:
		drenched.append("girlcum");
	elif value & Cleanliness.GIRL_CUM:
		wet.append("girlcum");

	if value & Cleanliness.SALIVA_DRENCHED:
		drenched.append("saliva");
	elif value & Cleanliness.SALIVA:
		wet.append("saliva");
	
	if wet.size() == 0 && drenched.size() == 0:
		return "clean";

	var text = "";
	
	if drenched.size() != 0:
		text += "drenched in " + (", ".join(drenched));
	
	if wet.size() != 0:
		if text != "":
			text += "; and ";
		
		text += "wet with " + (", ".join(wet));
	
	return text;

static func _cumExpansionToText(size: CumExpansion) -> String:
	match size:
		CumExpansion.SMOOTH: return "smooth";
		CumExpansion.SMALL: return "small";
		CumExpansion.MEDIUM: return "round";
		CumExpansion.LARGE: return "bulging";
		CumExpansion.HEAVILY_PREGNANT: return "huge";
		_:
			printerr("Unsupported CumExpansion in _cumExpansionToText - " + str(size));
			return "";

