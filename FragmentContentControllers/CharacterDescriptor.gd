extends ContentController

const InteractableLog = preload("res://Scripts/InteractableLog.gd");
const Character = preload("res://models/Character.gd");

var _parent: Node;

func _init(parent: Node):
	_parent = parent;
	run();

func run():
	_renderPiece(Character.Descriptor.HAIR);
	_renderPiece(Character.Descriptor.FACE);
	_renderPiece(Character.Descriptor.NOSE);
	_renderPiece(Character.Descriptor.LIPS);
	_renderPiece(Character.Descriptor.ARMS);
	_renderPiece(Character.Descriptor.FINGERS);
	_renderPiece(Character.Descriptor.BREASTS);
	_renderPiece(Character.Descriptor.NIPPLES);
	_renderPiece(Character.Descriptor.STOMACH);
	_renderPiece(Character.Descriptor.BACK);
	_renderPiece(Character.Descriptor.GROIN);
	_renderPiece(Character.Descriptor.VAGINA);
	_renderPiece(Character.Descriptor.BUTT);
	_renderPiece(Character.Descriptor.THIGHS);
	_renderPiece(Character.Descriptor.LEGS);
	_renderPiece(Character.Descriptor.FEET);

func _renderPiece(descriptor: Character.Descriptor):
	var log = InteractableLog.new();
	log.text = Character.descriptorToText(descriptor);
	log.gui_input.connect(onGuiInput.bind(descriptor));
	_checkActiveIndicator(log, descriptor);
	_parent.add_child(log)

func _checkActiveIndicator(log: InteractableLog, descriptor: Character.Descriptor):
	if State.getActiveDescriptor() == descriptor:
		log.text = ">>" + log.text + "<<";

func onGuiInput(event, descriptor: Character.Descriptor):
	if isGuiClickEvent(event):
		State.setActiveDescriptor(descriptor);
#		match descriptor:
#			Character.Descriptor.HAIR: _onHairClick();
#			Character.Descriptor.FACE: _onFaceClick();
#			Character.Descriptor.LIPS: _onLipsClick();
#			Character.Descriptor.ARMS: _onArmsClick();
#			Character.Descriptor.FINGERS: _onFingersClick();
#			Character.Descriptor.BREASTS: _onBreastsClick();
#			Character.Descriptor.NIPPLES: _onNipplesClick();
#			Character.Descriptor.STOMACH: _onStomachClick();
#			Character.Descriptor.BACK: _onBackClick();
#			Character.Descriptor.GROIN: _onGroinClick();
#			Character.Descriptor.VAGINA: _onVaginaClick();
#			Character.Descriptor.BUTT: _onButtClick();
#			Character.Descriptor.THIGHS: _onThighsClick();
#			Character.Descriptor.LEGS: _onLegsClick();
#			Character.Descriptor.FEET: _onFeetClick();
#
#func _onHairClick():
#	var hairCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.HAIR);
#	var fingersCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.FINGERS);
#
#	match State.getActiveDescriptor():
#		Character.Descriptor.FACE:
#			PostBoard.postLog("\n\nThe woman's " + State.saveData.getCharacter().getHairLength() + State.saveData.getCharacter().getHairColor() + " ");
#			PostBoard.postInteractableLog("hair", _onHairClick);
#			PostBoard.postLog(" flows down her back, gently stirring in the breeze.");
#			if hairCleanliness != Character.Cleanliness.CLEAN:
#				PostBoard.postLog(" The woman runs looks at a lock of her ");
#				PostBoard.postInteractableLog("hair", _onHairClick);
#				PostBoard.postLog(" and frowns as it's ");
#				PostBoard.postLog(State.saveData.getCharacter().getCleanlinessAttributeText(Character.Descriptor.HAIR) + ".");
#				PostBoard.postLog(" \"This is going to be a pain to clean...\"");
#		Character.Descriptor.FINGERS:
#			PostBoard.postLog("\n\nThe woman runs her ");
#			PostBoard.postInteractableLog("fingers", _onFingersClick);
#			PostBoard.postLog(" through her ");
#			PostBoard.postInteractableLog("hair.", _onHairClick);
#			if hairCleanliness != Character.Cleanliness.CLEAN && fingersCleanliness != Character.Cleanliness.CLEAN:
#				State.saveData.getCharacter().combineCleanlinessAttributes(Character.Descriptor.HAIR, Character.Descriptor.FINGERS);
#				PostBoard.postLog(" \"Oops... Now both my ");
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(" and ");
#				PostBoard.postInteractableLog("hair", _onHairClick);
#				PostBoard.postLog(" is more dirty...\"");
#			elif hairCleanliness != Character.Cleanliness.CLEAN:
#				State.saveData.getCharacter().setCleanlinessAttribute(Character.Descriptor.FINGERS, hairCleanliness);
#				PostBoard.postLog(" The woman looks down at her ");
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(" with a frown. \"That wasn't a smart idea, now my ")
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(" are " + State.saveData.getCharacter().getCleanlinessAttributeText(Character.Descriptor.FINGERS) + ".\"");
#			elif fingersCleanliness != Character.Cleanliness.CLEAN:
#				State.saveData.getCharacter().addCleanlinessAttribute(Character.Descriptor.HAIR, fingersCleanliness, false);
#				PostBoard.postLog(" The woman looks at her ");
#				PostBoard.postInteractableLog("hair", _onHairClick);
#				PostBoard.postLog(" and frowns. \"Now my ");
#				PostBoard.postInteractableLog("hair", _onHairClick);
#				PostBoard.postLog(" is " + State.saveData.getCharacter().getCleanlinessAttributeText(Character.Descriptor.HAIR) + ".\"");
#		_:
#			PostBoard.postLog("\n\n\"What a silly thought. How would that even work?\"");
#
#func _onFaceClick():
#	_commonMessage(Character.Descriptor.FACE, "face", _onFaceClick, true, true);
#
#func describeFace():
#	PostBoard.postLog("\n\n The woman looks at her reflection, admiring her own cuteness.");
#	if State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.FACE) != Character.Cleanliness.CLEAN:
#		PostBoard.postLog(" Her cuteness shone through even though her ");
#		PostBoard.postInteractableLog("face", _onFaceClick);
#		PostBoard.PostLog(" was " + State.saveData.getCharacter().getCleanlinessAttributeText(Character.Descriptor.FACE) + ".");
#
#func _onLipsClick():
#	var lipsCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.LIPS);
#	var fingersCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.FINGERS);
#
#	match State.getActiveDescriptor():
#		Character.Descriptor.FACE:
#			PostBoard.postLog("\n\n\"Hmmm, I'll need to find a mirror to look at my ");
#			PostBoard.postInteractableLog(State.saveData.getCharacter().getSizeAttributeText(Character.Descriptor.LIPS) + " lips", _onLipsClick);
#			PostBoard.postLog(".\"");
#		Character.Descriptor.LIPS:
#			PostBoard.postLog("\n\nThe woman licks her ");
#			PostBoard.postInteractableLog("lips", _onLipsClick);
#			if lipsCleanliness != Character.Cleanliness.CLEAN:
#				PostBoard.postLog(", cleaning of them of cum and other substances.");
#				State.saveData.getCharacter().setCleanlinessAttribute(Character.Descriptor.LIPS, Character.Cleanliness.CLEAN);
#			else:
#				PostBoard.postLog(".");
#		Character.Descriptor.FINGERS:
#			if fingersCleanliness != Character.Cleanliness.CLEAN:
#				PostBoard.postLog("\n\nThe woman licks her ");
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(" clean, aside from her own saliva.");
#			else:
#				PostBoard.postLog("\n\nThe woman sucks on her ");
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(", wetting them with her own saliva.");
#			State.saveData.getCharacter().setCleanlinessAttribute(Character.Descriptor.FINGERS, Character.Cleanliness.SALIVA);
#		_:
#			PostBoard.postLog("\n\n\"What a silly thought. How would that even work?\"");
#
#func _onArmsClick():
#	_commonMessage(Character.Descriptor.ARMS, "arms", _onArmsClick);
#
#func _onFingersClick():
#	var fingersCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.FINGERS);
#
#	match State.getActiveDescriptor():
#		Character.Descriptor.FACE:
#			PostBoard.postLog("\n\nThe woman looks at her ");
#			PostBoard.postInteractableLog(State.saveData.getCharacter().getSizeAttributeText(Character.Descriptor.FINGERS) + " fingers", _onFingersClick);
#			if fingersCleanliness != Character.Cleanliness.CLEAN:
#				PostBoard.postLog(", they are " + State.saveData.getCharacter().getCleanlinessAttributeText(Character.Descriptor.FINGERS));
#			PostBoard.postLog(".");
#		Character.Descriptor.LIPS:
#			if fingersCleanliness != Character.Cleanliness.CLEAN:
#				PostBoard.postLog("\n\nThe woman licks her ");
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(" clean, aside from her own saliva.");
#			else:
#				PostBoard.postLog("\n\nThe woman sucks on her ");
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(", wetting them with her own saliva.");
#			State.saveData.getCharacter().setCleanlinessAttribute(Character.Descriptor.FINGERS, Character.Cleanliness.SALIVA);
#		_:
#			PostBoard.postLog("\n\n\"What a silly thought. How would that even work?\"");
#
#func _onBreastsClick():
#	_commonMessage(Character.Descriptor.BREASTS, "breasts", _onBreastsClick, true);
#
#func _onNipplesClick():
#	_commonMessage(Character.Descriptor.NIPPLES, "nipples", _onNipplesClick);
#
#func _onStomachClick():
#	_commonMessage(Character.Descriptor.STOMACH, "belly", _onStomachClick);
#
#func _onBackClick():
#	_commonMessage(Character.Descriptor.BACK, "back", _onBackClick, false, true);
#
#func _onGroinClick():
#	_commonMessage(Character.Descriptor.GROIN, "groin", _onGroinClick);
#
#func _onVaginaClick():
#	var descriptor = Character.Descriptor.VAGINA;
#	var descriptorText = "vagina";
#	var onDescriptorClick = _onVaginaClick;
#
#	var descriptorCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(descriptor);
#	var fingersCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.FINGERS);
#
#	match State.getActiveDescriptor():
#		Character.Descriptor.FACE:
#			PostBoard.postLog("\n\nThe woman looks at her ");
#			PostBoard.postInteractableLog(descriptorText, onDescriptorClick);
#			if descriptorCleanliness != Character.Cleanliness.CLEAN:
#				PostBoard.postLog(", it is " + State.saveData.getCharacter().getCleanlinessAttributeText(descriptor));
#			PostBoard.postLog(".");
#		Character.Descriptor.FINGERS:
#			PostBoard.postLog("\n\nThe woman slides her finger over her ");
#			PostBoard.postInteractableLog(descriptorText, onDescriptorClick);
#			PostBoard.postLog(", wetting them with her own girl cum.");
#			State.saveData.getCharacter().addCleanlinessAttribute(descriptor, Character.Cleanliness.GIRL_CUM);
#		_:
#			PostBoard.postLog("\n\n\"What a silly thought. How would that even work?\"");
#
#func _onButtClick():
#	_commonMessage(Character.Descriptor.BUTT, "butt", _onButtClick, true, true);
#
#func _onThighsClick():
#	_commonMessage(Character.Descriptor.THIGHS, "thighs", _onThighsClick);
#
#func _onLegsClick():
#	_commonMessage(Character.Descriptor.LEGS, "legs", _onLegsClick);
#
#func _onFeetClick():
#	_commonMessage(Character.Descriptor.FEET, "feet", _onFeetClick);
#
#func _commonMessage(descriptor: Character.Descriptor, descriptorText: String, onDescriptorClick: Callable, hasSizeAttribute: bool = false, requiresMirror: bool = false):
#	var descriptorCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(descriptor);
#	var fingersCleanliness = State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.FINGERS);
#
#	match State.getActiveDescriptor():
#		Character.Descriptor.FACE:
#			if requiresMirror:
#				PostBoard.postLog("\n\n\"Hmmm, I'll need to find a mirror to look at my ");
#				PostBoard.postInteractableLog(descriptorText, onDescriptorClick);
#				PostBoard.postLog(".\"");
#			else:
#				PostBoard.postLog("\n\nThe woman looks at her ");
#				var text = descriptorText;
#				if hasSizeAttribute:
#					text = State.saveData.getCharacter().getSizeAttributeText(descriptor) + " " + text;
#				PostBoard.postInteractableLog(text, onDescriptorClick);
#				if descriptorCleanliness != Character.Cleanliness.CLEAN:
#					PostBoard.postLog(", they are " + State.saveData.getCharacter().getCleanlinessAttributeText(descriptor));
#				PostBoard.postLog(".");
#		Character.Descriptor.FINGERS:
#			PostBoard.postLog("\n\nThe woman wipes her ");
#			PostBoard.postInteractableLog(descriptorText, onDescriptorClick);
#			PostBoard.postLog(" using her ");
#			PostBoard.postInteractableLog("fingers", _onFingersClick);
#			PostBoard.postLog(".");
#			if descriptorCleanliness != Character.Cleanliness.CLEAN && fingersCleanliness != Character.Cleanliness.CLEAN:
#				State.saveData.getCharacter().combineCleanlinessAttributes(descriptor, Character.Descriptor.FINGERS);
#				PostBoard.postLog(" \"Oops... Now both my ");
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(" and ");
#				PostBoard.postInteractableLog(descriptorText, onDescriptorClick);
#				PostBoard.postLog(" is more dirty...\"");
#			elif descriptorCleanliness != Character.Cleanliness.CLEAN:
#				State.saveData.getCharacter().addCleanlinessAttribute(Character.Descriptor.FINGERS, descriptorCleanliness);
#				State.saveData.getCharacter().subtractCleanlinessAttribute(descriptor, descriptorCleanliness);
#				PostBoard.postLog(" The woman looks down at her ");
#				PostBoard.postInteractableLog("fingers", _onFingersClick);
#				PostBoard.postLog(" with a sigh. \"Well at least my ")
#				PostBoard.postInteractableLog(descriptorText, onDescriptorClick);
#				PostBoard.postLog(" is a little cleaner.\"");
#			elif fingersCleanliness != Character.Cleanliness.CLEAN:
#				State.saveData.getCharacter().addCleanlinessAttribute(descriptor, fingersCleanliness);
#				State.saveData.getCharacter().subtractCleanlinessAttribute(Character.Descriptor.FINGERS, fingersCleanliness);
#				PostBoard.postLog(" The woman frowns. \"Why'd I rub this mess onto my ");
#				PostBoard.postInteractableLog(descriptorText + "?\"", onDescriptorClick);
#		_:
#			PostBoard.postLog("\n\n\"What a silly thought. How would that even work?\"");
#
#func describeButt():
#	PostBoard.postLog("\n\nThe woman looks at her reflection, admiring her own ")
#	PostBoard.postInteractableLog(State.saveData.getCharacter().getSizeAttributeText(Character.Descriptor.BUTT) + " butt.", _onButtClick);
#	if State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.BUTT) != Character.Cleanliness.CLEAN:
#		PostBoard.postLog(" Even " + State.saveData.getCharacter().getCleanlinessAttributeText(Character.Descriptor.BUTT) + ", her ");
#		PostBoard.postInteractableLog("butt", _onButtClick);
#		PostBoard.PostLog(" was an attractive sight.");
#
#func describeBack():
#	PostBoard.postLog("\n\nThe woman looks at her reflection, admiring her own ")
#	PostBoard.postInteractableLog("back.", _onBackClick);
#	if State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.BACK) != Character.Cleanliness.CLEAN:
#		PostBoard.postLog(" Even " + State.saveData.getCharacter().getCleanlinessAttributeText(Character.Descriptor.BACK) + ", her ");
#		PostBoard.postInteractableLog("back", _onBackClick);
#		PostBoard.PostLog(" was an attractive sight.");
#
#func describeLips():
#	PostBoard.postLog("\n\nThe woman looks at her reflection, admiring her own ")
#	PostBoard.postInteractableLog(State.saveData.getCharacter().getSizeAttributeText(Character.Descriptor.LIPS) + " lips.", _onLipsClick);
#	if State.saveData.getCharacter().getCleanlinessAttribute(Character.Descriptor.LIPS) != Character.Cleanliness.CLEAN:
#		PostBoard.postLog(" Even " + State.saveData.getCharacter().getCleanlinessAttributeText(Character.Descriptor.LIPS) + ", her ");
#		PostBoard.postInteractableLog("lips", _onLipsClick);
#		PostBoard.PostLog(" was an attractive sight.");
