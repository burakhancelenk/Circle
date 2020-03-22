extends TextureButton

var score = 0;
var passThreshold = 10;
var succesAnimPlaying = false;
var doneAnimPlaying = false;
var passAnimPlaying = false;
var scaleChangeValue = 0.02;
var scaleChangeTime = 11;
var firstScale = 0.45;
var minScale = 0.44;
var activeCircleIndiceForAnim = 4;
var health = 4;
var difficultyLevel = 3;
var totalDegreeDiffence = 0;
var circleSpeeds=[0,0,0,0];
var circlePassSpeeds=[0,0,0,0];
var circlePassAccelerations=[0,0,0,0];
var passDistances=[0,0,0,0];
var passTime = 1;
var circlesNode;
var circles = [0,0,0,0];
var scoreNode;
var remainTimeNode;   # in this mode there is no time. This is gonna used as a health bar.

# scoreNode, circles, remainTimeNode, circleNode bunları kodu bağlarken ata.

func SetCircleSpeeds(paramCircleSpeeds,paramIndice):
  circleSpeeds[paramIndice] = paramCircleSpeeds;
  pass

func SetPassDistance(paramDistances , paramIndice):
  passDistances[paramIndice] = paramDistances;
  pass

func on_PassButton2_ButtonUp():
    var success = true;
    circlesNode.SetStopGame(true);
    var i = circlesNode.GetActiveCircleIndice();

    if i == 3 :
      get_parent().get_parent().get_node("Audio").get_node("CircleSoundFX").play(0.0);
      succesAnimPlaying = true;
      circlesNode.DecreaseActiveCircleIndice();
      activeCircleIndiceForAnim -= 1;
      circlesNode.SetStopGame(false);
      return;
      pass

    if circles[i].rotation_degrees<0 :
        if circles[i+1].rotation_degrees<0 :
          if abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) > passThreshold && abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) < 360-passThreshold :
            success = false;
          else:
            if abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) <= passThreshold :
              totalDegreeDiffence += abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360));
            elif abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) >= 360-passThreshold :
              totalDegreeDiffence += 360-abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360));
              pass
            pass
        else:
          if abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) > passThreshold && abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) <360-passThreshold :
            success = false;
          else:
            if abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) <= passThreshold :
              totalDegreeDiffence += abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360));
            elif abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) >= 360-passThreshold :
              totalDegreeDiffence += abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360));
              pass              
            pass
          pass
    else:
        if circles[i+1].rotation_degrees<0 :
          if abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) > passThreshold && abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) <360-passThreshold :
            success = false;
          else:
            if abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) <= passThreshold :
              totalDegreeDiffence += abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360));
            elif abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) >= 360-passThreshold :
              totalDegreeDiffence += abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360));
              pass
            pass
        else:
          if abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) > passThreshold && abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) <360-passThreshold :
            success = false;
          else:
            if abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) <= passThreshold :
              totalDegreeDiffence += abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360));
            elif abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) >= 360-passThreshold :
              totalDegreeDiffence += abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360));
              pass
            pass
          pass
        pass

    if success :
      #score değeri bir arttırılır. ve bir sonraki circle harekete geçilir. eğer son circle ise score artırılır ve circlelar tekrar düzenlenir.
      if i == 0 :
        get_parent().get_parent().get_node("Audio").get_node("SuccesSoundFX").play(0.0);
        score+=1;
        scoreNode.setScore(String(score),true);
        activeCircleIndiceForAnim = 0;
        succesAnimPlaying = true;
        if totalDegreeDiffence<=20 :
          # perfect match durumu health bir arttır.
          if health<3 :
            health+=1;
            remainTimeNode.get_node("Indicator"+String(health)).show(); # remainTimeNode'u dizi yapmak yerine node olarak kalsın alt objeleri aktif ederken get_node kullan...
            pass
          pass
      else:
        get_parent().get_parent().get_node("Audio").get_node("CircleSoundFX").play(0.0);
        succesAnimPlaying = true;
        circlesNode.DecreaseActiveCircleIndice();
        activeCircleIndiceForAnim-=1;
        circlesNode.SetStopGame(false);
        pass
    else:
      if health>0 :
        get_parent().get_parent().get_node("Audio").get_node("FailSoundFX").play(0.0);
        health-=1;
        remainTimeNode.get_node("Indicator"+String(health+1)).hide();
        doneAnimPlaying = true;
      else:
        get_parent().get_parent().get_node("Audio").get_node("FailSoundFX").play(0.0);
        get_parent().get_node("EndGameMenu").get_node("FinalScore").text = String(score);
        get_parent().get_node("EndGameMenu").visible = true;
        get_parent().get_node("PlayPauseButton").visible = false;
        .set_disabled(true);
        var highestScore = int(get_parent().get_parent().gameData["Mode2Score"]);
        if highestScore < score:
          get_parent().get_parent().gameData["Mode2Score"] = String(score);
          get_parent().get_node("EndGameMenu").get_node("HighestScore").text = String(score);
          get_parent().get_parent().save_information();
          pass
        #başarısızlık durumunda ne yapılacaksa onlar yapılır.
        #oyun sonlandırılıp score gösterilir ve menü çıkarılır.
        circlesNode.SetStopGame(true);
        pass
      pass
    pass

# Called when the node enters the scene tree for the first time.
func _ready():
    connect("button_up",self,"on_PassButton2_ButtonUp");
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if succesAnimPlaying :
    if circles[activeCircleIndiceForAnim].get_scale().x > minScale :
      circles[activeCircleIndiceForAnim].set_scale(circles[activeCircleIndiceForAnim].get_scale()-Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
      #circles[activeCircleIndiceForAnim].scaleX -= scaleChangeValue*delta*scaleChangeTime;
      #circles[activeCircleIndiceForAnim].scaleY -= scaleChangeValue*delta*scaleChangeTime;
    else:
      succesAnimPlaying = false;
      circles[activeCircleIndiceForAnim].set_scale(Vector2(minScale,minScale));
      if activeCircleIndiceForAnim == 0 :
        #bir sonraki level hazırlıklarını yap.
        doneAnimPlaying = true;
        pass
      pass
    pass
  if doneAnimPlaying :
    if circles[activeCircleIndiceForAnim].get_scale().x < firstScale :
      for i in range(3,activeCircleIndiceForAnim-1,-1) :
        circles[i].set_scale(circles[i].get_scale()+Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
        #circles[i].scaleX += scaleChangeValue * delta * scaleChangeTime;
        #circles[i].scaleY += scaleChangeValue * delta * scaleChangeTime;
        pass
      pass
    else:
      for i in range(3,activeCircleIndiceForAnim-1,-1) :
        circles[i].set_scale(Vector2(firstScale,firstScale));
        pass
      if difficultyLevel <= 10:
         difficultyLevel += 1;
         pass
      circlesNode.CalculateGameLogic(difficultyLevel);
      doneAnimPlaying = false;
      activeCircleIndiceForAnim = 4;
      circlesNode.SetStopGame(true);  # burayı passeffecti açarken true yap.
      if abs(circleSpeeds[3]*passTime) >= passDistances[3] :
        circlePassSpeeds[3] = passDistances[3]/passTime;
        circlePassAccelerations[3] = 0;
      else:
        circlePassSpeeds[3] = abs((-2)*(passDistances[0]-circleSpeeds[3]*passTime)/(passTime*passTime)+circleSpeeds[3]*(passTime*passTime));
        circlePassAccelerations[3] = circlePassSpeeds[3]/passTime;
        pass
      circlePassSpeeds[0] = 2*passDistances[0]/passTime;
      circlePassAccelerations[0] = circlePassSpeeds[0]/passTime;
      circlePassSpeeds[1] = 2*passDistances[1]/passTime;
      circlePassAccelerations[1] = circlePassSpeeds[1]/passTime;
      circlePassSpeeds[2] = 2*passDistances[2]/passTime;
      circlePassAccelerations[2] = circlePassSpeeds[2]/passTime;
      passAnimPlaying=true;

      pass
    pass
  if passAnimPlaying :
    for i in range(0,4) :
      if circleSpeeds[i]>0 :
        circles[i].rotation_degrees+= circlePassSpeeds[i]*delta;
        circlePassSpeeds[i]-= circlePassAccelerations[i]*delta;
      else:
        circles[i].rotation_degrees-= circlePassSpeeds[i]*delta;
        circlePassSpeeds[i]-= circlePassAccelerations[i]*delta;
        pass
      pass
    if circlePassSpeeds[2]<=0 :
      passAnimPlaying=false;
      circlesNode.SetStopGame(false);
      pass
    pass
  pass

func SetDisableButton(value):
	.set_disabled(value);
	pass