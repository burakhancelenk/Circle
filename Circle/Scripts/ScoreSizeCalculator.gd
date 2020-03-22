extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lineWidth = 134;
var charWidth = float(get_line_height())/2;
var maxFontSize = 104;
var minFontSize = 40;
signal scoreChanged(isIncreased);


func setScore(paramScore,isIncreased):
	text = String(paramScore);
	emit_signal("scoreChanged",isIncreased);
	pass

func ChangeSize(isIncreased):
	if isIncreased:
		while text.length()*charWidth >= lineWidth:
			charWidth -= 0.5;
			if charWidth*2 <= minFontSize:
				charWidth = minFontSize/2;
				break;
				pass 
			pass
		get("custom_fonts/font").set_size(charWidth*2);
	else:
		while text.length()*charWidth <= lineWidth:
			charWidth += 0.5;
			if charWidth >= maxFontSize:
				charWidth = maxFontSize/2;
				break;
				pass
			pass
		get("custom_fonts/font").set_size(charWidth*2);
		pass
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

