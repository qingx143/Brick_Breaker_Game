void setting() {
  background(backgroundColour);
  settingsTitle();
  settingsOptions();
  settingsSliders();
  settingsMute();
  settingsBonusMode();
  settingsBack();
  main.setGain(volumeMain);
  for (int i = 0; i < soundEffects.length; i++) {
    soundEffects[i].setGain(volumeEffects);
  }
}

//title --------------------------------------------------------------------------------
void settingsTitle() {
  fill(titleColour);
  coffeeFont = createFont("Coffee Extra.ttf", 75);
  textFont(coffeeFont);
  text("Settings", 225, 100);
}

//options ------------------------------------------------------------------------------
void settingsOptions() {
  noStroke();
  fill(buttonBaseColour);
  rect(225, 300, 300, 250, 30);
  
  //options separating lines
  strokeWeight(5);
  stroke(backgroundColour);
  line(85, 262, 365, 262); //top
  line(85, 350, 365, 350); //bottom
}

//sliders ------------------------------------------------------------------------------
void settingsSliders() {
  //slider bases
  noStroke();
  fill(255);
  rect(225, 235, 275, 30, 10); //bgm
  rect(225, 323, 275, 30, 10); //sfx
  
  volumeMain = map(sliderX1, 110, 340, -35, 35);
  volumeEffects = map(sliderX2, 110, 340, -35, 35);
  
  strokeWeight(3);
  stroke(backgroundColour);
  line(110, 235, 340, 235); //bgm
  line(110, 323, 340, 323); //sfx
  
  tactileSlider(sliderX1, 226.5, 243.5);
  circle(sliderX1, 235, 17); //bgm
  fill(255);
  stroke(backgroundColour);
  tactileSlider(sliderX2, 314.5, 331.5);
  circle(sliderX2, 323, 17); //sfx
  
  //slider text
  fill(textColour);
  coffeeFont = createFont("Coffee Extra.ttf", 25);
  textFont(coffeeFont);
  text("bgm", 120, 195);
  text("sfx", 113, 283);
}

void tactileSlider(float sliderX, float top, float bottom) {
  if (mouseX >= sliderX - 15 && mouseX <= sliderX + 15 && mouseY >= top && mouseY <= bottom) 
    fill(buttonBaseColour);
}

//mute ---------------------------------------------------------------------------------
void settingsMute() {
  noStroke();
  //bgm
  if (mouseX >= 330 && mouseX <= 350 && mouseY >= 190 && mouseY <= 210) {
    strokeWeight(3);
    stroke(backgroundColour);
    if (!main.isMuted()) {
      fill(textColour);
      coffeeFont = createFont("Coffee Extra.ttf", 15);
      textFont(coffeeFont);
      text("mute", 305, 198);
    }
  }
  if (main.isMuted()) {
    strokeWeight(3);
    stroke(backgroundColour);
    fill(textColour);
    coffeeFont = createFont("Coffee Extra.ttf", 15);
    textFont(coffeeFont);
    text("muted", 302, 198);
  }
  fill(255);
  square(340, 200, 20);
  
  noStroke();
  //sfx
  if (mouseX >= 330 && mouseX <= 350 && mouseY >= 278 && mouseY <= 298) {
    strokeWeight(3);
    stroke(backgroundColour);
    if (!soundEffects[1].isMuted()) {
      fill(textColour);
      coffeeFont = createFont("Coffee Extra.ttf", 15);
      textFont(coffeeFont);
      text("mute", 305, 286);
    }
  }
  if (soundEffects[0].isMuted()) {
    strokeWeight(3);
    stroke(backgroundColour);
    fill(textColour);
    coffeeFont = createFont("Coffee Extra.ttf", 15);
    textFont(coffeeFont);
    text("muted", 302, 286);
  }
  fill(255);
  square(340, 288, 20);
}

//bonus mode ---------------------------------------------------------------------------
void settingsBonusMode() {
  noStroke();
  fill(255);
  tactileRect(125, 388, 75, 50);
  rect(125, 388, 75, 50, 10);
  
  //bonus mode text
  fill(textColour);
  coffeeFont = createFont("Coffee Extra.ttf", 18);
  textFont(coffeeFont);
  text("bonus", 125, 378);
  text("mode", 125, 395);
 
  coffeeFont = createFont("Coffee Extra.ttf", 15);
  textFont(coffeeFont);
  text("bonus mode allows the", 268, 378);
  text("paddle to move more freely", 268, 395);
  
  fill(buttonBaseColour);
  coffeeFont = createFont("Coffee Extra.ttf", 18);
  textFont(coffeeFont);
  if (bonus) 
    text("bonus mode is on", 225, 445);
  else
    text("bonus mode is off", 225, 445);
  
}

//back ---------------------------------------------------------------------------------
void settingsBack() {
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
void settingsClicks() {
  if (mouseX >= 20 && mouseX <= 90 && mouseY >= 20 && mouseY <= 50) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = INTRO;
  }
  if (mouseX >= (125 - (float) 75/2) && mouseX <= (125 + (float) 75/2) && mouseY >= 363 && mouseY <= 413) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    bonus = !bonus;
  }
  
  //mute
  if (mouseX >= 330 && mouseX <= 350 && mouseY >= 190 && mouseY <= 210) { //bgm
    soundEffects[1].rewind();
    soundEffects[1].play();
    if (main.isMuted())
      main.unmute();
    else
      main.mute();
  }
  
  if (mouseX >= 330 && mouseX <= 350 && mouseY >= 278 && mouseY <= 298) { //sfx
    soundEffects[1].rewind();
    soundEffects[1].play();
    if (soundEffects[1].isMuted())
      for (int i = 0; i < soundEffects.length; i++) {
        soundEffects[i].unmute();
      }
    else
      for (int i = 0; i < soundEffects.length; i++) {
        soundEffects[i].mute();
      }
  }
  
  //sliders
  if (mouseX >= 110 && mouseX <= 340 && mouseY >= 226.5 && mouseY <= 243.5) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    sliderX1 = mouseX;
  }
  if (mouseX >= 110 && mouseX <= 340 && mouseY >= 314.5 && mouseY <= 331.5) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    sliderX2 = mouseX;
  }
}

void settingsClicksDrag() {
  if (mouseX >= 110 && mouseX <= 340 && mouseY >= 226.5 && mouseY <= 243.5) 
    sliderX1 = mouseX;
  if (mouseX >= 110 && mouseX <= 340 && mouseY >= 314.5 && mouseY <= 331.5)
    sliderX2 = mouseX;
}
