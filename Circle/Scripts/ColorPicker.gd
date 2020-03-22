extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mainMenu;
var choosedNodeIndice;
var choosedColor;
var clickSoundFX;
var defaultColors = {
	"Circle":"#00ffcc",
	"RemainTime":"#f2932c",
	"PlayPauseButton":"#00ffcc",
	"Score":"#007f7a",
	"MiddleCircle":"#dedc6c",
	"Background":"#fafce3"
	}

func _ready():
	clickSoundFX = get_parent().get_parent().get_node("Audio").get_node("ButtonSoundFX");
	pass

func SetColorToNode():
	if choosedNodeIndice != null:
		if choosedNodeIndice == 0:
			for i in range(1,5):
				get_node("Preview/Circles/Circle"+String(i)).self_modulate = choosedColor;
				pass
			get_parent().get_parent().gameData["CircleColor"] = choosedColor.to_html(false);
			pass
		elif choosedNodeIndice == 1:
			for i in range(1,5):
				get_node("Preview/RemainTime/Indicator"+String(i)).self_modulate = choosedColor;
				pass
			get_parent().get_parent().gameData["RemainTimeColor"] = choosedColor.to_html(false);
			mainMenu.get_node("Main").get_node("SettingsButton").self_modulate = Color(get_parent().get_parent().gameData["RemainTimeColor"]);
			mainMenu.get_node("Settings").get_node("SoundFXLabel").self_modulate = Color(get_parent().get_parent().gameData["RemainTimeColor"]);
			
			pass
		elif choosedNodeIndice == 2:
			get_node("Preview/PlayPauseButton").self_modulate = choosedColor;
			get_parent().get_parent().gameData["PlayPauseButtonColor"] = choosedColor.to_html(false);
			mainMenu.get_node("Main").get_node("Mode1Button").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("Main").get_node("Mode2Button").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("Main").get_node("GameLogo").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("Settings").get_node("ChangeColorsButton").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("Settings").get_node("SoundFXScrollBar").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton2").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton3").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton4").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton5").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton6").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("ColorPicker").get_node("DefaultButton").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("ColorPicker").get_node("ApplyButton").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			mainMenu.get_node("BackButton").self_modulate = Color(get_parent().get_parent().gameData["PlayPauseButtonColor"]);
			pass
		elif choosedNodeIndice == 3:
			get_node("Preview/Score").self_modulate = choosedColor;
			get_parent().get_parent().gameData["ScoreColor"] = choosedColor.to_html(false);
			pass
		elif choosedNodeIndice == 4:
			get_node("Preview/MiddleCircle").self_modulate = choosedColor;
			get_parent().get_parent().gameData["MiddleCircleColor"] = choosedColor.to_html(false);
			pass
		elif choosedNodeIndice == 5:
			get_node("Preview/Background").color = choosedColor;
			get_parent().get_parent().get_node("Control").get_node("ColorRect").color = choosedColor;
			get_parent().get_parent().gameData["BackgroundColor"] = choosedColor.to_html(false);
			mainMenu.get_node("Main").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("Main").get_node("Label2").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("Main").get_node("Label3").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("Settings").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton2").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton3").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton4").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton5").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("ColorPicker").get_node("ChoseButtons").get_node("ChoseButton6").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("ColorPicker").get_node("DefaultButton").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("ColorPicker").get_node("ApplyButton").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			mainMenu.get_node("BackButton").get_node("Label").self_modulate = Color(get_parent().get_parent().gameData["BackgroundColor"]);
			pass
		get_parent().get_parent().hasToSaveGame = true;
		pass
	pass

func ChooseCircle():
	choosedNodeIndice = 0;
	clickSoundFX.play(0.0);
	pass # Replace with function body.


func ChooseTimeIndicator():
	choosedNodeIndice = 1;
	clickSoundFX.play(0.0);
	pass # Replace with function body.


func ChoosePauseIcon():
	choosedNodeIndice = 2;
	clickSoundFX.play(0.0);
	pass # Replace with function body.


func ChooseScore():
	choosedNodeIndice = 3;
	clickSoundFX.play(0.0);
	pass # Replace with function body.


func ChoseMCircle():
	choosedNodeIndice = 4;
	clickSoundFX.play(0.0);
	pass # Replace with function body.


func ChooseBackground():
	choosedNodeIndice = 5;
	clickSoundFX.play(0.0);
	pass # Replace with function body.


func SetToDefaultColor():
	clickSoundFX.play(0.0);
	for i in range(1,5):
		get_node("Preview/Circles/Circle"+String(i)).self_modulate = Color(defaultColors["Circle"]);
		get_node("Preview/RemainTime/Indicator"+String(i)).self_modulate = Color(defaultColors["RemainTime"]);
		pass
	get_node("Preview/PlayPauseButton").self_modulate = Color(defaultColors["PlayPauseButton"]);
	get_node("Preview/Score").self_modulate = Color(defaultColors["Score"]);
	get_node("Preview/MiddleCircle").self_modulate = Color(defaultColors["MiddleCircle"]);
	get_node("Preview/Background").self_modulate = Color(defaultColors["Background"]);
	get_parent().get_parent().get_node("Control").get_node("ColorRect").color = Color(defaultColors["Background"]);
	var data = get_parent().get_parent().gameData;
	data["CircleColor"] = defaultColors["Circle"];
	data["RemainTimeColor"] = defaultColors["RemainTime"];
	data["PlayPauseButtonColor"] = defaultColors["PlayPauseButton"];
	data["MiddleCircleColor"] = defaultColors["MiddleCircle"];
	data["BackgroundColor"] = defaultColors["Background"];
	get_parent().get_parent().hasToSaveGame = true;
	pass # Replace with function body.


func SetCustomColor():
	clickSoundFX.play(0.0);
	if get_node("ColorCodeTextEdit").text == "" || get_node("ColorCodeTextEdit").text.length() < 7 || get_node("ColorCodeTextEdit").text.length() > 7:
		return;
		pass
	var color;
	if get_node("ColorCodeTextEdit").text[0] == '#':
		color = Color(get_node("ColorCodeTextEdit").text);
	else:
		color = Color("#"+get_node("ColorCodeTextEdit").text);
		pass
	choosedColor = color;
	SetColorToNode();
	pass # Replace with function body.
