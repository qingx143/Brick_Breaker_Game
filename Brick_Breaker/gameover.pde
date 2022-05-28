void gameover() {
  background(backgroundColour);
  gameoverTitle();
  gameoverChoices();
  for (int i = 0; i < popBubbles.length; i++) {
    popBubbles[i].show(bubbleA[i]);
    popBubbles[i].act();
  }
}

//title --------------------------------------------------------------------------------
void gameoverTitle() {
  fill(titleColour);
  coffeeFont = createFont("Coffee Extra.ttf", 75);
  textFont(coffeeFont);
  if (win) {
    text("You Win!", 225, 100);
    coffeeFont = createFont("Coffee Extra.ttf", 30);
    textFont(coffeeFont);
    text("pop the bubbles", 225, 215);
    text("for encouraging messages!", 225, 255);
  }
  if (!win) {
    text("Gameover", 225, 100);
    coffeeFont = createFont("Coffee Extra.ttf", 30);
    textFont(coffeeFont);
    text("try again next time", 225, 215);
    text("to pop the bubbles!", 225, 255);
  }
}

//choices ------------------------------------------------------------------------------
void gameoverChoices() {
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(125, 380, 150, 60);
  rect(125, 380, 150, 60, 10); //return
  
  noStroke();
  tactileRect2(325, 380, 150, 60);
  rect(325, 380, 150, 60, 10); //menu
  
  //text
  fill(textColour);
  coffeeFont = createFont("Coffee Extra.ttf", 23);
  textFont(coffeeFont);
  text("main menu", 125, 375);
  text("exit game", 325, 375);
}

//clicks -------------------------------------------------------------------------------
void gameoverClicks() {
  if (mouseX >= 50 && mouseX <= 200 && mouseY >= 350 && mouseY <= 410) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    if (win)
      totalPoints += score;
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
    for (int i = 0; i < bubbleA.length; i++) {
      bubbleA[i] = true;
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
  if (mouseX >= 250 && mouseX <= 400 && mouseY >= 350 && mouseY <= 410) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    exit();
  }
    
  if (win) {
    for (int i = 0; i < popBubbles.length; i++) {
      if (dist(popBubbles[i].getx(), popBubbles[i].gety(), mouseX, mouseY) <= popBubbles[i].getSize()/2) {
        soundEffects[2].rewind();
        soundEffects[2].play();
        bubbleA[i] = false;
      }
    }
  }
}
