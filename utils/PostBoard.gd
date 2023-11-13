extends Node

const Log = preload("res://Scripts/Log.gd");
const InteractableLog = preload("res://Scripts/InteractableLog.gd");

static var CHARACTERS_PER_SEC = 5;

var _postBoard: Node;

func setPostBoard(postBoard: Node):
	_postBoard = postBoard;

func post(message: Label):
	var textPieces = message.text.split("\n", true);
	
	var holder = [];
	var i:int = 1;
	var length:int = textPieces.size();
	for piece in textPieces:
		var spacePieces = piece.split(" ", true);
		for sPiece in spacePieces:
			sPiece += " ";
			holder.append(sPiece);

		if i != length:
			holder.append("\n");
		i += 1;
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

func clear():
	for child in _postBoard.get_children():
		child.queue_free();
