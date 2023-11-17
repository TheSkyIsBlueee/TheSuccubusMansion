extends Node

const Log = preload("res://Scripts/Log.gd");
const InteractableLog = preload("res://Scripts/InteractableLog.gd");

static var CHARACTERS_PER_SEC = 5;

var _postBoard: Node;

func setPostBoard(postBoard: Node):
	_postBoard = postBoard;

func post(message: Label):
	var textPieces = message.text.replace("\n", "<newline>\n<newline>").split("<newline>", true);
	
	var holder = [];
	for piece in textPieces:
		var spacePieces = piece.replace(" ", " <space>").split("<space>", true);
		for sPiece in spacePieces:
			holder.append(sPiece);
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

func postHowWouldThatWork():
	PostBoard.postLog("\n\nThe woman chuckles to herself. \"What a silly thought, how would that even work?\"");

func postWhyWouldIDoThat():
	PostBoard.postLog("\n\nThe woman chuckles to herself. \"What a silly thought, why would I do that?\"");
