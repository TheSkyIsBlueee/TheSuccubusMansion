@tool
extends Container

func _notification(what):
	if what == NOTIFICATION_SORT_CHILDREN:		
		var totalWidth: int = self.size.x;
		var writtenWidth: int = 0;
		var currentY: int = 0;
		var lineHeight: int = 0;
		
		for child in get_children():
			if child is Label:
				var isNewLineChar = child.text == "\n";
				
				if writtenWidth + child.size.x > totalWidth || isNewLineChar:
					currentY += lineHeight;
					writtenWidth = 0;
					lineHeight = 0;
					if isNewLineChar:
						continue;
				
				if lineHeight < child.size.y:
					lineHeight = child.size.y;
				
				child.set_position(Vector2(writtenWidth, currentY));
				writtenWidth += child.size.x;
			else:
				printerr("FlowContainer only supports labels.");

