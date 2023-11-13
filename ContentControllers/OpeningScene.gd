extends ContentController

const Log = preload("res://Scripts/Log.gd");
const InteractableLog = preload("res://Scripts/InteractableLog.gd");

func run():
	var title = Log.new();
	title.text = "The Succubus' Mansion";
	title.theme = load("res://UI/TitleFont.tres");
	PostBoard.post(title);
	PostBoard.postLog("\nA young woman walked through the forest. Her long black hair flowed gently in the wind. She wore a simple dress that wrapped snuggly around her wide hips and ");
	PostBoard.postInteractableLog("bountiful breasts.", _onBountifulBosom_gui_input);
	PostBoard.postLog("\nBirds chirping, wind blowing, her soft humming, the forest was a peaceful lively place. Each step she took was filled with delight.");
	PostBoard.postLog("\nThe woman stops and gazes off into the forest, between the many trees was a ");
	PostBoard.postInteractableLog("glimmering light.", _onGlimmeringLight_gui_input);
	PostBoard.postLog("\n\n\nTUTORIAL: Throughout this game there will be hidden points of interest in the text. Some of these will reveal optional content, others will be required to progress through the game. Try clicking on \"glimmering light\" in the sentence above!\n\n\n");

func _onBountifulBosom_gui_input(event):
	if isGuiClickEvent(event):
		PostBoard.postLog("\nThe woman looked down towards her chest. Her toes hid behind her breasts.");

func _onGlimmeringLight_gui_input(event):
	if isGuiClickEvent(event):
		PostBoard.postLog("\nGazing at the glimmering light, she pondered \"Should I go?\"")
		PostBoard.postInteractableLog("\nGo to the Glimmering Light", _onGoToGlimmeringLight_gui_input);
		PostBoard.postLog(" | ");
		PostBoard.postInteractableLog("Stay Here", _onStayHere_gui_input);

func _onStayHere_gui_input(event):
	if isGuiClickEvent(event):
		PostBoard.postLog("\nThe woman looks away, not moving from her spot. Yet she couldn't help but gaze towards the ");
		PostBoard.postInteractableLog("glimmering light", _onGoToGlimmeringLight_gui_input);
		PostBoard.postLog(" again a few moments later.");

func _onGoToGlimmeringLight_gui_input(event):
	if isGuiClickEvent(event):
		ActiveContentController.setController(load("res://ContentControllers/MansionEntrance.gd").new());
