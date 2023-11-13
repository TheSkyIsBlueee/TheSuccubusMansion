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

func onNewGameClick(event):
	if isGuiClickEvent(event):
		SaveManager.newSave();

func onLoadClick(event):
	if isGuiClickEvent(event):
		PostBoard.postLog("\n\n\n\n\n");
		var saveSlots = SaveManager.getSaveSlots();
		if saveSlots.size() == 0:
			PostBoard.postLog("\nNo saves found.");
		else:
			for save in saveSlots:
				var dataParts = SaveManager.splitSaveSlot(save);
				PostBoard.postLog("\nSave " + dataParts[2] + " - " + SaveManager.saveTimeToDateTime(String(dataParts[1])) + " | ");
				PostBoard.postInteractableLog("Load", _onLoadSaveClick.bind(save));
				PostBoard.postLog(" | ");
				PostBoard.postInteractableLog("Delete", _onDeleteSaveClick.bind(save));

		PostBoard.postInteractableLog("\nBack", _onLoadBackClick);

func _onLoadSaveClick(event, save: String):
	if isGuiClickEvent(event):
		SaveManager.loadSave(save);

func _onDeleteSaveClick(event, save: String):
	if isGuiClickEvent(event):
		PostBoard.clear();
		var dataParts = SaveManager.splitSaveSlot(save);
		PostBoard.postLog("\nSave " + dataParts[2] + " - " + SaveManager.saveTimeToDateTime(String(dataParts[1])) + " | ");
		PostBoard.postLog("\nAre you sure you want to delete this save? This can not be reversed.");
		PostBoard.postInteractableLog("\nConfirm", _onDeleteConfirmClick.bind(save));
		PostBoard.postLog(" | ");
		PostBoard.postInteractableLog("Cancel", _onDeleteCancelClick);

func _onDeleteConfirmClick(event, save: String):
	if isGuiClickEvent(event):
		SaveManager.deleteSave(save);
		PostBoard.clear();
		onLoadClick(event);

func _onDeleteCancelClick(event):
	if isGuiClickEvent(event):
		PostBoard.clear();
		onLoadClick(event);

func _onLoadBackClick(event):
	if isGuiClickEvent(event):
		run();

func onExitClick(event):
	if isGuiClickEvent(event):
		GlobalGetTree.quit();
