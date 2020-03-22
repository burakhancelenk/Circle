extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RestartButton_button_up():
	get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX").play(0.0);
	get_parent().get_node("PassButton").SetDisableButton(false);
	if get_parent().get_parent().get_node("Mode1").get_node("Circles").mode == 1 :
		get_parent().get_parent().get_node("Mode1").get_node("Circles").CalculateGameLogic(10,3);
		get_parent().get_node("PassButton").maxInteractTime = 10;
		get_parent().get_node("PassButton").interactTime = 10;
	else:
		get_parent().get_parent().get_node("Mode1").get_node("Circles").CalculateGameLogic(3);
		for i in range(1,5):
			get_parent().get_parent().get_node("Mode1").get_node("Circles").get_node("Circle"+String(i)).rotation_degrees = 0;
			pass
		get_parent().get_node("PassButton").health = 4;
		pass
	if get_parent().get_node("PlayPauseButton").gamePaused == true:
		get_parent().get_node("PlayPauseButton")._on_PlayPauseButton_button_up();
	else:
		get_parent().get_node("EndGameMenu").visible = false;
		get_parent().get_node("PlayPauseButton").visible = true;
		pass
	get_parent().get_node("PassButton").difficultyLevel = 3;
	get_parent().get_node("Score").get_node("ScoreLabel").setScore(0.0,false);
	get_parent().get_node("PassButton").score = 0;
	for i in range(1,5):
		get_parent().get_node("RemainTimeIndicator").get_node("Indicator"+String(i)).visible = true;
		pass
	pass # Replace with function body.


func _on_MainMenuButton_button_up():
	get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX").play(0.0);
	Engine.set_time_scale(1.0);
	get_parent().get_parent().load_main_menu();
	pass # Replace with function body.
