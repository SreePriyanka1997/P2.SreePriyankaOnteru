import controlP5.*;
ControlP5 cp5;
ControlP5 button;

import java.io.*;
import java.text.*;
DecimalFormat df = new DecimalFormat("#.#");

PFont font;

Knob speedometer;
Knob tachometer;

Slider fuelGuage;
Slider EngineTemp;

Button brakeP;
Button gasP;

PImage eTempI;
PImage gasI;
PImage doorsI;
PImage seatbeltI;
PImage cruiseControlI;
PImage cruiseControlOnI;
PImage img;


PImage antilock;
PImage engine;
PImage oil;
PImage security;
PImage tire;
PImage traction;
PImage tractionMal;

char tempType = 'F';
boolean cruiseOn = false;
boolean cruiseSet = false;
boolean rightSig = false;
boolean leftSig = false;
boolean sigLightOn = false;
boolean battery = false;
boolean checkengine = false;
boolean lightbeam = false;
boolean transmission = false;
boolean airsuspension = false;
boolean seatbelt = false;
boolean steering = false;
boolean drive = false;
boolean park = true;
boolean reverse= false;
boolean standard = false;
boolean neutral = false;
boolean cruisecontrol = false;
float startTime;
float eTempSpeed = 3000;
float lasttimecheck;
float timeinterval;
int warningChoice = -1;
//int battery=0;

Textlabel speed0Label;
Textlabel speed20Label;
Textlabel speed40Label;
Textlabel speed60Label;
Textlabel speed80Label;
Textlabel speed100Label;
Textlabel speed120Label;
Textlabel speed140Label;

Textlabel tach1Label;
Textlabel tach2Label;
Textlabel tach3Label;
Textlabel tach4Label;
Textlabel tach5Label;
Textlabel tach6Label;
Textlabel tach7Label;
Textlabel tach8Label;
Textlabel tach9Label;

Textlabel rightLabel;
Textlabel leftLabel;
Textlabel emerLabel;
Textlabel milesLabel;
Textlabel rpmLabel;
Textlabel fLabel;
Textlabel fLabel1;
Textlabel eLabel;
Textlabel eLabel1;
Toggle P;
Toggle R;
Toggle N;
Toggle D;
Toggle S;

Toggle cruise;
Toggle right;
Toggle left;
Toggle emergency;
Toggle warnings;

void setup() {
  size(1200, 575);
  background(0);
  cp5 = new ControlP5(this);
  fill(255);
  font = createFont("Arial",20);
  
  speedometer = (cp5.addKnob("speed").setRange(0, 140).setValue(0).setPosition(600, 200).setRadius(120).setFont(font).setNumberOfTickMarks(14).snapToTickMarks(false)
   .setTickMarkLength(25).setTickMarkWeight(7)).setColorBackground(color(0)).setColorForeground(color(255)).setColorActive(color(255));
  
  cp5.getController("speed").getCaptionLabel().setVisible(false); 
  
  speed0Label = cp5.addLabel("O").setPosition(590,420).setFont(font);
  speed20Label = cp5.addLabel("20").setPosition(535, 325).setFont(font);
  speed40Label = cp5.addLabel("40").setPosition(555, 220).setFont(font);
  speed60Label = cp5.addLabel("60").setPosition(650, 140).setFont(font);
  speed80Label = cp5.addLabel("80").setPosition(765, 140).setFont(font);
  speed100Label = cp5.addLabel("100").setPosition(855, 220).setFont(font);
  speed120Label = cp5.addLabel("120").setPosition(870, 325).setFont(font);
  speed140Label = cp5.addLabel("140").setPosition(815, 430).setFont(font); 
  
  tachometer = (cp5.addKnob("tach").setRange(0, 8).setValue(0).setPosition(90, 220).setRadius(110).setFont(font).setNumberOfTickMarks(8).snapToTickMarks(false)
  .setTickMarkLength(20).setTickMarkWeight(7)).setColorBackground(color(0)).setColorForeground(color(255)).setColorActive(color(255));
  
  cp5.getController("tach").getCaptionLabel().setVisible(false);
  cp5.getController("tach").getValueLabel().setVisible(false);

  tach1Label = cp5.addLabel("0").setPosition(80, 430).setFont(font);
  tach2Label = cp5.addLabel("1").setPosition(45, 345).setFont(font);
  tach3Label = cp5.addLabel("2").setPosition(50, 265).setFont(font);
  tach4Label = cp5.addLabel("3").setPosition(110, 190).setFont(font);
  tach5Label = cp5.addLabel("4").setPosition(195, 170).setFont(font);
  tach6Label = cp5.addLabel("5").setPosition(275, 185).setFont(font);
  tach7Label = cp5.addLabel("6").setPosition(340, 260).setFont(font);
  tach8Label = cp5.addLabel("7").setPosition(350, 345).setFont(font);
  tach9Label = cp5.addLabel("8").setPosition(310, 435).setFont(font);
  
  EngineTemp = cp5.addSlider("  ")
       .setPosition(370,380)
       .setSize(170,20)
       .setRange(0,300) 
       .setValue(120)
       .setNumberOfTickMarks(10)
       .setSliderMode(Slider.FLEXIBLE)
       ;
  cp5.getController("  ").getCaptionLabel().setVisible(false);
  cp5.getController("  ").getValueLabel().setVisible(false);
  startTime = millis();
  
  fuelGuage = cp5.addSlider(" ")
       .setPosition(370,425)
       .setSize(170,20)
       .setRange(0,20)
       .setValue(15)
       .setNumberOfTickMarks(5)
       .setSliderMode(Slider.FLEXIBLE)
       ;
  cp5.getController(" ").getCaptionLabel().setVisible(false);
  cp5.getController(" ").getValueLabel().setVisible(false);
  
  //eTempI = loadImage("engineTemp.jpg");
  //gasI = loadImage("fuelPump.jpg");
  //doorsI = loadImage("openDoor.jpg");
  //seatbeltI = loadImage("seatbelt.jpg");
  //cruiseControlI = loadImage("cruiseControl.jpg");
  //cruiseControlOnI = loadImage("cruiseControlOn.jpg");
  
  //airbag = loadImage("airbag.jpg");
  //antilock = loadImage("antiLock.jpg");
  //battery = loadImage("battery.jpg");
  //engine = loadImage("engine.jpg");
  //oil = loadImage("oil.jpg");
  //security = loadImage("security.jpg");
  //tire = loadImage("tire.jpg");
  //traction = loadImage("traction.jpg");
  //tractionMal = loadImage("tractionMal.jpg");
  
  milesLabel = cp5.addLabel("mph").setPosition(696,250).setFont(font);
  rpmLabel = cp5.addLabel("rpm").setPosition(180,270).setFont(font);
  fLabel = cp5.addLabel("E").setPosition(365,450).setFont(font);
  fLabel1 = cp5.addLabel("F").setPosition(525,450).setFont(font);
  eLabel = cp5.addLabel("C").setPosition(365,355).setFont(font);
  eLabel1 = cp5.addLabel("H").setPosition(515,355).setFont(font);
  
   

  String temp = Character.toString((char)176)+"F";
  textFont(font);
  text(df.format(random(50, 68))+temp,425,325);
  
  img = loadImage("fuel.jpg");
  image(img,445, 460, 30,30);
  img = loadImage("EngineTemperatureNormal.jpg");
  image(img,440,350,30,30);
  
  button = new ControlP5(this);
  button.addButton("Accelerate").setSize(75,45).setPosition(1000, 135);
  button.addButton("Brake").setSize(75,45).setPosition(1000, 195);

  right = (cp5.addToggle("Right").setSize(75,45).setPosition(1000, 250).setFont(font)).setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(78, 173, 220));
  cp5.getController("Right").getCaptionLabel().setVisible(false);
  right.setState(false);
  
  left = (cp5.addToggle("Left").setSize(75,45).setPosition(1000, 310).setFont(font)).setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(78, 173, 220));
  cp5.getController("Left").getCaptionLabel().setVisible(false);
  left.setState(false);
  
  emergency = (cp5.addToggle("Emer").setSize(75,45).setPosition(1000, 370).setFont(font)).setColorBackground(color(25)).setColorForeground(color(150)).setColorActive(color(78, 173, 220));
  cp5.getController("Emer").getCaptionLabel().setVisible(false); 
  emergency.setState(false);
  
  button.addButton("Right").setSize(75,45).setPosition(1000,250);
  button.addButton("Left").setSize(75,45).setPosition(1000,310);
  button.addButton("Emergency").setSize(75,45).setPosition(1000,370);
  
  //warnings = (cp5.addToggle("Warnings").setSize(75,45).setPosition(1000,430).setFont(font)).setColorBackground(color(25)).setColorForeground(color(150))
  //.setColorActive(color(78, 173, 220));
  //cp5.getController("Warnings").getCaptionLabel().setVisible(false);
  //warnings.setState(false);
  
  button.setColorBackground(#d9ab91);
  fill(25);
   font = createFont("Arial",9);
  button.setFont(font);
  
  button.addButton("Battery").setSize(75,45).setPosition(1000,430);
  button.addButton("Check Engine").setSize(75,45).setPosition(1090,135);
  button.addButton("Light Beam").setSize(75,45).setPosition(1090,195);
  button.addButton("Transmission").setSize(75,45).setPosition(1090,255);
  button.addButton("Air Suspension").setSize(75,45).setPosition(1090,315);
  button.addButton("Seat Belt").setSize(75,45).setPosition(1090,375);
  button.addButton("Steering Lock").setSize(75,45).setPosition(1090,435);
  button.addButton("Cruise Control").setSize(165,45).setPosition(1000,495);
  
  P = (cp5.addToggle("P").setSize(45,25).setPosition(600, 495).setFont(font));
  cp5.getController("P").getCaptionLabel().setVisible(false); 
  P.setState(false);
  button.addButton("P").setSize(45,25).setPosition(600,495);
  
  R = (cp5.addToggle("R").setSize(45,25).setPosition(660, 495).setFont(font));
  cp5.getController("R").getCaptionLabel().setVisible(false); 
  R.setState(false);
  button.addButton("R").setSize(45,25).setPosition(660,495);
  
  N = (cp5.addToggle("N").setSize(45,25).setPosition(720, 495).setFont(font));
  cp5.getController("N").getCaptionLabel().setVisible(false); 
  R.setState(false);
  button.addButton("N").setSize(45,25).setPosition(720,495);
  
  D = (cp5.addToggle("D").setSize(45,25).setPosition(780, 495).setFont(font));
  cp5.getController("D").getCaptionLabel().setVisible(false); 
  D.setState(false);
  button.addButton("D").setSize(45,25).setPosition(780,495);
  
  S = (cp5.addToggle("S").setSize(45,25).setPosition(840, 495).setFont(font));
  cp5.getController("S").getCaptionLabel().setVisible(false); 
  S.setState(false);
  button.addButton("S").setSize(45,25).setPosition(840,495);

   }
   
void draw() {  

  fill(0);
  stroke(255);
  strokeWeight(5);
  circle(720, 310, 300); //around speedometer
  circle(205,335,280); //around tachometer
  
  //image(eTempI, 175, 150);
  //image(gasI, 760, 150);
  //image(doorsI, 425, 20);
  //image(seatbeltI, 510, 20);
  
  float currentETemp = EngineTemp.getValue();
  float currentSpeed = speedometer.getValue();
  float currentTach = tachometer.getValue();
  
   if(drive || standard || reverse){
  
  if(cruisecontrol){
    if (mouseX >995 && mouseX <1080 && mouseY >130 && mouseY <185 && mousePressed) {
    speedometer.setValue(currentSpeed);
    currentTach = tachometer.getValue();
    tachometer.setValue(currentTach);
  }
  }
  else if (mouseX >995 && mouseX <1080 && mouseY >130 && mouseY <185 && mousePressed) {
    currentSpeed++;
    speedometer.setValue(currentSpeed);
    currentTach = tachometer.getValue();
    currentTach += .1;
    tachometer.setValue(currentTach);
  }
   
  
  else{
      if (speedometer.getValue() > 0) {
        if (speedometer.getValue() < 20) {
          if (currentTach > 1.9) {
            currentTach = tachometer.getValue();
            currentTach -= .05;
            tachometer.setValue(currentTach);
          }
        }
        else {
          if (currentTach > 2.3) {
            currentTach = tachometer.getValue();
            currentTach -= .05;
            tachometer.setValue(currentTach);
           } 
         }
        if (speedometer.getValue() < 40) {
          if (currentTach > 1.9) {
            currentTach = tachometer.getValue();
            currentTach -= .05;
            tachometer.setValue(currentTach);
          }
        }
        else {
          if (currentTach > 2.3) {
            currentTach = tachometer.getValue();
            currentTach -= .05;
            tachometer.setValue(currentTach);
           } 
         }
     
      
      if (currentETemp < 90) {
        if (millis() > startTime + eTempSpeed) {
          startTime = millis();
          currentETemp++;
          EngineTemp.setValue(currentETemp);
        }
      }
    }
    else {
      if (currentTach > 0.9) {
        currentTach = tachometer.getValue();
        currentTach -= .05;
        tachometer.setValue(currentTach);
      } 
    }
  }
   }
if (mouseX >995 && mouseX <1080 && mouseY >190 && mouseY <245 && mousePressed) {
      currentSpeed--;
      speedometer.setValue(currentSpeed);
  }
  timeinterval = 500;
  if (leftSig == true) {
    if(sigLightOn == true) {
        img = loadImage("left color.png");
        image(img,350, 90, 40,40);
      
      if(millis() > lasttimecheck + timeinterval) {
        lasttimecheck = millis();
        sigLightOn = false;
      }
    }
    else {
    img = loadImage("left black.png");
    image(img,350, 90, 40,40);
      if(millis() > lasttimecheck + timeinterval) {
        lasttimecheck = millis();
        sigLightOn = true;
      }
    }
  }
   else {
     img = loadImage("left black.png");
    image(img,350, 90, 40,40);
  }


  
  if (rightSig == true) {
    if(sigLightOn == true) {
         img = loadImage("right color.png");
         image(img,525, 90, 40,40);
      
      if(millis() > lasttimecheck + timeinterval) {
        lasttimecheck = millis();
        sigLightOn = false;
      }
    }
    else {
         img = loadImage("Right black.png");
         image(img,525, 90, 40,40);
      if(millis() > lasttimecheck + timeinterval) {
        lasttimecheck = millis();
        sigLightOn = true;
      }
    }
  } else {
    img = loadImage("Right black.png");
         image(img,525, 90, 40,40);
  }
 

          if (battery) {
            img = loadImage("BatteryBad.png");
            image(img,250, 90, 40,40);
   }
   else {
            img = loadImage("BatteryGood.png");
            image(img,250, 90, 40,40);
  }
  if(checkengine){
    img = loadImage("CheckEngineFault.png");
            image(img,300, 140, 40,40);
  }
      else {
            img = loadImage("CheckEngineGood.png");
            image(img,300, 140, 40,40);
  }
    if(lightbeam){
    img = loadImage("DippedBeam.jpg");
            image(img,555, 140, 40,40);
  }
      else {
            img = loadImage("LightOff.png");
            image(img,555, 140, 40,40);
  }  
      if(transmission){
    img = loadImage("TransmissionFault.png");
            image(img,600, 90, 40,40);
  }
      else {
            img = loadImage("TransmissionGood.png");
            image(img,600, 90, 40,40);
  } 
    if(airsuspension){
    img = loadImage("AirSuspensionFault.png");
            image(img,660, 90, 40,40);
  }
      else {
            img = loadImage("AirSuspensionGood.png");
            image(img,660, 90, 40,40);
  } 
    if(steering){
    img = loadImage("SteeringFault.png");
            image(img,180, 90, 40,40);
  }
      else {
            img = loadImage("SteeringGood.png");
            image(img,180, 90, 40,40);
  } 
   if(seatbelt){
    img = loadImage("seatbeltBad.jpg");
            image(img,380, 60, 150,100);
  }
  else{
    noStroke();
    rect(380,60,100,100);
  }
    if(cruisecontrol){
      img=loadImage("cruise.jpg");
      image(img,410,140,100,100);
    }
    else{
      noStroke();
    rect(410,140,100,100);
  }

//   if(park){
//     reverse=false;
//     neutral = false;
//     drive=false;
//     standard = false;
//     button.setColorBackground(#171716);
//     button.addButton("P1").setSize(45,25).setPosition(700,375);
//  }
//   else if(reverse){
//          park= false;
//     neutral = false;
//     drive=false;
//     standard = false;
//     button.addButton("R1").setSize(45,25).setPosition(700,375);
//  }
   
//   else if(neutral){
//          reverse= false;
//     park = false;
//     drive=false;
//     standard = false;
//     button.addButton("N1").setSize(45,25).setPosition(700,375);
//  }
   
// else if(drive){
//        reverse= false;
//     neutral = false;
//     park=false;
//     standard = false;
//    button.addButton("D1").setSize(45,25).setPosition(700,375);
//  }
   
// else if(standard){
//         reverse= false;
//     neutral = false;
//     drive=false;
//     park = false;
//     button.addButton("S1").setSize(45,25).setPosition(700,375);
//  }
//else{

//     button.addButton(" ").setSize(45,25).setPosition(700,375);
//  }
}
   void mousePressed() {
  if (mouseX >995 && mouseX <1080 && mouseY >430 && mouseY <480) {
    battery = !battery;
  }  
    if (mouseX >1085 && mouseX <1170 && mouseY >130 && mouseY <180) {
    checkengine = !checkengine;
  }  
      if (mouseX >1085 && mouseX <1170 && mouseY >190 && mouseY <235) {
    lightbeam = !lightbeam;
  } 
    if (mouseX >1085 && mouseX <1170 && mouseY >250 && mouseY <295) {
    transmission = !transmission;
  } 
   if (mouseX >1085 && mouseX <1170 && mouseY >300 && mouseY <355) {
    airsuspension = !airsuspension;
  } 
   if (mouseX >1085 && mouseX <1170 && mouseY >430 && mouseY <475) {
    steering = !steering;
  } 
   if (mouseX >1085 && mouseX <1170 && mouseY >370 && mouseY <420) {
    seatbelt = !seatbelt;
  } 
   if (mouseX >835 && mouseX <890 && mouseY >490 && mouseY <525) {
    standard = !standard;
  } 
    if (mouseX >775 && mouseX <830 && mouseY >490 && mouseY <525) {
    drive = !drive;
  } 
   if (mouseX >655 && mouseX <710 && mouseY >490 && mouseY <525) {
    reverse = !reverse;
  } 
     if (mouseX >595 && mouseX <650 && mouseY >490 && mouseY <525) {
    park = !park;
  } 
     if (mouseX >715 && mouseX <770 && mouseY >490 && mouseY <525) {
    neutral = !neutral;
  } 
       if (mouseX >995 && mouseX <1170 && mouseY >490 && mouseY <525) {
    cruisecontrol = !cruisecontrol;
  } 
}

void controlEvent(ControlEvent theEvent) {
  
  switch(theEvent.getController().getName()) {    
  case "Right":
    lasttimecheck = millis();
    sigLightOn = true;
    if (right.getState() == true) {
      emergency.setState(false);
      left.setState(false);
      leftSig = false;
      rightSig = true;
    } else {
      rightSig = false;
      sigLightOn = false;
    }
    break;
  case "Left":
    lasttimecheck = millis();
    sigLightOn = true;
    if (left.getState() == true) {
      emergency.setState(false);
      right.setState(false);
      rightSig = false;
      leftSig = true;
    } else {
      leftSig = false;
      sigLightOn = false;
    }
    break;
  case "Emer":
    lasttimecheck = millis();
    sigLightOn = true;
    if (emergency.getState() == true) {
      right.setState(false);
      left.setState(false);
      rightSig = true;
      leftSig = true;
    } else {
      rightSig = false;
      leftSig = false;
      sigLightOn = false;
    }
    break;
    case "P":
    if (park) {
           button.addButton("Park").setSize(45,25).setPosition(700,375);
    } else {
      park=false;
      button.addButton(" ").setSize(45,25).setPosition(700,375);
    }
    break;
    case "R":
    if (reverse) {
           button.addButton("Reverse").setSize(45,25).setPosition(700,375);
    } else {
      reverse=false;
      button.addButton(" ").setSize(45,25).setPosition(700,375);
    }
    break;
    case "N":
    if (neutral) {
           button.addButton("Neutral").setSize(45,25).setPosition(700,375);
    } else {
      neutral=false;
      button.addButton(" ").setSize(45,25).setPosition(700,375);
    }
    break;
    case "D":
    if (drive) {
           button.addButton("Drive").setSize(45,25).setPosition(700,375);
    } else {
      drive=false;
      button.addButton(" ").setSize(45,25).setPosition(700,375);
    }
    break;
    case "S":
    if (standard) {
           button.addButton("Standard").setSize(45,25).setPosition(700,375);
    } else {
      standard=false;
      button.addButton(" ").setSize(45,25).setPosition(700,375);
    }
    break;
    
    //case "Warnings":
    //  if(warnings.getState() == true) {
    //    warningChoice = int(random(9));
    //  }
    //  else {
    //    warningChoice = -1;
    //  }
    //  break;
  
  case "Brake":
    cruiseSet = false;
    break;
  }
}
