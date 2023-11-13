extends Label

class_name Log

func _init():
	autowrap_mode = TextServer.AUTOWRAP_WORD;
	theme = preload("res://UI/StandardFont.tres");
