void pause() {
  background(backgroundColour);
  pauseTitle();
  pauseDesign();
  pauseChoices();
}

//title --------------------------------------------------------------------------------
void pauseTitle() {
  fill(titleColour);
  coffeeFont = createFont("Coffee Extra.ttf", 75);
  textFont(coffeeFont);
  text("Paused", 225, 100);
}

//design -------------------------------------------------------------------------------
void pauseDesign() {
  strokeWeight(2);
  stroke(255, 255, 255, 100);
  fill(255, 255, 255, 100);
  circle(225, 250, 170);
}

//choices ------------------------------------------------------------------------------
void pauseChoices() {
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(125, 380, 150, 60);
  rect(125, 380, 150, 60, 10); //return
  
  noStroke();
  tactileRect2(325, 380, 150, 60);
  rect(325, 380, 150, 60, 10); //menu
  
  //text
  fill(textColour);
  coffeeFont = createFont("Coffee Extra.ttf", 20);
  textFont(coffeeFont);
  text("back to", 125, 367);
  text("game", 125, 387);
  text("main menu", 325, 375);
}

//clicks -------------------------------------------------------------------------------
void pauseClicks() {
  if (mouseX >= 50 && mouseX <= 200 && mouseY >= 350 && mouseY <= 410) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = GAME;
  }
  if (mouseX >= 250 && mouseX <= 400 && mouseY >= 350 && mouseY <= 410) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    ballx = 225;
    bally = 380;
    ballvx = 0;
    ballvy = 0.5;
    paddlex = 225;
    paddley = 440;
    lives = 3;
    score = 0;
    mode = INTRO;
    for (int i = 0; i < 28; i++) {
      alive[i] = true;
    }
    for (int i = 0; i < 12; i++) {
      alive2[i] = true;
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
  }
}
