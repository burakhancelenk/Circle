extends Node


var globalCircleTurnSpeeds=[0,0,0,0];
var circleFirstAngles=[0,0,0,0];
var activeCircleIndice = 3;
var stopGame = true;
var circles=[0,0,0,0];
var passButton; # passButton2'yi node olarak ata buna.
var mode = 2;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func GetActiveCircleIndice():
  return activeCircleIndice;
  pass

func DecreaseActiveCircleIndice():
  activeCircleIndice-=1;
  pass

func SetStopGame(paramValue):
  stopGame = paramValue;
  pass

func CalculateGameLogic(paramDifficultyLevel):
  for i in range(4):
    #paramDifficultyLevel's value can be between 1-10 increasing the value will increase the difficulty
    if int(floor(rand_range(0,10)))%2==0 :
      globalCircleTurnSpeeds[i] = paramDifficultyLevel*36*(round(rand_range(0,100)+10)/100);
    else:
      globalCircleTurnSpeeds[i] = -paramDifficultyLevel*36*(round(rand_range(0,100)+10)/100);
      pass
    circleFirstAngles[i]=floor(rand_range(0,400));
    passButton.SetCircleSpeeds(globalCircleTurnSpeeds[i],i);
    if circles[i].rotation_degrees<0 :
      if circleFirstAngles[i]<0 :
        # en son burada kaldın turn speedin yönüne göre hangi mesafeyi gidecek onu tespit edip o mesafeyi atayacaksın...
        # distanceların alayı pozitif olacak çünkü skaler bir değer elde ediyoruz.
        if circles[i].rotation_degrees<circleFirstAngles[i] :
          if globalCircleTurnSpeeds[i]<0 :
            passButton.SetPassDistance(360-abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circleFirstAngles[i])))%360)),i);
          else:
            passButton.SetPassDistance(abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circleFirstAngles[i])))%360)),i);
            pass
        else:
          if globalCircleTurnSpeeds[i]<0 :
            passButton.SetPassDistance(abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circleFirstAngles[i])))%360)),i);
          else:
            passButton.SetPassDistance(360-abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circleFirstAngles[i])))%360)),i);
            pass
          pass
      else:
        if globalCircleTurnSpeeds[i]<0 :
          passButton.SetPassDistance(abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circleFirstAngles[i])))%360)),i);
        else:
          passButton.SetPassDistance(360-abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circleFirstAngles[i])))%360)),i);
          pass
        pass
    else:
      if circleFirstAngles[i]<0 :
        if globalCircleTurnSpeeds[i]<0 :
          passButton.SetPassDistance(360-abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circleFirstAngles[i])))%360)),i);
        else:
          passButton.SetPassDistance(abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circleFirstAngles[i])))%360)),i);
          pass
      else:
        if circleFirstAngles[i]>circles[i].rotation_degrees :
          if globalCircleTurnSpeeds[i]<0 :
            passButton.SetPassDistance(360-abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circleFirstAngles[i])))%360)),i);
          else:
            passButton.SetPassDistance(abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circleFirstAngles[i])))%360)),i);
            pass
        else:
          if globalCircleTurnSpeeds[i]<0 :
            passButton.SetPassDistance(abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circleFirstAngles[i])))%360)),i);
          else:
            passButton.SetPassDistance(360-abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circleFirstAngles[i])))%360)),i);
            pass
          pass
        pass
      pass
    pass
  activeCircleIndice = 3;
  stopGame = false;
  pass # end func

# Called when the node enters the scene tree for the first time.
func _ready():
  CalculateGameLogic(3);
  pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if !stopGame :
    circles[activeCircleIndice].rotation_degrees += globalCircleTurnSpeeds[activeCircleIndice]*delta;
    pass
  pass