void selection() {
  background(backgroundColour);
  selectionTitle();
  selectionPaddle();
  selectionShape();
  selectionBack();
}

//title --------------------------------------------------------------------------------
void selectionTitle() {
  fill(titleColour);
  coffeeFont = createFont("Coffee Extra.ttf", 75);
  textFont(coffeeFont);
  text("Selection", 225, 100);
}

//paddle -------------------------------------------------------------------------------
void selectionPaddle() {
  fill(titleColour);
  coffeeFont = createFont("Coffee Extra.ttf", 25);
  textFont(coffeeFont);
  text("paddle colour:", 225, 155);
  coffeeFont = createFont("Coffee Extra.ttf", 20);
  textFont(coffeeFont);
  text("total points: " + totalPoints, 350, 25);
  
  noStroke();
  fill(currentPaddleColour);
  if (!rectPaddle)
    circle(225, 270, 150); //circle paddle
  
  if (rectPaddle)
    rect(225, 270, 150, 70, 10); //rectangle paddle
    
  //tiny circles at bottom
  strokeWeight(1.5);
  fill(textColour);
  
  if (currentPaddleNum == 0) 
    stroke(255);
  else
    stroke(textColour);
  circle(165, 362, 10);
  if (currentPaddleNum == 1) 
    stroke(255);
  else
    stroke(textColour);
  circle(185, 362, 10);
  if (currentPaddleNum == 2) 
    stroke(255);
  else
    stroke(textColour);
  circle(205, 362, 10);
  if (currentPaddleNum == 3) 
    stroke(255);
  else
    stroke(textColour);
  circle(225, 362, 10);
  if (currentPaddleNum == 4) 
    stroke(255);
  else
    stroke(textColour);
  circle(245, 362, 10);
  if (currentPaddleNum == 5) 
    stroke(255);
  else
    stroke(textColour);
  circle(265, 362, 10);
  if (currentPaddleNum == 6) 
    stroke(255);
  else
    stroke(textColour);
  circle(285, 362, 10);
  
  //arrows
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(85, 270, 50, 100);
  rect(85, 270, 50, 100, 10); //left
  fill(255);
  triangle(75, 270, 95, 285, 95, 255);
  
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(365, 270, 50, 100);
  rect(365, 270, 50, 100, 10); //right
  fill(255);
  triangle(375, 270, 355, 285, 355, 255);
}

//rect or circle paddles ---------------------------------------------------------------
void selectionShape() {
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(125, 425, 150, 60);
  if (!rectPaddle) {
    strokeWeight(3);
    stroke(255);
  }
  rect(125, 425, 150, 60, 10); //rect paddle
  
  noStroke();
  tactileRect2(325, 425, 150, 60);
  if (rectPaddle) {
    strokeWeight(3);
    stroke(255);
  }
  rect(325, 425, 150, 60, 10); //circle paddle
  
  //text
  fill(textColour);
  coffeeFont = createFont("Coffee Extra.ttf", 22);
  textFont(coffeeFont);
  text("circle", 125, 410);
  text("paddle", 125, 435);
  text("rectangle", 325, 410);
  text("paddle", 325, 435);
}

//back ---------------------------------------------------------------------------------
void selectionBack() {
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
void selectionClicks() {
  if (mouseX >= 20 && mouseX <= 90 && mouseY >= 20 && mouseY <= 50) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = INTRO;
  }
    
  if (mouseX >= 60 && mouseX <= 110 && mouseY >= 220 && mouseY <= 320) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    if (paddleColours[0] != currentPaddleColour) {
      currentPaddleColour = paddleColours[currentPaddleNum - 1];
      currentPaddleNum--;
    }
  }
  
  if (mouseX >= 340 && mouseX <= 390 && mouseY >= 220 && mouseY <= 320) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    if (paddleColours[6] != currentPaddleColour) {
      currentPaddleColour = paddleColours[currentPaddleNum + 1];
      currentPaddleNum++;
    }
  }
    
  if (mouseX >= 50 && mouseX <= 200 && mouseY >= 395 && mouseY <= 455) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    rectPaddle = false;
  }
  if (mouseX >= 250 && mouseX <= 400 && mouseY >= 395 && mouseY <= 455) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    rectPaddle = true;
  }
}
