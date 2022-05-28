void modes() {
  background(backgroundColour);
  modesTitle();
  modesBase();
  modesBack();
}

//title --------------------------------------------------------------------------------
void modesTitle() {
  fill(titleColour);
  coffeeFont = createFont("Coffee Extra.ttf", 75);
  textFont(coffeeFont);
  text("Modes", 225, 100);
}

//base ---------------------------------------------------------------------------------
void modesBase() {
  noStroke();
  fill(buttonBaseColour);
  rect(225, 300, 225, 250, 15);
  
  //arrows
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(65, 300, 50, 100);
  rect(65, 300, 50, 100, 10); //left
  fill(255);
  triangle(55, 300, 75, 315, 75, 285);
  
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(385, 300, 50, 100);
  rect(385, 300, 50, 100, 10); //right
  fill(255);
  triangle(395, 300, 375, 315, 375, 285);
  
  //tiny circles
  strokeWeight(1.5);
  stroke(textColour);
  fill(textColour);
  if (currentModeNum == 0) {
    image(differentModes[0], 225, 300, 235, 235);
    gameMode = 1;
    stroke(255);
  }
  circle(195, 440, 10);
  stroke(textColour);
  if (currentModeNum == 1) {
    image(differentModes[1], 225, 300, 235, 235);
    gameMode = 2;
    stroke(255);
  }
  circle(215, 440, 10);
  stroke(textColour);
  if (currentModeNum == 2) {
    image(differentModes[2], 225, 300, 235, 235);
    gameMode = 3;
    stroke(255);
  }
  circle(235, 440, 10);
  stroke(textColour);
  if (currentModeNum == 3) {
    image(differentModes[3], 225, 300, 235, 235);
    gameMode = 4;
    stroke(255);
  }
  circle(255, 440, 10);
  
  //text
  noStroke();
  fill(buttonBaseColour);
  rect(225, 375, 215, 90);
  
  fill(textColour);
  if (gameMode == 1) {
    coffeeFont = createFont("Coffee Extra.ttf", 20);
    textFont(coffeeFont);
    text("circle mode:", 225, 350);
    text("all bricks are", 225, 375);
    text("circles :3", 225, 400);
  }
  if (gameMode == 2) {
    coffeeFont = createFont("Coffee Extra.ttf", 20);
    textFont(coffeeFont);
    text("rectangle mode:", 225, 350);
    text("all bricks are", 225, 375);
    text("rectangles :3", 225, 400);
  }
  if (gameMode == 3) {
    coffeeFont = createFont("Coffee Extra.ttf", 20);
    textFont(coffeeFont);
    text("chaos mode:", 225, 350);
    text("all bricks are", 225, 375);
    text("moving rectangles :)", 225, 400);
  }
  if (gameMode == 4) {
    coffeeFont = createFont("Coffee Extra.ttf", 20);
    textFont(coffeeFont);
    text("chaotic \"fun\" mode:", 225, 350);
    text("all bricks are moving", 225, 375);
    text("and difficult to see :D", 225, 400);
  }
}

//back ---------------------------------------------------------------------------------
void modesBack() {
  noStroke();
  fill(255);
  tactileRect2(55, 35, 70, 30);
  rect(55, 35, 70, 30, 5);
  
  //text
  fill(textColour);
  coffeeFont = createFont("Coffee Extra.ttf", 20);
  textFont(coffeeFont);
  text("back", 55, 32);
}

//clicks -------------------------------------------------------------------------------
void modesClicks() {
  if (mouseX >= 20 && mouseX <= 90 && mouseY >= 20 && mouseY <= 50) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = INTRO;
  }
  if (mouseX >= 40 && mouseX <= 90 && mouseY >= 250 && mouseY <= 350 && currentModeNum != 0) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    currentModeNum--;
  }
  if (mouseX >= 360 && mouseX <= 410 && mouseY >= 250 && mouseY <= 350 && currentModeNum != 3) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    currentModeNum++;
  }
}
