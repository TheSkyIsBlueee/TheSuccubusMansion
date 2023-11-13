extends Control

const ContentController = preload("res://ContentControllers/ContentController.gd");

var _logList: Node;

# Called when the node enters the scene tree for the first time.
func _ready():
	_logList = $Row/Background/SceneLog/LogListContainer/LogList;
	PostBoard.setPostBoard(_logList);
	ActiveContentController.setController(load("res://ContentControllers/MainMenu.gd").new());

