extends TextureButton

var Mode2 = load("res://Scenes/BaseMode.tscn");
var GamePlayMenu = load("res://Scenes/GamePlayUI.tscn");
signal initializeMode2(mode2,gamePlayMenu);


# Called when the node enters the scene tree for the first time.
func _ready():
    connect("initializeMode2",get_parent().get_parent().get_parent(),"on_root_initializeMode2");
    connect("button_up",self,"on_Mode2Button_button_up");
    pass


func on_Mode2Button_button_up():
	get_parent().get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX").play(0.0);
	emit_signal("initializeMode2",Mode2,GamePlayMenu);
	pass