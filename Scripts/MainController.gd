extends Control

const ContentController = preload("res://ContentControllers/ContentController.gd");
const SaveManager = preload("res://utils/SaveManager.gd");

var _logList: Node;

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_cancel_quit_pressed();
	_logList = $Row/Background/SceneLog/LogListContainer/LogList;
	PostBoard.setPostBoard(_logList);
	ActiveContentController.setController(load("res://ContentControllers/MainMenu.gd").new());

func _on_save_pressed():
	if SaveState.isSaveLoaded:
		SaveManager.save();
		PostBoard.postLog("\n\nGame saved.\n\n");

func _on_load_pressed():
	ActiveContentController.addFragmentController(load("res://FragmentContentControllers/LoadSaveSlot.gd").new());

func _on_quit_pressed():
	if !SaveState.isSaveLoaded:
		_on_quit_anyways_pressed();
		pass;

	$Row/LeftColumn/SystemButtons/Save.hide();
	$Row/LeftColumn/SystemButtons/Load.hide();
	$Row/LeftColumn/SystemButtons/Quit.hide();
	$Row/LeftColumn/SystemButtons/SaveQuit.show();
	$Row/LeftColumn/SystemButtons/QuitAnyways.show();
	$Row/LeftColumn/SystemButtons/CancelQuit.show();

func _on_quit_anyways_pressed():
	GlobalGetTree.quit();

func _on_cancel_quit_pressed():
	$Row/LeftColumn/SystemButtons/Save.show();
	$Row/LeftColumn/SystemButtons/Load.show();
	$Row/LeftColumn/SystemButtons/Quit.show();
	$Row/LeftColumn/SystemButtons/SaveQuit.hide();
	$Row/LeftColumn/SystemButtons/QuitAnyways.hide();
	$Row/LeftColumn/SystemButtons/CancelQuit.hide();

func _on_save_quit_pressed():
	_on_save_pressed();
	_on_quit_anyways_pressed();

func _on_reload_scene_pressed():
	ActiveContentController.reloadScene();
