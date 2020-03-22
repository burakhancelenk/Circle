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


func _on_BackButton_button_up():
	get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX").play(0.0);
	if get_parent().get_node("Settings").visible == true:
		get_parent().get_node("Settings").visible = false;
		get_parent().get_node("Main").visible = true;
		if get_parent().get_parent().hasToSaveGame == true :
			get_parent().get_parent().save_information();
			get_parent().get_parent().hasToSaveGame = false;
			pass
		self.visible = false;
	elif get_parent().get_node("ColorPicker").visible == true:
		get_parent().get_node("ColorPicker").visible = false;
		get_parent().get_node("Settings").visible = true;
	else:
		get_parent().get_node("Store").visible = false;
		get_parent().get_node("Main").visible = true;
		self.visible = false;
		pass
	pass # Replace with function body.
