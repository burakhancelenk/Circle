extends HSlider

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var volumeInDb;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body."res://Audios/music.wav"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SoundFXScrollBar_value_changed(value):
	volumeInDb = (value/100.0)*70.0 - 70.0;
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SoundFX"),float(volumeInDb));
	get_parent().get_parent().get_parent().gameData["SoundFXLevel"] = String(volumeInDb);
	get_parent().get_parent().get_parent().hasToSaveGame = true;
	pass # Replace with function body.
