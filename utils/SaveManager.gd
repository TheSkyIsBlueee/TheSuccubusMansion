extends RefCounted

const Character = preload("res://models/Character.gd");
const SaveData = preload("res://models/SaveData.gd");

const _SAVES_PREFIX: String = "user://";
const _SAVES_DIR: String = "saves";
const _SAVES_PATH: String = _SAVES_PREFIX + _SAVES_DIR;
const _SAVES_FILE_EXT: String = "_.json";

static func _dateTimeToFileName(datetime: String) -> String:
	return datetime.replace(":", "C").replace(" ", "V");

static func saveTimeToDateTime(savetime: String) -> String:
	return savetime.replace("C", ":").replace("V", " ");

static func splitSaveSlot(saveslot: String) -> PackedStringArray:
	return saveslot.split("_");

static func _getNewSaveTime() -> String:
	return _dateTimeToFileName(Time.get_datetime_string_from_system(false, true));

static func newSave():
	if !DirAccess.open(_SAVES_PREFIX).dir_exists(_SAVES_DIR):
		DirAccess.open(_SAVES_PREFIX).make_dir(_SAVES_DIR);
	var saves = DirAccess.open(_SAVES_PATH);
	var saveSlots = saves.get_files();
	var slotNumber = 1;
	if saveSlots.size() != 0:
		slotNumber = int(saveSlots[-1].split("_")[2]);
	
	var dict = load("res://templates/save_template.json").data;
	var data = SaveData.new(
		dict,
		"save_" + _getNewSaveTime() +  "_" + str(slotNumber) + _SAVES_FILE_EXT
	);
	State.saveData = data;
	var file: FileAccess = FileAccess.open(_SAVES_PATH + "/" + State.saveData.fileName, FileAccess.WRITE);
	file.store_line(JSON.stringify(State.saveData.data));
	file.close();
	_loadData();

static func save():
	var oldFileName = State.saveData.fileName;
	var nameParts = State.saveData.fileName.split("_");
	nameParts[1] = _getNewSaveTime()
	State.saveData.fileName = "_".join(nameParts);
	var file: FileAccess = FileAccess.open(_SAVES_PATH + "/" + State.saveData.fileName, FileAccess.WRITE);
	file.store_line(JSON.stringify(State.saveData.data));
	file.close();
	
	DirAccess.open(_SAVES_PATH).remove(oldFileName);

static func getSaveSlots() -> PackedStringArray:
	if !DirAccess.open(_SAVES_PREFIX).dir_exists(_SAVES_DIR):
		DirAccess.open(_SAVES_PREFIX).make_dir(_SAVES_DIR);
	var saves = DirAccess.open(_SAVES_PATH);
	return saves.get_files();

static func loadSave(saveslot: String):
	State.saveData = SaveData.new(
		JSON.parse_string(FileAccess.get_file_as_string(_SAVES_PATH + "/" + saveslot)),
		saveslot
	);
	State.isSaveLoaded = true;
	_loadData();

static func _loadData():
	ActiveContentController.setController(load(State.saveData.getActiveScene()).new(), false);

static func deleteSave(saveslot: String):
	DirAccess.open(_SAVES_PATH).remove(saveslot);
