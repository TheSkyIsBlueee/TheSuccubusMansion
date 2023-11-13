extends ContentController

const Log = preload("res://Scripts/Log.gd");
const InteractableLog = preload("res://Scripts/InteractableLog.gd");

func run():
	var title = Log.new();
	title.text = "The Succubus' Mansion";
	title.theme = load("res://UI/TitleFont.tres");
	PostBoard.post(title);
	PostBoard.postLog("\nA story about a woman's journey through a very lewd mansion.");
	PostBoard.postInteractableLog("\nNew Game", onNewGameClick);
	PostBoard.postLog(" | ");
	PostBoard.postInteractableLog("Load", onLoadClick);
	PostBoard.postLog(" | ");
	PostBoard.postInteractableLog("Exit", onExitClick);

func onNewGameClick(event):
	if isGuiClickEvent(event):
		ActiveContentController.setController(load("res://ContentControllers/OpeningScene.gd").new());

func onLoadClick(event):
	pass;

func onExitClick(event):
	if isGuiClickEvent(event):
		GlobalGetTree.quit();
