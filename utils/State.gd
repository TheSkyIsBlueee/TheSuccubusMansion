extends Node

const SaveData = preload("res://models/SaveData.gd");
const Character = preload("res://models/Character.gd");

signal OnSaveLoaded;
var isSaveLoaded: bool = false : set = _setIsSaveLoaded, get = _getIsSaveLoaded;

func _setIsSaveLoaded(value: bool):
	isSaveLoaded = value;
	if isSaveLoaded:
		OnSaveLoaded.emit();

func _getIsSaveLoaded() -> bool:
	return isSaveLoaded;

var saveData: SaveData;

var _activeDescriptor: Character.Descriptor;

func getActiveDescriptor() -> Character.Descriptor:
	return _activeDescriptor;

func setActiveDescriptor(descriptor: Character.Descriptor):
	_activeDescriptor = descriptor;

func _ready():
	_activeDescriptor = Character.Descriptor.FACE;
