extends RefCounted
class_name ContentController;

func run():
	printerr("ContentController._run is abstract.");
	return;

func isGuiClickEvent(event) -> bool:
	return event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed;
