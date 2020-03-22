extends TextureButton

var Mode1 = load("res://Scenes/BaseMode.tscn");
var GamePlayMenu = load("res://Scenes/GamePlayUI.tscn");
signal initializeMode1(mode1,gamePlayMenu);


# Called when the node enters the scene tree for the first time.
func _ready():
    connect("initializeMode1",get_parent().get_parent().get_parent(),"on_root_initializeMode1");
    connect("button_up",self,"on_Mode1Button_button_up");
    pass


func on_Mode1Button_button_up():
	get_parent().get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX").play(0.0);
	emit_signal("initializeMode1",Mode1,GamePlayMenu);
	pass