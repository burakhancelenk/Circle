extends TextureButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ChangeColorsButton_button_up():
	get_parent().get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX").play(0.0);
	get_parent().get_parent().get_node("ColorPicker").visible = true ;
	get_parent().visible = false;
	pass # Replace with function body.
