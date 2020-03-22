extends Node

var mainMenuScene = load("res://Scenes/MainMenu.tscn");
var passButtonScript = load("res://Scripts/PassButton.gd");
var passButton2Script = load("res://Scripts/PassButton2.gd");
var circleLogicScript = load("res://Scripts/CircleLogic.gd");
var circleLogic2Script = load("res://Scripts/CircleLogic2.gd");
var gameData = {
	"CircleColor":"#00ffcc",
	"RemainTimeColor":"#f2932c",
	"PlayPauseButtonColor":"#00ffcc",
	"ScoreColor":"#007f7a",
	"MiddleCircleColor":"#dedc6c",
	"BackgroundColor":"#fafce3",
	"SoundFXLevel":"100",
	"Mode1Score":"0",
	"Mode2Score":"0"
};
var hasToSaveGame = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	load_information();
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SoundFX"),float((int(gameData["SoundFXLevel"])/100)*70-70));
	get_node("Control").get_node("ColorRect").color = Color(gameData["BackgroundColor"]);
	var mainMenu = mainMenuScene.instance();
	mainMenu.get_node("ColorPicker").mainMenu = mainMenu;
	mainMenu.get_node("Settings").get_node("SoundFXScrollBar").set_value(float(gameData["SoundFXLevel"]));
	mainMenu.get_node("ColorPicker").get_node("Preview").get_node("Background").color = Color(gameData["BackgroundColor"]);
	for i in range(1,5):
		mainMenu.get_node("ColorPicker").get_node("Preview").get_node("Circles").get_node("Circle"+String(i)).self_modulate = Color(gameData["CircleColor"]);
		mainMenu.get_node("ColorPicker").get_node("Preview").get_node("RemainTime").get_node("Indicator"+String(i)).self_modulate = Color(gameData["RemainTimeColor"]);
		pass
	mainMenu.get_node("ColorPicker").get_node("Preview").get_node("MiddleCircle").self_modulate = Color(gameData["MiddleCircleColor"]);
	mainMenu.get_node("ColorPicker").get_node("Preview").get_node("Score").self_modulate = Color(gameData["ScoreColor"]);
	mainMenu.get_node("ColorPicker").get_node("Preview").get_node("PlayPauseButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Main").get_node("Mode1Button").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Main").get_node("Mode2Button").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Main").get_node("SettingsButton").self_modulate = Color(gameData["RemainTimeColor"]);
	mainMenu.get_node("Main").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("Main").get_node("Label2").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("Main").get_node("Label3").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("Main").get_node("GameLogo").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Settings").get_node("SoundFXLabel").self_modulate = Color(gameData["RemainTimeColor"]);
	mainMenu.get_node("Settings").get_node("ChangeColorsButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Settings").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("Settings").get_node("SoundFXScrollBar").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton2").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton2").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton3").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton3").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton4").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton4").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton5").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton5").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton6").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton6").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("DefaultButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("DefaultButton").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ApplyButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ApplyButton").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("BackButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("BackButton").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	add_child(mainMenu);
	pass # Replace with function body.
	
	
func on_root_initializeMode1(mode1,gamePlayMenu):
	var mode1Node = mode1.instance();
	var gamePlayMenuNode = gamePlayMenu.instance();
	mode1Node.get_node("Circles").set_script(circleLogicScript);
	gamePlayMenuNode.get_node("PassButton").set_script(passButtonScript);
	for i in range(4):
        mode1Node.get_node("Circles").circles[i] = mode1Node.get_node("Circles").get_node("Circle"+String(i+1));
        pass
	mode1Node.get_node("Circles").passButtonController = gamePlayMenuNode.get_node("PassButton");
	gamePlayMenuNode.get_node("PassButton").circlesNode = mode1Node.get_node("Circles");
	gamePlayMenuNode.get_node("PassButton").remainTimeNode = gamePlayMenuNode.get_node("RemainTimeIndicator");
	gamePlayMenuNode.get_node("PassButton").scoreNode = gamePlayMenuNode.get_node("Score").get_node("ScoreLabel");
	for i in range(4):
        gamePlayMenuNode.get_node("PassButton").circles[i] = mode1Node.get_node("Circles").get_node("Circle"+String(i+1));
        pass
	# color atamaları
	for i in range(1,5):
		mode1Node.get_node("Circles").get_node("Circle"+String(i)).self_modulate = Color(gameData["CircleColor"]);
		gamePlayMenuNode.get_node("RemainTimeIndicator").get_node("Indicator"+String(i)).self_modulate = Color(gameData["RemainTimeColor"]);
		pass
	mode1Node.get_node("LightedSphere").get_node("SphereBackground").self_modulate = Color(gameData["MiddleCircleColor"]);
	gamePlayMenuNode.get_node("PlayPauseButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	gamePlayMenuNode.get_node("Score").get_node("ScoreLabel").self_modulate = Color(gameData["ScoreColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("Background").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("RestartButton").self_modulate = Color(gameData["BackgroundColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("MainMenuButton").self_modulate = Color(gameData["BackgroundColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("RestartButton").get_node("Label").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("MainMenuButton").get_node("Label").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("Background").self_modulate = Color(gameData["RemainTimeColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("RestartButton").self_modulate = Color(gameData["BackgroundColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("MainMenuButton").self_modulate = Color(gameData["BackgroundColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("RestartButton").get_node("Label").self_modulate = Color(gameData["RemainTimeColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("MainMenuButton").get_node("Label").self_modulate = Color(gameData["RemainTimeColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("HighestScoreText").self_modulate = gameData["RemainTimeColor"];
	gamePlayMenuNode.get_node("EndGameMenu").get_node("HighestScore").self_modulate = gameData["RemainTimeColor"];
	gamePlayMenuNode.get_node("EndGameMenu").get_node("HighestScore").text = gameData["Mode1Score"];
	gamePlayMenuNode.get_node("EndGameMenu").get_node("FinalScoreText").self_modulate = gameData["RemainTimeColor"];
	gamePlayMenuNode.get_node("EndGameMenu").get_node("FinalScore").self_modulate = gameData["RemainTimeColor"];
	add_child(mode1Node);
	add_child(gamePlayMenuNode);
	remove_child(get_node("MainMenu"));
	pass

func on_root_initializeMode2(mode2,gamePlayMenu):
	var mode2Node = mode2.instance();
	var gamePlayMenuNode = gamePlayMenu.instance();
	gamePlayMenuNode.get_node("PassButton").set_script(passButton2Script);
	mode2Node.get_node("Circles").set_script(circleLogic2Script);
	for i in range(4):
        mode2Node.get_node("Circles").circles[i] = mode2Node.get_node("Circles").get_node("Circle"+String(i+1));
        pass
	mode2Node.get_node("Circles").passButton = gamePlayMenuNode.get_node("PassButton");
	gamePlayMenuNode.get_node("PassButton").circlesNode = mode2Node.get_node("Circles");
	gamePlayMenuNode.get_node("PassButton").remainTimeNode = gamePlayMenuNode.get_node("RemainTimeIndicator");
	gamePlayMenuNode.get_node("PassButton").scoreNode = gamePlayMenuNode.get_node("Score").get_node("ScoreLabel");
	for i in range(4):
        gamePlayMenuNode.get_node("PassButton").circles[i] = mode2Node.get_node("Circles").get_node("Circle"+String(i+1));
        pass
	# color atamaları
	for i in range(1,5):
		mode2Node.get_node("Circles").get_node("Circle"+String(i)).self_modulate = Color(gameData["CircleColor"]);
		gamePlayMenuNode.get_node("RemainTimeIndicator").get_node("Indicator"+String(i)).self_modulate = Color(gameData["RemainTimeColor"]);
		pass
	mode2Node.get_node("LightedSphere").get_node("SphereBackground").self_modulate = Color(gameData["MiddleCircleColor"]);
	gamePlayMenuNode.get_node("PlayPauseButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	gamePlayMenuNode.get_node("Score").get_node("ScoreLabel").self_modulate = Color(gameData["ScoreColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("Background").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("RestartButton").self_modulate = Color(gameData["BackgroundColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("MainMenuButton").self_modulate = Color(gameData["BackgroundColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("RestartButton").get_node("Label").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	gamePlayMenuNode.get_node("PauseMenu").get_node("MainMenuButton").get_node("Label").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("Background").self_modulate = Color(gameData["RemainTimeColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("RestartButton").self_modulate = Color(gameData["BackgroundColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("MainMenuButton").self_modulate = Color(gameData["BackgroundColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("RestartButton").get_node("Label").self_modulate = Color(gameData["RemainTimeColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("MainMenuButton").get_node("Label").self_modulate = Color(gameData["RemainTimeColor"]);
	gamePlayMenuNode.get_node("EndGameMenu").get_node("HighestScoreText").self_modulate = gameData["RemainTimeColor"];
	gamePlayMenuNode.get_node("EndGameMenu").get_node("HighestScore").self_modulate = gameData["RemainTimeColor"];
	gamePlayMenuNode.get_node("EndGameMenu").get_node("HighestScore").text = gameData["Mode2Score"];
	gamePlayMenuNode.get_node("EndGameMenu").get_node("FinalScoreText").self_modulate = gameData["RemainTimeColor"];
	gamePlayMenuNode.get_node("EndGameMenu").get_node("FinalScore").self_modulate = gameData["RemainTimeColor"];
	add_child(mode2Node);
	add_child(gamePlayMenuNode);
	remove_child(get_node("MainMenu"));
	pass
	
func load_main_menu():
	var mainMenu = mainMenuScene.instance();
	mainMenu.get_node("ColorPicker").mainMenu = mainMenu;
	mainMenu.get_node("Settings").get_node("SoundFXScrollBar").set_value((int(gameData["SoundFXLevel"])+60)*100/60);
	mainMenu.get_node("ColorPicker").get_node("Preview").get_node("Background").color = Color(gameData["BackgroundColor"]);
	for i in range(1,5):
		mainMenu.get_node("ColorPicker").get_node("Preview").get_node("Circles").get_node("Circle"+String(i)).self_modulate = Color(gameData["CircleColor"]);
		mainMenu.get_node("ColorPicker").get_node("Preview").get_node("RemainTime").get_node("Indicator"+String(i)).self_modulate = Color(gameData["RemainTimeColor"]);
		pass
	mainMenu.get_node("ColorPicker").get_node("Preview").get_node("MiddleCircle").self_modulate = Color(gameData["MiddleCircleColor"]);
	mainMenu.get_node("ColorPicker").get_node("Preview").get_node("Score").self_modulate = Color(gameData["ScoreColor"]);
	mainMenu.get_node("ColorPicker").get_node("Preview").get_node("PlayPauseButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Main").get_node("Mode1Button").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Main").get_node("Mode2Button").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Main").get_node("SettingsButton").self_modulate = Color(gameData["RemainTimeColor"]);
	mainMenu.get_node("Main").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("Main").get_node("Label2").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("Main").get_node("Label3").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("Main").get_node("GameLogo").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Settings").get_node("SoundFXLabel").self_modulate = Color(gameData["RemainTimeColor"]);
	mainMenu.get_node("Settings").get_node("ChangeColorsButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("Settings").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("Settings").get_node("SoundFXScrollBar").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton2").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton2").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton3").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton3").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton4").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton4").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton5").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton5").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton6").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton6").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("DefaultButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("DefaultButton").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("ColorPicker").get_node("ApplyButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("ColorPicker").get_node("ApplyButton").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	mainMenu.get_node("BackButton").self_modulate = Color(gameData["PlayPauseButtonColor"]);
	mainMenu.get_node("BackButton").get_node("Label").self_modulate = Color(gameData["BackgroundColor"]);
	add_child(mainMenu);
	remove_child(get_node("Mode1"));
	remove_child(get_node("GamePlayUI"));
	pass
	
func save_information():
	var saveGameFile = File.new();
	saveGameFile.open("user://savedInfs.save", File.WRITE);
	saveGameFile.store_var(gameData);
	saveGameFile.close();
	pass
	
func load_information():
	var saveGameFile = File.new();
	if saveGameFile.file_exists("user://savedInfs.save"):
		saveGameFile.open("user://savedInfs.save", File.READ);
		gameData = saveGameFile.get_var();
		saveGameFile.close();
		pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
