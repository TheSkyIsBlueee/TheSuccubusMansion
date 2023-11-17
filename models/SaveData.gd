extends RefCounted

const Character = preload("res://models/Character.gd");

var data: Dictionary : get = _getData;
var fileName: String : set = _setFileName, get = _getFileName;
var character: Character : get = _getCharacter;

# Use State.OnFlagUpdate instead. State accounts for situations where SaveData is not loaded or a new SaveData is loaded.
signal OnFlagUpdate;

func _init(saveData: Dictionary, fname: String):
	data = saveData;
	fileName = fname;
	character = Character.new();
	if saveData.characterDescription:
		character.setData(saveData.characterDescription);
	else:
		_onCharacterDescriptionUpdate(character.data);
	character.OnDescriptionUpdate.connect(_onCharacterDescriptionUpdate);

func setFlag(key: String, enabled: bool):
	data.flags[key] = enabled;
	OnFlagUpdate.emit(key, enabled);

func getFlag(key: String) -> bool:
	return data.flags[key];

func setActiveScene(scene: String):
	_setAttribute("activeScene", scene);

func getActiveScene() -> String:
	return data.activeScene;

func _onCharacterDescriptionUpdate(cdata: Dictionary):
	data.characterDescription = cdata;

func _setAttribute(key: String, value: Variant):
	data[key] = value;

func _getCharacter() -> Character:
	return character;

func _getData() -> Dictionary:
	return data;

func _getFileName() -> String:
	return fileName;

func _setFileName(name: String):
	fileName = name;
