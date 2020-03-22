extends TextureButton

var passThreshold = 15;
var interactTime = 10;
var maxInteractTime = interactTime;
var difficultyLevel = 3;
var score = 0;
var stopGame=true;
var succesAnimPlaying = false;
var failAnimPlaying = false;
var scaleChangeValue = 0.02;
var scaleChangeTime = 11;
var firstScale = 0.45;
var minScale = 0.44;
var maxScale = 0.46;
var leakAmount = 0.0019;
var reachPoint=[0.0,0.0,0.0,0.0];
var circleScaling = [false,false,false,false] ;
var circles=[0,0,0,0];
var circlesNode;
var scoreNode;
var remainTimeNode;


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
     connect("button_up",self,"_on_PassButton_button_up");
     for i in range(4):
         circleScaling[i] = false;
         reachPoint[i] = minScale;
         pass
     pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	      if !stopGame :
             interactTime-=delta;

             if interactTime<(maxInteractTime-maxInteractTime*3/4) :
                if remainTimeNode.get_node("Indicator2").is_visible_in_tree() :
                   remainTimeNode.get_node("Indicator2").hide();
                   pass
             elif interactTime<(maxInteractTime-maxInteractTime*2/4) :
                if remainTimeNode.get_node("Indicator3").is_visible_in_tree() :
                   remainTimeNode.get_node("Indicator3").hide();
                   pass
             elif interactTime<(maxInteractTime-maxInteractTime*1/4) :
                if remainTimeNode.get_node("Indicator4").is_visible_in_tree() :
                   remainTimeNode.get_node("Indicator4").hide();
                   pass
                pass

             if interactTime<0 :
                circlesNode.TurnOffCircles();
                if remainTimeNode.get_node("Indicator1").is_visible_in_tree() :
                   remainTimeNode.get_node("Indicator1").hide();
                stopGame=true;
                get_parent().get_node("EndGameMenu").visible = true;
                get_parent().get_node("PlayPauseButton").visible = false;
                get_parent().get_node("EndGameMenu").get_node("FinalScore").text = String(score);
                .set_disabled(true);
                var highestScore = int(get_parent().get_parent().gameData["Mode1Score"]);
                if highestScore < score:
                  get_parent().get_parent().gameData["Mode1Score"] = String(score);
                  get_parent().get_parent().save_information();
                  pass
                # süre bitiminden dolayı yapılan yanmalardan sonra ne yapılacaksa buraya yaz...
                pass

             if succesAnimPlaying || failAnimPlaying :
                 if circleScaling[3] :
                     if abs(circles[3].get_scale().x - reachPoint[3])>=leakAmount :
                         if circles[3].get_scale().x > reachPoint[3] :
                             circles[3].set_scale(circles[3].get_scale() - Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
                         else :
                             circles[3].set_scale(circles[3].get_scale() + Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
                             pass
                         if circles[3].get_scale().x<=(firstScale+minScale)/2 && circleScaling[2]==false :
                            circleScaling[2]= true;
                            pass
                     else :
                         if reachPoint[3] >= minScale-leakAmount && reachPoint[3] <= minScale+leakAmount :
                             reachPoint[3] = maxScale;
                         elif reachPoint[3] >= maxScale-leakAmount && reachPoint[3] <= maxScale+leakAmount :
                             reachPoint[3] = firstScale;
                         elif reachPoint[3] >= firstScale-leakAmount && reachPoint[3] <= firstScale+leakAmount :
                             circleScaling[3] = false;
                             circles[3].set_scale(Vector2(firstScale,firstScale));
                             pass
                         pass
                     pass
                 if circleScaling[2] :
                     if abs(circles[2].get_scale().x - reachPoint[2])>=leakAmount :
                         if circles[2].get_scale().x > reachPoint[2] :
                             circles[2].set_scale(circles[2].get_scale() - Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
                         else :
                             circles[2].set_scale(circles[2].get_scale() + Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
                             pass
                         if circles[2].get_scale().x<=(firstScale+minScale)/2 && circleScaling[1]==false :
                            circleScaling[1]= true;
                            pass
                     else :
                         if reachPoint[2] >= minScale-leakAmount && reachPoint[2] <= minScale+leakAmount :
                             reachPoint[2] = maxScale;
                         elif reachPoint[2] >= maxScale-leakAmount && reachPoint[2] <= maxScale+leakAmount :
                             reachPoint[2] = firstScale;
                         elif reachPoint[2] >= firstScale-leakAmount && reachPoint[2] <= firstScale+leakAmount :
                             circleScaling[2] = false;
                             circles[2].set_scale(Vector2(firstScale,firstScale));
                             pass
                         pass
                     pass
                 if circleScaling[1] :
                     if abs(circles[1].get_scale().x - reachPoint[1])>=leakAmount :
                         if circles[1].get_scale().x > reachPoint[1] :
                             circles[1].set_scale(circles[1].get_scale() - Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
                         else :
                             circles[1].set_scale(circles[1].get_scale() + Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
                             pass
                         if circles[1].get_scale().x<=(firstScale+minScale)/2 && circleScaling[0]==false :
                            circleScaling[0]= true;
                            pass
                     else :
                         if reachPoint[1] >= minScale-leakAmount && reachPoint[1] <= minScale+leakAmount :
                             reachPoint[1] = maxScale;
                         elif reachPoint[1] >= maxScale-leakAmount && reachPoint[1] <= maxScale+leakAmount :
                             reachPoint[1] = firstScale;
                         elif reachPoint[1] >= firstScale-leakAmount && reachPoint[1] <= firstScale+leakAmount :
                             circleScaling[1] = false;
                             circles[1].set_scale(Vector2(firstScale,firstScale));
                             pass
                         pass
                     pass
                 if circleScaling[0] :
                     if abs(circles[0].get_scale().x - reachPoint[0])>=leakAmount :
                         if circles[0].get_scale().x > reachPoint[0] :
                            circles[0].set_scale(circles[0].get_scale() - Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
                         else :
                            circles[0].set_scale(circles[0].get_scale() + Vector2(scaleChangeValue*delta*scaleChangeTime,scaleChangeValue*delta*scaleChangeTime));
                            pass
                     else :
                         if reachPoint[0] >= minScale-leakAmount && reachPoint[0] <= minScale+leakAmount :
                            reachPoint[0] = maxScale;
                         elif reachPoint[0] >= maxScale-leakAmount && reachPoint[0] <= maxScale+leakAmount :
                            reachPoint[0] = firstScale;
                         elif reachPoint[0] >= firstScale-leakAmount && reachPoint[0] <= firstScale+leakAmount :
                            circleScaling[0] = false;
                            circles[0].set_scale(Vector2(firstScale,firstScale));
                            for i in range(0,4) :
                               reachPoint[i] = minScale;
                               pass
                         
                            if !failAnimPlaying :
                               score+=1;
                               scoreNode.setScore(String(score),true);
                               if maxInteractTime >= 4:
                                  maxInteractTime -= 0.5;
                                  pass
                               if difficultyLevel < 15: 
                                  difficultyLevel += 1; 
                                  pass
                               interactTime = maxInteractTime;
                               circlesNode.CalculateGameLogic(maxInteractTime,difficultyLevel);
                               for i in range(1,5) :
                                   remainTimeNode.get_node("Indicator"+String(i)).show();
                                   pass
                               succesAnimPlaying=false;
                               #score değeri bir arttırılır. ve daireler tekrar düzenlenir.
                               #başarılı durumda yapılacaklar buraya !
                            else :
                               failAnimPlaying=false;
                               stopGame=true;
                               get_parent().get_node("EndGameMenu").get_node("FinalScore").text = String(score);
                               get_parent().get_node("EndGameMenu").visible = true;
                               get_parent().get_node("PlayPauseButton").visible = false;
                               .set_disabled(true);
                               var highestScore = int(get_parent().get_parent().gameData["Mode1Score"]);
                               if highestScore < score:
                                 get_parent().get_parent().gameData["Mode1Score"] = String(score);
                                 get_parent().get_node("EndGameMenu").get_node("HighestScore").text = String(score);
                                 get_parent().get_parent().save_information();
                                 pass
                               #başarısızlık durumunda ne yapılacaksa onlar yapılır !
                               #oyun sonlandırılıp score gösterilir ve menü çıkarılır.
                               pass
                            pass
                         pass
                     pass
                 pass
             pass
	      pass


func _on_PassButton_button_up():
     var success = true;
     circlesNode.TurnOffCircles();
     for i in range(3): # önemli not açılar 360dan sonra 0 lanmıyor dolayısıyla hesap yaparken 360 a göre modunu al..
         if circles[i].rotation_degrees<0.0 :
            if circles[i+1].rotation_degrees<0.0 :
               if abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) > passThreshold && abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) < 360-passThreshold:
                  success = false;
                  pass
            else:
                 if abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) > passThreshold && abs((360-int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) <360-passThreshold:
                    success = false;
                    pass
                 pass
         else:
              if circles[i+1].rotation_degrees<0.0 :
                 if abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) > passThreshold && abs((int(abs(round(circles[i].rotation_degrees)))%360) - (360-int(abs(round(circles[i+1].rotation_degrees)))%360)) <360-passThreshold:
                    success = false;
                    pass
              else:
                   if abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) > passThreshold && abs((int(abs(round(circles[i].rotation_degrees)))%360) - (int(abs(round(circles[i+1].rotation_degrees)))%360)) <360-passThreshold:
                      success = false;
                      pass
                   pass
         pass

     if success && !stopGame :
        get_parent().get_parent().get_node("Audio").get_node("SuccesSoundFX").play(0.0);
        succesAnimPlaying=true;
        circleScaling[3] = true;
     else:
        get_parent().get_parent().get_node("Audio").get_node("FailSoundFX").play(0.0);
        failAnimPlaying = true;
        circleScaling[0] = true;
        circleScaling[1] = true;
        circleScaling[2] = true;
        circleScaling[3] = true;
        pass
     
     pass # end func

func SetDisableButton(value):
	.set_disabled(value);
	pass

func SetStopGame(paramValue):
     stopGame=paramValue;
     pass