extends ContentController

const Log = preload("res://Scripts/Log.gd");
const InteractableLog = preload("res://Scripts/InteractableLog.gd");
const SaveDataFlags = preload("res://utils/SaveDataFlags.gd");
const Character = preload("res://models/Character.gd");

func run():
	var title = Log.new();
	title.text = "Mansion Entrance";
	title.theme = load("res://UI/TitleFont.tres");
	PostBoard.post(title);
	PostBoard.postLog("\nThe woman arrived at the ");
	PostBoard.postInteractableLog("gate", _onGatesClick);
	PostBoard.postLog(" to a large fenced ");
	PostBoard.postInteractableLog("courtyard.", _onCourtYardClick);
	_describeCourtYard();

func _onCourtYardClick(event):
	if isGuiClickEvent(event):
		_describeCourtYard();

func _describeCourtYard():
	PostBoard.postLog("\n\nThe woman looks over the ");
	PostBoard.postInteractableLog("courtyard", _onCourtYardClick);
	PostBoard.postLog(", a ");
	PostBoard.postInteractableLog("sweet musky scent", _onMuskyScentClick);
	PostBoard.postLog(" is in the air.");
	PostBoard.postLog("\nThe woman's shoulder's lowered slightly as she took a deep breath.");
	PostBoard.postLog("Looking past the courtyard, a large mansion stood.");
	PostBoard.postLog("\n\nThe mansion was very wide and appeared to be 2 stories tall. The center of the mansion had a ");
	PostBoard.postInteractableLog("large wooden door", _onLargeWoodenDoorClick);
	PostBoard.postLog(" with a few stone steps leading towards it.");
	PostBoard.postLog("\n\nThe west and east wings of the the courtyard seemed to mostly mirrored each other with some ");
	PostBoard.postInteractableLog("potted plants", _onPottedPlantsClick);
	PostBoard.postLog(" and ");
	PostBoard.postInteractableLog("stone benches.", _onStoneBenchClick);
	PostBoard.postLog("\n\nEach side had it's own ");
	PostBoard.postInteractableLog("large fountain", _onFountainClick);
	PostBoard.postLog(" in the center.");
	PostBoard.postLog("\n\nBetween the fountain and building stood a ");
	PostBoard.postInteractableLog("massive statue", _onStatueClick);

func _onStoneBenchClick(event):
	if isGuiClickEvent(event):
		match State.activeDescriptor:
			Character.Descriptor.FACE:
				PostBoard.postLog("\n\nThe woman walks towards the ");
				PostBoard.postInteractableLog("stone benches", _onStoneBenchClick);
				PostBoard.postLog(", from afar it looked mostly normal with a large back rest to lean back and rest your arms on.");
				PostBoard.postLog("\nThe woman tilted her head and raised her brows as she approached a ");
				PostBoard.postInteractableLog("bench", _onStoneBenchClick);
				PostBoard.postLog(", finding seats were very oddly shaped.");
				PostBoard.postLog("\nThe bench was long enough to hold 3 people, each section clearly defined by 2 muscular arms and hands. Between the hands were 2 ");
				PostBoard.postInteractableLog("large lumps with a strange veiny design.", _onStoneBallsClick);
				if State.saveData.getFlag(SaveDataFlags.InspectedStoneBench):
					PostBoard.postLog("\nThe woman's eyes followed the ");
					PostBoard.postInteractableLog("thick veiny stone appendage", _onStoneDickClick);
					PostBoard.postLog(" and rested on the ");
					PostBoard.postInteractableLog("stone gland", _onStoneDickHeadClick);
					PostBoard.postLog(" at the end. \"... It's definitely a ");
					PostBoard.postInteractableLog("cock", _onStoneDickClick);
					PostBoard.postLog(", right?\"");
				else:
					PostBoard.postLog("\nHanging between the ");
					PostBoard.postInteractableLog("large lumps with a strange veiny design.", _onStoneBallsClick);
					PostBoard.postLog(" was a ");
					PostBoard.postInteractableLog("thick veiny stone appendage", _onStoneDickClick);
					PostBoard.postLog(" that reached half way towards the ground.");
					PostBoard.postLog("\nAs the woman's eyes followed the ");
					PostBoard.postInteractableLog("appendage", _onStoneDickClick);
					PostBoard.postLog(", she stared at the ");
					PostBoard.postInteractableLog("tip of the appendage", _onStoneDickHeadClick);
					PostBoard.postLog(". \"... This is a cock.\"");
					State.saveData.setFlag(SaveDataFlags.InspectedStoneBench, true);
				PostBoard.postLog("\n\n\nTUTORIAL: Some points of interest are inactive or only partially active, meaning that meeting certain conditions will unlock interactions with them. Note, some of these points of interest may have different parts of them that you can interact with. Try discovering the stone bench's condition!\n\n\n");
			_:
				PostBoard.postWhyWouldIDoThat();

func _onStoneBallsClick(event):
	if isGuiClickEvent(event):
		match State.activeDescriptor:
			Character.Descriptor.LIPS:
				PostBoard.postLog("\n\nThe woman leaned forward, engulfing the ");
				PostBoard.postInteractableLog("stone cock", _onStoneDickClick);
				PostBoard.postLog(" in her breasts. She continues leaning forward as she kisses the ");
				PostBoard.postInteractableLog("veiny stone balls.", _onStoneBallsClick);
				PostBoard.postLog("\nNothing happens.");
			Character.Descriptor.FINGERS:
				PostBoard.postLog("\n\nThe woman reaches forward and runs her finger over the ");
				PostBoard.postInteractableLog("veiny stone balls.", _onStoneBallsClick);
				PostBoard.postLog("\nNothing happens.");
			Character.Descriptor.FEET:
				PostBoard.postLog("\n\nThe woman reaches forward and runs her finger over the ");
				PostBoard.postInteractableLog("veiny stone balls.", _onStoneBallsClick);
				PostBoard.postLog("\nNothing happens.");
			Character.Descriptor.BUTT:
				PostBoard.postLog("\n\nThe woman sat down on top of the balls. She leans back into the bench, her clit pushing against the base of the ");
				PostBoard.postInteractableLog("stone cock.", _onStoneDickClick);
				PostBoard.postLog("\nThe Woman lightly gasped as a muscular hand reached down her groin and another cupped her breast.")
			Character.Descriptor.VAGINA:
				PostBoard.postLog("\n\nTo be implemented");
			_:
				PostBoard.postHowWouldThatWork();

func _onStatueClick():
	pass;

func _onFountainClick():
	pass;

func _onStoneDickHeadClick():
	pass;

func _onStoneDickClick():
	pass;

func _onLargeWoodenDoorClick(event):
	if isGuiClickEvent(event):
		PostBoard.postLog("\n\nThe woman walks up to the ");
		PostBoard.postInteractableLog("large wooden door", _onLargeWoodenDoorClick);
		PostBoard.postLog(". It stood over twice her height and was wider then she could reach.");
		PostBoard.postLog("\nOther than its size, the ");
		PostBoard.postInteractableLog("door", _onLargeWoodenDoorClick);
		PostBoard.postLog(" was rather plain; except for the lack of handles and a lock.");
		PostBoard.postLog("\nThe woman tilted her head as she stared at the ");
		PostBoard.postInteractableLog("door", _onLargeWoodenDoorClick);
		PostBoard.postLog(". Reaching out she pushed against against the ");
		PostBoard.postInteractableLog("door", _onLargeWoodenDoorClick);
		PostBoard.postLog(", it did not budge in the slightest.");
		State.saveData.setFlag(SaveDataFlags.InvestigatedMansionEntrance, true);

func _onGatesClick(event):
	if isGuiClickEvent(event):
		State.saveData.setFlag(SaveDataFlags.UnlockedCharacterDescription, true);
		
		var congrats: String = "\n\nTUTORIAL: Good job! Switching between body parts is an important part of the experience. Note, \"Face\" is used to describe point of interests and will help you gain a better understanding of what is going on. If you only use, \"Fingers\" for example, you may find the woman touching and poking things without you even knowing much about whatever she is touching.";

		if State.saveData.getFlag(SaveDataFlags.OpenedMansionEntranceGate):
			PostBoard.postLog("\n\nThe ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(" is open.");
			PostBoard.postLog(congrats);
			return;
		
		if State.activeDescriptor == Character.Descriptor.FACE:
			PostBoard.postLog("\n\nThe ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(" towers over the woman. There does not appear to be any locks on it. Maybe you should try opening it.");
			PostBoard.postLog("\n\n\nTUTORIAL: Some points of interest have multiple ways to interact with them. One common way is to use different parts of the woman's body on the points of interest. On the left side, you will now see a list of body parts. Try clicking on the body parts and then on the gate.");
		elif State.activeDescriptor == Character.Descriptor.FINGERS:
			PostBoard.postLog("\n\nThe woman gently pushes the ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(", surprisingly it opens with little resistance.");
			State.saveData.setFlag(SaveDataFlags.OpenedMansionEntranceGate, true);
			PostBoard.postLog(congrats);
		elif State.activeDescriptor == Character.Descriptor.BREASTS:
			PostBoard.postLog("\n\nThe woman takes a step forward as she scans the ");
			PostBoard.postInteractableLog("courtyard", _onCourtYardClick);
			PostBoard.postLog(" from behind the ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(". Her breasts push up against the ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(", surprisingly it opened with little resistance.");
			State.saveData.setFlag(SaveDataFlags.OpenedMansionEntranceGate, true);
			PostBoard.postLog(congrats);
		elif State.activeDescriptoractiveDescriptor == Character.Descriptor.FEET:
			PostBoard.postLog("\n\nThe woman helds her hands behind her back. She raised her foot and gave the ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(" a gentle tap, surprisingly it opened slightly with little resistance. Her head tilted while staring at the partially opened ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(". Shrugging, she reaches out and pushes it open.");
			State.saveData.setFlag(SaveDataFlags.OpenedMansionEntranceGate, true);
			PostBoard.postLog(congrats);
		else:
			PostBoard.postWhyWouldIDoThat();

func _onMuskyScentClick(event):
	if isGuiClickEvent(event):
		if !State.saveData.getFlag(SaveDataFlags.OpenedMansionEntranceGate):
			PostBoard.postLog("\n\nThe woman wants to go investigate the ");
			PostBoard.postInteractableLog("sweet musky scent", _onMuskyScentClick);
			PostBoard.postLog(", but there's a ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(" in the way.");
			return;
		
		if State.activeDescriptor == Character.Descriptor.FACE:
			PostBoard.postLog("\n\nThe woman follows the ");
			PostBoard.postInteractableLog("sweet musky scent", _onMuskyScentClick);
			PostBoard.postLog(", quickly finding herself standing front of some ")
			PostBoard.postInteractableLog("potted plants.", _onPottedPlantsClick);
		else:
			PostBoard.postHowWouldThatWork();

func _onPottedPlantsClick(event):
	var char = State.saveData.getCharacter();

	if isGuiClickEvent(event):
		if !State.saveData.getFlag(SaveDataFlags.OpenedMansionEntranceGate):
			PostBoard.postLog("\n\nThe woman wants to go investigate the ");
			PostBoard.postInteractableLog("potted plants", _onPottedPlantsClick);
			PostBoard.postLog(", but there's a ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(" in the way.");
			return;
		
		match State.activeDescriptor:
			Character.Descriptor.FACE:
				PostBoard.postLog("\n\nThe woman examines the ");
				PostBoard.postInteractableLog("potted plants.", _onPottedPlantsClick);
				PostBoard.postLog(" The ")
				PostBoard.postInteractableLog("plants", _onPottedPlantsClick);
				PostBoard.postLog(" had a small variety of different shapes, but they all had 1 thing in common, a detail that left the woman blushing.");
				PostBoard.postLog("\n\n\"These ");
				PostBoard.postInteractableLog("plants", _onPottedPlantsClick);
				PostBoard.postLog(" have a")
				PostBoard.postInteractableLog("pussy...\"", _onPottedPlantsClick);
				PostBoard.postLog("\n\nThe ")
				PostBoard.postInteractableLog("pussy plant", _onPottedPlantsClick);
				PostBoard.postLog(" was a large plant, half as tall as the woman. It had large sparkly pink petals and a very thick stem.")
				PostBoard.postLog(" The petals fluttered as the woman examined the ");
				PostBoard.postInteractableLog("plant", _onPottedPlantsClick);
				PostBoard.postLog(", the petals have begun to glizzen with moisture as what looked to be girl cum began to beed around the center of the petals, where a small smooth slit rested with a slight gap.");
				PostBoard.postLog("\n\nThe woman's heart had begun to race and she felt her mind cloud and her cunt tingled in need, only noticing just now that the ");
				# Intentionally leads to potted plant instead of musky scent click.
				PostBoard.postInteractableLog("sweet musky scent", _onPottedPlantsClick);
				PostBoard.postLog(" was significantly stronger, so much though that she felt her vagina drooling down her thigh.");
				char.addCleanlinessAttribute(Character.Descriptor.VAGINA, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.THIGHS, Character.Cleanliness.GIRL_CUM);
			Character.Descriptor.LIPS:
				PostBoard.postLog("\n\nThe woman leans forward gives the ");
				PostBoard.postInteractableLog("pussy plant", _onPottedPlantsClick);
				PostBoard.postLog(" quick peck. Her lips tingled and cunt gushed with her own nectar as she dropped to her knees. She ran her finger over her lips; her hand sneaked down to her cunt.");
				PostBoard.postLog(" Her hand reached her cunt and she suddenly jolts forward as she plunged her fingers into her cunt. The ")
				PostBoard.postInteractableLog("plant", _onPottedPlantsClick);
				PostBoard.postLog(" catches her.");
				PostBoard.postLog("\n\nThe woman furiously finger fucks herself, every few seconds her body spasms and the ")
				PostBoard.postInteractableLog("plant pussy", _onPottedPlantsClick);
				PostBoard.postLog(" gushes its nectar all over her face.");
				PostBoard.postLog("\n\nAfter several minutes the woman jerking and spasms send to her falling to the ground, still mindlessly finger fucking her cunt.");
				PostBoard.postLog("\n\nSome time later, the woman wakes up in a pool of her own cum, most of her body drenched in it.");
				PostBoard.postLog(" Her nipples were still hard and a deep blush rested on her face. She looked at the plant as she took in what just happened, she could feel the ");
				PostBoard.postInteractableLog("sweet musky scent", _onPottedPlantsClick);
				PostBoard.postLog(" clouding her mind again.");
				
				char.addCleanlinessAttribute(Character.Descriptor.HAIR, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.FACE, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.LIPS, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.ARMS, Character.Cleanliness.GIRL_CUM);
				char.addCleanlinessAttribute(Character.Descriptor.FINGERS, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.BACK, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.GROIN, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.VAGINA, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.BUTT, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.THIGHS, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.LEGS, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.FEET, Character.Cleanliness.GIRL_CUM_DRENCHED);
				State.saveData.setFlag(SaveDataFlags.KissedThePlant, true);

				_describeCourtYard();
			Character.Descriptor.FINGERS:
				PostBoard.postLog("\n\nThe woman slides her finger over the ");
				PostBoard.postInteractableLog("plant's slit", _onPottedPlantsClick);
				PostBoard.postLog(", the ")
				PostBoard.postInteractableLog("plant", _onPottedPlantsClick);
				PostBoard.postLog(" gushed out nectar, drenching her entire hand.");
				PostBoard.postLog("\nAs the nectar settled onto her skin, she felt cunt tingle it drooled a mini-stream onto her thighs.");
				char.addCleanlinessAttribute(Character.Descriptor.FINGERS, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.VAGINA, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.THIGHS, Character.Cleanliness.GIRL_CUM_DRENCHED);
			Character.Descriptor.FEET:
				PostBoard.postLog("\n\nThe woman nudge the ");
				PostBoard.postInteractableLog("plant's", _onPottedPlantsClick);
				PostBoard.postLog(" thick step with her foot. Nothing happened.");
			Character.Descriptor.VAGINA:
				PostBoard.postLog("\n\nThe woman climbs over the flower, sitting on top of it. Her cunt is pressed against the ");
				PostBoard.postInteractableLog("plant's", _onPottedPlantsClick);
				PostBoard.postLog(" slit; the ");
				PostBoard.postInteractableLog("plant", _onPottedPlantsClick);
				PostBoard.postLog(" gushes more nectar all over her pussy and groin.\n\nAs the nectar soaks into her skin, she feels her race racing as her cunt tingles strongly again. Her knees weaken as her entire body pushes into the ");
				PostBoard.postInteractableLog("plant.", _onPottedPlantsClick);
				PostBoard.postLog("\nThe ");
				PostBoard.postInteractableLog("plant", _onPottedPlantsClick);
				PostBoard.postLog(" slowly bends as the woman is gently lowered to her knees.");
				PostBoard.postLog("\nThe woman slowly catches her breath and leans back onto her hands. She starts to rock back and forth, grinding her pussy against the ");
				PostBoard.postInteractableLog("plant's slit.", _onPottedPlantsClick);
				PostBoard.postLog("The woman takes short hastened breaths, her breasts bouncing with each reckless thrust.");
				PostBoard.postLog("\nLeaning forward, she pushes her clit against the ");
				PostBoard.postInteractableLog("plant", _onPottedPlantsClick);
				PostBoard.postLog(", slowly moaning louder and louder. The woman jerks up as if she was stretching, with a long drawn out moan, her body shudders.");
				PostBoard.Postlog("\nThe woman takes a deep breath as she collapses, the ")
				PostBoard.postInteractableLog("plant", _onPottedPlantsClick);
				PostBoard.postLog(" slowly lowering her to the ground as it brushed past her stomach, breasts, and face, spraying its nectar along the way.");
				char.addCleanlinessAttribute(Character.Descriptor.FINGERS, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.VAGINA, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.GROIN, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.BUTT, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.THIGHS, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.LEGS, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.FEET, Character.Cleanliness.GIRL_CUM_DRENCHED);
				char.addCleanlinessAttribute(Character.Descriptor.STOMACH, Character.Cleanliness.GIRL_CUM);
				char.addCleanlinessAttribute(Character.Descriptor.BREASTS, Character.Cleanliness.GIRL_CUM);
				char.addCleanlinessAttribute(Character.Descriptor.FACE, Character.Cleanliness.GIRL_CUM);
				char.addCleanlinessAttribute(Character.Descriptor.LIPS, Character.Cleanliness.GIRL_CUM);
				State.saveData.setFlag(SaveDataFlags.GrindedThePlant, true);
			_:
				PostBoard.postWhyWouldIDoThat();
