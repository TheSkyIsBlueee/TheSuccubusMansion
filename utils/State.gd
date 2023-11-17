extends Node

const SaveData = preload("res://models/SaveData.gd");
const Character = preload("res://models/Character.gd");

signal OnSaveLoaded;
signal OnFlagUpdate;
var isSaveLoaded: bool = false : get = _getIsSaveLoaded;
var saveData: SaveData : set = _setSaveData, get = _getSaveData;
var activeDescriptor: Character.Descriptor : set = _setActiveDescriptor, get = _getActiveDescriptor;

func _setSaveData(data: SaveData):
	if saveData:
		saveData.OnFlagUpdate.disconnect(_onFlagUpdate);
	
	saveData = data;
	saveData.OnFlagUpdate.connect(_onFlagUpdate);
	OnSaveLoaded.emit();

func _onFlagUpdate(key: String, enabled: bool):
	OnFlagUpdate.emit(key, enabled);

func _getSaveData() -> SaveData:
	return saveData;

func _getIsSaveLoaded() -> bool:
	return isSaveLoaded;

func _getActiveDescriptor() -> Character.Descriptor:
	return activeDescriptor;

func _setActiveDescriptor(descriptor: Character.Descriptor):
	activeDescriptor = descriptor;

func _ready():
	activeDescriptor = Character.Descriptor.FACE;
