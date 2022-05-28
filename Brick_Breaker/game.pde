void game() {
  background(backgroundColour);
  fill(#6CB4ED);
  textSize(15);
  text("CHARLOTTE AND MADILYN \n AND MEGAN WERE HERE!!", 95, 410);
  if (pkey) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = PAUSE;
  }
  gameMovementPaddle();
  gameMovementBall();
  gameText();
  gamePauseText();

  //bricks
  if (gameMode == 1 || gameMode == 2) {
    for (int i = 0; i < x.length; i++) {
      if (alive[i])
        manageBricks(i);
    }
  }
  
  if (gameMode == 3 || gameMode == 4) {
    for (int i = 0; i < x2.length; i++) {
      if (alive2[i])
        manageBricks(i);
    }
  }

  //losing
  if (lives <= 0) {
    win = false;
    soundEffects[4].rewind();
    soundEffects[4].play();
    mode = GAMEOVER;
  }
    
  //winning
  if ((gameMode == 1 || gameMode == 2) && score >= (28 * 100)) {
    win = true;
    soundEffects[3].rewind();
    soundEffects[3].play();
    mode = GAMEOVER;
  }
    
  if ((gameMode == 3 || gameMode == 4) && score >= 12 * 100) {
    win = true;
    soundEffects[3].rewind();
    soundEffects[3].play();
    mode = GAMEOVER;
  }
}

//managing bricks ----------------------------------------------------------------------
void manageBricks(int i) { 
  if (gameMode == 1 || gameMode == 2) {
    if (y[i] == 80) fill(#1F476A);
    if (y[i] == 140) fill(#386D9B);
    if (y[i] == 200) fill(#5195CE);
    if (y[i] == 260) fill(#9FCCF2);
  }
  if (gameMode == 3) {
    if (y2[i] == 80) fill(#1F476A);
    if (y2[i] == 140) fill(#386D9B);
    if (y2[i] == 200) fill(#5195CE);
    if (y2[i] == 260) fill(#9FCCF2);
  }
  
  if (gameMode == 4) 
    fill(#6CB4ED);
  
  if (gameMode == 1) {
    circle(x[i], y[i], brickw);
    if (dist(x[i], y[i], ballx, bally) <= 7.5 + brickw/2) {
      score += 100;
      ballvx = (ballx - x[i]) / 8;
      ballvy = (bally - y[i]) / 8;
      alive[i] = false;
    }
  }
  
  if (gameMode == 2) {
    hit = circleRect(ballx, bally, x[i], y[i], brickw, brickh);
    rect(x[i], y[i], brickw, brickh);
    if (hit) {
      score += 100;
      ballvx = (ballx - x[i]) / 8;
      ballvy = (bally - y[i]) / 8;
      alive[i] = false;
    }
  }
  
  if (gameMode == 3 || gameMode == 4) {
    hit = circleRect(ballx, bally, x2[i], y2[i], brickw, brickh);
    rect(x2[i], y2[i], brickw, brickh);
    brickMovement(i);
    
    if (hit) {
      score += 100;
      ballvx = (ballx - x2[i]) / 8;
      ballvy = (bally - y2[i]) / 8;
      alive2[i] = false;
    }
  }
}

void brickMovement(int i) { 
  x2[i] += a[i]*randomNums[i];
  if (x2[i] <= 45)
    a[i] = 1.0;
  if (x2[i] >= 405)
    a[i] = -1.0;
}

//circle rect --------------------------------------------------------------------------
boolean circleRect(float ballx, float bally, float brickx, float bricky, float brickw, float brickh) {
  float testX = ballx;
  float testY = bally;
  
  if (ballx < (brickx - brickw/2)) testX = (brickx - brickw/2);
  else if (ballx > (brickx + brickw/2)) testX = (brickx + brickw/2);
  if (bally < (bricky - brickh/2)) testY = (bricky - brickh/2);
  else if (bally > (bricky + brickh/2)) testY = (bricky + brickh/2);
  
  float distX = ballx - testX;
  float distY = bally - testY;
  float distance = sqrt((distX * distX) + (distY * distY));
  
  if (distance <= 7.5) //7.5 = ball radius
    return true;
  return false;
}

//movement paddle ----------------------------------------------------------------------
void gameMovementPaddle() {
  noStroke();
  fill(currentPaddleColour);
  if (gameMode == 4) 
    fill(#6CB4ED);
  if (!rectPaddle)
    circle(paddlex, paddley, 60);
  if (rectPaddle) 
    rect(paddlex, paddley, 60, 20);
    

  if (rightkey)
    paddlex += 5;
  if (leftkey)
    paddlex -= 5;

  if (bonus) {
    if (downkey)
      paddley += 5;
    if (upkey)
      paddley -= 5;
  }


  paddley = min(paddley, 440); //bottom
  paddley = max(paddley, 340); //top

  paddlex = min(paddlex, width - 40); //right
  paddlex = max(paddlex, 40); //left
}

//movement ball ------------------------------------------------------------------------
void gameMovementBall() {
  noStroke();
  fill(255);
  if (gameMode == 4)
    fill(#6CB4ED);
  circle(ballx, bally, 15);
  ballx += ballvx;
  bally += ballvy;
  
  //borders
  if (ballx - 7.5 <= 0 || ballx + 7.5 >= 450)
    ballvx *= -1;
  if (bally - 7.5 <= 50) //top
    ballvy *= -1;
  
  //if ball hits paddle
  if (rectPaddle && circleRect(ballx, bally, paddlex, paddley, 60, 20)) { 
    ballvx = map(ballx - (paddlex - 30), 0, 60, -10, 10) / 5; 
    ballvy = (bally - paddley) / 5;
  }

  if (!rectPaddle && dist(paddlex, paddley, ballx, bally) <= 37.5) {
    ballvx = (ballx - paddlex) / 8;
    ballvy = (bally - paddley) / 8;
  }

  //resetting ball
  if (bally > 500) {
    ballx = 225;
    bally = 380;
    ballvx = 0;
    ballvy = 0.5;
    paddlex = 225;
    paddley = 440;
    lives--;
  }

  if (ballx + 7.5 < 0 || ballx - 7.5 > 450) {
    ballx = 225;
    bally = 380;
    ballvx = 0;
    ballvy = 0.5;
    paddlex = 225;
    paddley = 440;
  }
}

//text ---------------------------------------------------------------------------------
void gameText() {
  fill(255);
  coffeeFont = createFont("Coffee Extra.ttf", 25);
  textFont(coffeeFont);
  text("lives = " + lives, 60, 25);
  text("score = " + score, 360, 25);
}



//pause text ---------------------------------------------------------------------------
void gamePauseText() {
  noStroke();
  fill(textColour);
  rect(255, 475, 510, 65);

  fill(buttonBaseColour);
  coffeeFont = createFont("Coffee Extra.ttf", 25);
  textFont(coffeeFont);
  text("press 'p' to pause", 225, 460);
}
