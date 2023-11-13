extends Node

const ContentController = preload("res://ContentControllers/ContentController.gd");

var _activeController: ContentController;

func setController(controller: ContentController):
	PostBoard.clear();
	_activeController = controller;
	_activeController.run();
