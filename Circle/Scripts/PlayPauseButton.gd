extends TextureButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gamePaused = false;
var playSprite = load("res://Images/PlayButtonImage-01.png");
var pauseSprite = load("res://Images/PauseButtonImage-01.png");

# Called when the node enters the scene tree for the first time.
func _ready():
	gamePaused=false;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayPauseButton_button_up():
	get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX").play(0.0);
	if gamePaused :
		Engine.set_time_scale(1.0);
		self.set_normal_texture(pauseSprite);
		get_parent().get_node("PauseMenu").visible = false;
		get_parent().get_node("PassButton").SetDisableButton(false);
		gamePaused = false;
	else:
		Engine.set_time_scale(0.0);
		self.set_normal_texture(playSprite);
		get_parent().get_node("PauseMenu").visible = true;
		get_parent().get_node("PassButton").SetDisableButton(true);
		gamePaused = true;
	pass # Replace with function body.
