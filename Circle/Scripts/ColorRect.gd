extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var clickSoundFX;
# Called when the node enters the scene tree for the first time.
func _ready():
	clickSoundFX = get_parent().get_parent().get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX");
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_ColorRect_button_up():
	clickSoundFX.play(0.0);
	get_parent().get_parent().choosedColor = get("custom_styles/normal").get_bg_color();
	get_parent().get_parent().SetColorToNode();
	pass # Replace with function body.
