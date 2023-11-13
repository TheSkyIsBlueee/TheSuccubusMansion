extends Node

const Log = preload("res://Scripts/Log.gd");
const InteractableLog = preload("res://Scripts/InteractableLog.gd");

static var CHARACTERS_PER_SEC = 5;
const _TAG_DELIMITER = "<i>";
const _TAG_MARK = "<im>";
const _INTERACTABLE_TAG = _TAG_DELIMITER + _TAG_MARK + _TAG_DELIMITER;

var _postBoard: Node;

func setPostBoard(postBoard: Node):
	_postBoard = postBoard;

func markInteractable(message: String):
	return _INTERACTABLE_TAG + message + _INTERACTABLE_TAG;

func post(message: Label):
	var textPieces = message.text.split("\n", true);
	var lastPiece = textPieces[-1];
	
	var holder = [];
	for piece in textPieces:
		var spacePieces = piece.split(" ", true);
		for sPiece in spacePieces:
			sPiece += " ";
			holder.append(sPiece);

		if piece != lastPiece:
			holder.append("\n");
	textPieces = holder;

	for piece in textPieces:
		var newChild = message.duplicate(5);
		newChild.text = piece;
		newChild.size = newChild.get_theme_font("font").get_string_size(
			newChild.text,
			newChild.horizontal_alignment,
			-1,
			newChild.get_theme_font_size("default_font_size")
		);

		# Duplicate does not correctly duplicate signals
		if message.gui_input.get_connections().size() > 0:
			newChild.gui_input.connect(message.gui_input.get_connections()[0].callable);

		_postBoard.add_child(newChild);

func postLog(message: String):
	var mlog = Log.new();
	mlog.text = message;
	PostBoard.post(mlog);

func postInteractableLog(message: String, onGuiInput: Callable):
	var ilog = InteractableLog.new();
	ilog.text = message;
	ilog.gui_input.connect(onGuiInput);
	PostBoard.post(ilog);

func testPostLog(message: String, onGuiInput: Callable):
	var pieces = message.split(_TAG_DELIMITER, false);
	var length = pieces.size();
	var i: int = 0;
	while i < length:
		var piece = pieces[i];
		if piece == _TAG_MARK:
			piece = pieces[i + 1];
			
			var ilog = InteractableLog.new();
			ilog.text = piece;
			ilog.gui_input.connect(onGuiInput.bind(piece));
			PostBoard.post(ilog);
			
			i += 3;
		else:
			var mlog = Log.new();
			mlog.text = piece;
			PostBoard.post(mlog);
			i += 1;

func clear():
	for child in _postBoard.get_children():
		child.queue_free();
