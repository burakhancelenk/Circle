extends Light2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func CalculatePosition(paramNormalizedDirection):
	# gyroscopedan aldığın veriyi normalize edilmiş bir direction olarak bu fonksiyona gönder.
	var angle = atan(paramNormalizedDirection.y/paramNormalizedDirection.x);
	position = Vector2(position.x+cos(angle)*392,position.y+sin(angle)*247);
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
