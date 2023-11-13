extends RefCounted

const Character = preload("res://models/Character.gd");

var _saveData: Dictionary;
var _saveFileName: String;
var _character: Character;

signal OnFlagUpdate;

func _init(saveData: Dictionary, fileName: String):
	_saveData = saveData;
	_saveFileName = fileName;
	_character = Character.new();
	_character.setData(saveData.characterDescription);

func _setAttribute(key: String, data: Variant):
	_saveData[key] = data;

func setFlag(key: String, enabled: bool):
	_saveData.flags[key] = enabled;
	OnFlagUpdate.emit(key, enabled);

func getFlag(key: String) -> bool:
	return _saveData.flags[key];

func setCharacter(descriptorDict: Dictionary):
	_setAttribute("characterDescription", descriptorDict);

func getCharacter() -> Character:
	return _character;

func setActiveScene(scene: String):
	_setAttribute("activeScene", scene);

func getActiveScene() -> String:
	return _saveData.activeScene;

func getData() -> Dictionary:
	return _saveData;

func getFileName() -> String:
	return _saveFileName;

func setFileName(name: String):
	_saveFileName = name;
