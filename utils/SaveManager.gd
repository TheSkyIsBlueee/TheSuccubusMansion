extends RefCounted

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
	SaveState.saveFileName = "save_" + _getNewSaveTime() +  "_" + str(slotNumber) + _SAVES_FILE_EXT;
	SaveState.saveData = load("res://templates/save_template.json").data;
	var file: FileAccess = FileAccess.open(_SAVES_PATH + "/" + SaveState.saveFileName, FileAccess.WRITE);
	file.store_line(JSON.stringify(SaveState.saveData));
	file.close();
	_loadData();

static func save():
	var oldFileName = SaveState.saveFileName;
	var nameParts = SaveState.saveFileName.split("_");
	nameParts[1] = _getNewSaveTime()
	SaveState.saveFileName = "_".join(nameParts);
	var file: FileAccess = FileAccess.open(_SAVES_PATH + "/" + SaveState.saveFileName, FileAccess.WRITE);
	file.store_line(JSON.stringify(SaveState.saveData));
	file.close();
	
	DirAccess.open(_SAVES_PATH).remove(oldFileName);

static func getSaveSlots() -> PackedStringArray:
	if !DirAccess.open(_SAVES_PREFIX).dir_exists(_SAVES_DIR):
		DirAccess.open(_SAVES_PREFIX).make_dir(_SAVES_DIR);
	var saves = DirAccess.open(_SAVES_PATH);
	return saves.get_files();

static func loadSave(saveslot: String):
	SaveState.saveData = JSON.parse_string(FileAccess.get_file_as_string(_SAVES_PATH + "/" + saveslot));
	SaveState.saveFileName = saveslot;
	SaveState.isSaveLoaded = true;
	_loadData();

static func _loadData():
	ActiveContentController.setController(load(SaveState.saveData.activeScene).new());

static func deleteSave(saveslot: String):
	DirAccess.open(_SAVES_PATH).remove(saveslot);

