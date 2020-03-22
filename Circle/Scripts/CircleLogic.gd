extends Node

var globalCircleTurnSpeeds=[0,0,0,0];
var turnCircles = false ;
var isFirstTurn = true;
var circles = [0,0,0,0];
var passButtonController;
var mode = 1;


func SetFirstAngles (paramAngles,circles):
     circles[0].rotation_degrees=paramAngles[0];
     circles[1].rotation_degrees=paramAngles[1];
     circles[2].rotation_degrees=paramAngles[2];
     circles[3].rotation_degrees=paramAngles[3];
     pass
	
func TurnOffCircles():
     turnCircles=false;
     pass

func CalculateGameLogic (paramInteractTime,paramDifficultyLevel) :
    var i=0;
    var interactDegree = floor(rand_range(0,400));
    var interactTime= round(((rand_range(0.1,1))*(paramInteractTime/2) + (paramInteractTime/2-1))*100)/100;
    var circleTurnDirections=[0,0,0,0];    # true positive direction  false negative direction
    var circleLapCounts=[0,0,0,0];
    var circleFirstAngles=[0,0,0,0];

    while i<4 :

        if int(floor(rand_range(0,10)))%2==0 :
            circleTurnDirections[i]=true;
        else:
            circleTurnDirections[i]=false;
			
        i=i+1;
    pass

    i=0;

    while i<4 :

        if isFirstTurn :
            circleFirstAngles[i]=floor(rand_range(0,400));
        else:
            circles[i].rotation_degrees = floor(circles[i].rotation_degrees)
            circleFirstAngles[i] = circles[i].rotation_degrees;
        pass




        if circleTurnDirections[i]==true :
            if  interactDegree>=circleFirstAngles[i] :
                circleLapCounts[i] =round((rand_range(0,1)*round(interactTime/paramDifficultyLevel))) ; #(Math.round(0.3*10)/10)*(Math.round(interactTime*10)/10);//((Math.random()+1.1)*40*interactTime+circleFirstAngles[i]-interactDegree);
                globalCircleTurnSpeeds[i] = (circleLapCounts[i]*360+interactDegree-circleFirstAngles[i])/interactTime;
            
            else :
                circleLapCounts[i] = round((rand_range(0,1)*round(interactTime/paramDifficultyLevel))) ; #(Math.round(1.7*10)/10)*(Math.round(interactTime*10)/10);//((Math.random()+1.1)*40*interactTime+circleFirstAngles[i]-interactDegree-360);
                globalCircleTurnSpeeds[i] = (circleLapCounts[i]*360+(360-circleFirstAngles[i])+interactDegree)/interactTime;
            pass
        
        else :
            if interactDegree>=circleFirstAngles[i] :
                circleLapCounts[i] = round((rand_range(0,1)*round(interactTime/paramDifficultyLevel))) ; #(Math.round(3.2*10)/10)*(Math.round(interactTime*10)/10);//((Math.random()+1.1)*40*interactTime+interactDegree-circleFirstAngles[i]-360);
                globalCircleTurnSpeeds[i] = -(circleLapCounts[i]*360 + 360 - interactDegree + circleFirstAngles[i])/ interactTime;
            
            else:
                circleLapCounts[i] = round((rand_range(0,1)*round(interactTime/paramDifficultyLevel))) ; #(Math.round(1.3*10)/10)*(Math.round(interactTime*10)/10);//((Math.random()+1.1)*40*interactTime+interactDegree-circleFirstAngles[i]);
                globalCircleTurnSpeeds[i] = -(circleLapCounts[i]*360 + circleFirstAngles[i]-interactDegree)/ interactTime;
            pass
        pass

        i=i+1;
    pass

    if isFirstTurn :
        isFirstTurn = false;
    pass

    SetFirstAngles(circleFirstAngles,circles)
    passButtonController.stopGame = false;
    turnCircles=true;
	
    pass



# Called when the node enters the scene tree for the first time.
func _ready():
	 CalculateGameLogic(10,3);
	 pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if turnCircles :
       circles[0].rotation_degrees += globalCircleTurnSpeeds[0]*delta;
       circles[1].rotation_degrees += globalCircleTurnSpeeds[1]*delta;
       circles[2].rotation_degrees += globalCircleTurnSpeeds[2]*delta;
       circles[3].rotation_degrees += globalCircleTurnSpeeds[3]*delta;
       pass
	pass