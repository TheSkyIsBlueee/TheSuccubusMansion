extends Node

const ContentController = preload("res://ContentControllers/ContentController.gd");

var _activeController: ContentController;
var _fragmentControllers: Array;

func setController(controller: ContentController, updateActiveScene: bool = true):
	PostBoard.clear();
	_activeController = controller;
	if updateActiveScene:
		State.saveData.setActiveScene(controller.get_script().get_path());
	_activeController.run();

func reloadScene():
	PostBoard.clear();
	_activeController.run();

func addFragmentController(controller: ContentController):
	_fragmentControllers.append(controller);
	controller.run();

func removeFragmentController(controller: ContentController):
	var index = _fragmentControllers.rfind(controller);
	_fragmentControllers.remove_at(index);
