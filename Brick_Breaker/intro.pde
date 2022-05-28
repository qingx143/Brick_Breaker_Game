void intro() {
  background(backgroundColour);
  for (int i = 0; i < popBubbles.length; i++) {
    popBubbles[i].show(bubbleA[i]);
    popBubbles[i].act();
  }
  introTitle();
  introOptions();
}

//title --------------------------------------------------------------------------------
void introTitle() {
  fill(titleColour);
  coffeeFont = createFont("Coffee Extra.ttf", 75);
  textFont(coffeeFont);
  text("Breakout!", 225, 100);
}

//options ------------------------------------------------------------------------------
void introOptions() {
  noStroke();
  fill(buttonBaseColour);
  rect(225, 300, 300, 250, 30); //options base
  
  //buttons
  fill(255);
  noStroke();
  tactileRect(225, 217.5, 275, 45);
  rect(225, 217.5, 275, 45, 10); //play
  
  noStroke();
  tactileRect(225, 272.5, 275, 45);
  rect(225, 272.5, 275, 45, 10); //selection
  
  noStroke();
  tactileRect(225, 327.5, 275, 45);
  rect(225, 327.5, 275, 45, 10); //modes
  
  noStroke();
  tactileRect(225, 382.5, 275, 45);
  rect(225, 382.5, 275, 45, 10); //settings
  
  //text for buttons
  fill(textColour);
  coffeeFont = createFont("Coffee Extra.ttf", 25);
  textFont(coffeeFont);
  text("play", 225, 215.5);
  text("selection", 225, 270.5); 
  text("modes", 225, 325.5);
  text("settings", 225, 380.5);
}

//clicks -------------------------------------------------------------------------------
void introClicks() {
  if (mouseX >= (225 - (float) 275/2) && mouseX <= (225 + (float) 275/2) && mouseY >= (217.5 - (float) 45/2) && mouseY <= (217.5 + (float) 45/2)) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = GAME;
  }
    
  if (mouseX >= (225 - (float) 275/2) && mouseX <= (225 + (float) 275/2) && mouseY >= (272.5 - (float) 45/2) && mouseY <= (272.5 + (float) 45/2)) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = SELECTION;
  }
    
  if (mouseX >= (225 - (float) 275/2) && mouseX <= (225 + (float) 275/2) && mouseY >= (327.5 - (float) 45/2) && mouseY <= (327.5 + (float) 45/2)) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = MODES;
  }
    
  if (mouseX >= (225 - (float) 275/2) && mouseX <= (225 + (float) 275/2) && mouseY >= (382.5 - (float) 45/2) && mouseY <= (382 + (float) 45/2)) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = SETTING;
  }
}
