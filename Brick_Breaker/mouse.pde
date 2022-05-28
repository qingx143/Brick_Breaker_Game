void mouseReleased() {
  if (mode == INTRO)
    introClicks();
  else if (mode == SETTING)
    settingsClicks();
  else if (mode == MODES)
    modesClicks();
  else if (mode == SELECTION)
    selectionClicks();
  else if (mode == PAUSE) 
    pauseClicks();
  else if (mode == GAMEOVER) 
    gameoverClicks();
}

void mouseDragged() {
  if (mode == SETTING)
    settingsClicksDrag();
}
