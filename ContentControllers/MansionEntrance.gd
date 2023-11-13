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
	PostBoard.postLog("\n\nThe woman looked over the ");
	PostBoard.postInteractableLog("courtyard", _onCourtYardClick);
	PostBoard.postLog(", a ");
	#PostBoard.postInteractableLog("sweet musky scent", _onMuskyScentClick);
	PostBoard.postLog(" was in the air.");
	PostBoard.postLog("\nThe woman's shoulder's lowered slightly as she took a deep breath.");
	PostBoard.postLog("Looking past the courtyard, a large mansion stood.");
	PostBoard.postLog("\n\nThe mansion was very wide and appeared to be 2 stories tall. The center of the mansion had a ");
	#PostBoard.postInteractableLog("large wooden door", _onLargeWoodenDoorClick);
	PostBoard.postLog(" with a few stone steps leading towards it.");
	PostBoard.postLog("\n\nThe west and east wings of the the courtyard seemed to mostly mirrored each other with some ");
	#PostBoard.postInteractableLog("potted plants", _onPottedPlantsClick);
	PostBoard.postLog(" and ");
	#PostBoard.postInteractableLog("stone benches.", _onStoneBenchClick);
	PostBoard.postLog("\n\nEach side had it's own ");
	#PostBoard.postInteractableLog("large fountain", _onFountainClick);
	PostBoard.postLog(" in the center.");
	PostBoard.postLog("\n\nBetween the fountain and building stood a ");
	#PostBoard.postInteractableLog("massive statue", _onStatueClick);


func _onGatesClick(event):
	if isGuiClickEvent(event):
		State.saveData.setFlag(SaveDataFlags.UnlockedCharacterDescription, true);
		
		if State.saveData.getFlag(SaveDataFlags.OpenedMansionEntranceGate):
			PostBoard.postLog("\n\nThe ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(" is open.");
			return;
		
		if State.getActiveDescriptor() == Character.Descriptor.FACE:
			PostBoard.postLog("\n\nThe ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(" towers over the woman. There does not appear to be any locks on it. Maybe you should try opening it.");
			PostBoard.postLog("\n\n\nTUTORIAL: Some points of interest have multiple ways to interact with them. One common way is to use different parts of the woman's body on the points of interest. On the left side, you will now see the a description of the woman. Try clicking on points of interest in the description and then on the gate.");
		elif State.getActiveDescriptor() == Character.Descriptor.FINGERS:
			PostBoard.postLog("\n\nThe woman gently pushes the ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(", surprisingly it opens with little resistance.");
			State.saveData.setFlag(SaveDataFlags.OpenedMansionEntranceGate, true);
		elif State.getActiveDescriptor() == Character.Descriptor.BREASTS:
			PostBoard.postLog("\n\nThe woman takes a step forward as she scans the ");
			PostBoard.postInteractableLog("courtyard", _onCourtYardClick);
			PostBoard.postLog(" from behind the ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(". Her breasts push up against the ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(", surprisingly it opened with little resistance.");
			State.saveData.setFlag(SaveDataFlags.OpenedMansionEntranceGate, true);
		elif State.getActiveDescriptor() == Character.Descriptor.FEET:
			PostBoard.postLog("\n\nThe woman helds her hands behind her back. She raised her foot and gave the ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(" a gentle tap, surprisingly it opened slightly with little resistance. Her head tilted while staring at the partially opened ");
			PostBoard.postInteractableLog("gate", _onGatesClick);
			PostBoard.postLog(". Shrugging, she reaches out and pushes it open.");
			State.saveData.setFlag(SaveDataFlags.OpenedMansionEntranceGate, true);
		else:
			PostBoard.postLog("\n\nThe woman chuckles to herself. \"What a silly thought, why would I do that?\"");

