/*
Zi Qing Xiong
2-4
May 2022
Brick Breaker Game

Hi, I'm really sorry that it's late again... 
I will try my best to make sure the next one is on time!
Thank you so much!
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode = 0;
final int INTRO = 1;
final int SETTING = 2;
final int SELECTION = 3;
final int MODES = 4;
final int GAME = 5;
final int PAUSE = 6;
final int GAMEOVER = 7;

//colours ------------------------------------------------------------------------------
color backgroundColour = #78BAF2;
color buttonBaseColour = #C6E5FF;
color titleColour = #093A64;
color textColour = #4E8FC6;
color currentPaddleColour = buttonBaseColour;
color[] paddleColours = new color[7];

//animations ---------------------------------------------------------------------------
PImage[] differentModes = new PImage[4];
int currentModeNum = 0;
int gameMode = 1;
Bubbles[] popBubbles = new Bubbles[7];
boolean[] bubbleA = new boolean[7];

//bricks -------------------------------------------------------------------------------
int[] x = new int[28];
int[] y = new int[28];
int brickw = 50;
int brickh = 30;
int tempx, tempy;
boolean[] alive = new boolean[28];
boolean hit = false;

float[] x2 = new float[12];
int[] y2 = new int[12];
boolean[] alive2 = new boolean[12];

//paddles and balls --------------------------------------------------------------------
float paddlex = 225;
float paddley = 440;

float ballx = 225;
float bally = 380;
float ballvx = 0;
float ballvy = 0.5;

//music --------------------------------------------------------------------------------
Minim minim;
AudioPlayer main;
AudioPlayer[] soundEffects = new AudioPlayer[5];
float volumeMain = 0;
float volumeEffects = 0;
float sliderX1 = 225;
float sliderX2 = 225;

//keyboard -----------------------------------------------------------------------------
boolean leftkey = false;
boolean upkey = false;
boolean downkey = false;
boolean rightkey = false;
boolean pkey = false;

//other --------------------------------------------------------------------------------
PFont coffeeFont;
int currentPaddleNum = 0;
boolean rectPaddle = false;
boolean win = false;
boolean bonus = false;
int count = 0;
int lives = 3;
int score = 0;
int totalPoints = 0;
float[] a = new float[12];
int[] randomNums = new int[12];


void setup() {
  size(450, 500); //halfway mar = (225, 250)
  
  //sound ------------------------------------------------------------------------------
  minim = new Minim(this);
  main = minim.loadFile("main.mp3");
  soundEffects[0] = minim.loadFile("choices.mp3");
  soundEffects[1] = minim.loadFile("selection.mp3");
  soundEffects[2] = minim.loadFile("bubbles.mp3");
  soundEffects[3] = minim.loadFile("win.mp3");
  soundEffects[4] = minim.loadFile("lose.mp3");
  
  //arrays -----------------------------------------------------------------------------
  tempx = 45;
  tempy = 80;
  for (int i = 0; i < x.length; i++) {
    x[i] = tempx;
    y[i] = tempy;
    tempx += 60;
    if (tempx >= width) {
      tempy += 60;
      tempx = 45;
    }
  }
  
  for (int i = 0; i < x.length; i++) {
    alive[i] = true;
  }
  
  tempx = 45;
  tempy = 80;
  for (int i = 0; i < x2.length; i++) {
    x2[i] = tempx;
    y2[i] = tempy;
    tempx += 180;
    if (tempx >= width) {
      tempy += 60;
      tempx = 45;
    }
  }
  
  for (int i = 0; i < x2.length; i++) {
    alive2[i] = true;
  }
  
  paddleColours[0] = buttonBaseColour;
  paddleColours[1] = #FFFCC4;
  paddleColours[2] = #FFE1A5;
  paddleColours[3] = #C1FFAF;
  paddleColours[4] = #FFDBF6;
  paddleColours[5] = #FFB9B7;
  paddleColours[6] = #EFCBFF;
  
  for (int i = 0; i < a.length; i++) {
    a[i] = 1.0;
  }
  
  for (int i = 0; i < randomNums.length; i++) {
    randomNums[i] = (int) random(2, 5);
  }
  
  for (int i = 0; i < popBubbles.length; i++) {
    popBubbles[i] = new Bubbles();
  }
  
  for (int i = 0; i < bubbleA.length; i++) {
    bubbleA[i] = true;
  }
  
  //images -----------------------------------------------------------------------------
  differentModes[0] = loadImage("circleMode.PNG");
  differentModes[1] = loadImage("rectMode.PNG");
  differentModes[2] = loadImage("chaosMode.PNG");
  differentModes[3] = loadImage("funMode.PNG");
  
  //other ------------------------------------------------------------------------------
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  
  mode = INTRO;
  main.loop();
}

void draw() { 
  if (mode == INTRO) 
    intro();
  else if (mode == SETTING) 
    setting();
  else if (mode == SELECTION) 
    selection();
  else if (mode == MODES)
    modes();
  else if (mode == GAME) 
    game();
  else if (mode == PAUSE) 
    pause();
  else if (mode == GAMEOVER) 
    gameover();
  else 
    println("Error: Mode = " + mode);
}

//tactile rectangular buttons ----------------------------------------------------------
void tactileRect(int x, double y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    strokeWeight(3);
    stroke(backgroundColour);
  }
}

//tactile rectangular buttons ----------------------------------------------------------
void tactileRect2(int x, double y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    strokeWeight(3);
    stroke(textColour);
  }
}
