extends ContentController

const Log = preload("res://Scripts/Log.gd");
const InteractableLog = preload("res://Scripts/InteractableLog.gd");
const SaveManager = preload("res://utils/SaveManager.gd");

func run():
	var title = Log.new();
	title.text = "\nThe Succubus' Mansion";
	title.theme = load("res://UI/TitleFont.tres");
	PostBoard.post(title);
	PostBoard.postLog("\nA story about a woman's journey through a very lewd mansion.");
	PostBoard.postInteractableLog("\nNew Game", onNewGameClick);
	PostBoard.postLog(" | ");
	PostBoard.postInteractableLog("Load", onLoadClick);
	PostBoard.postLog(" | ");
	PostBoard.postInteractableLog("Exit", onExitClick);

func onInteractableLogClick(event, ilog):
	if isGuiClickEvent(event):
		match ilog:
			"\nNew Game":
				pass;
			"Load":
				pass;
			"Exit":
				pass;

func onNewGameClick(event):
	if isGuiClickEvent(event):
		SaveManager.newSave();

func onLoadClick(event):
	if isGuiClickEvent(event):
		ActiveContentController.addFragmentController(load("res://FragmentContentControllers/LoadSaveSlot.gd").new());

func onExitClick(event):
	if isGuiClickEvent(event):
		GlobalGetTree.quit();
