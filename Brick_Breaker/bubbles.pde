class Bubbles{
  float x, y, size;
  float vx, vy;
  int messages;
  
  Bubbles() {
    size = random(75, 100);
    x = random((size/2), width - (size/2));
    y = random((size/2), height - size/2);
    vx = random(-2, 2);
    vy = random(-2, 2);
    messages = (int) random(1, 6);
  }
  
  void show(boolean bubbleAppear) {
    noStroke();
    fill(255, 255, 255, 150);
    if (bubbleAppear)
      circle(x, y, size);
    else if (!bubbleAppear) {
        fill(titleColour);
      if (messages == 1) {
        coffeeFont = createFont("Coffee Extra.ttf", size/5);
        textFont(coffeeFont);
        text("you're amazing!", x, y);
      }
      if (messages == 2) {
        coffeeFont = createFont("Coffee Extra.ttf", size/5);
        textFont(coffeeFont);
        text("congrats!", x, y);
      }
      if (messages == 3) {
        coffeeFont = createFont("Coffee Extra.ttf", size/5);
        textFont(coffeeFont);
        text("that was awesome!", x, y);
      }
      if (messages == 4) {
        coffeeFont = createFont("Coffee Extra.ttf", size/5);
        textFont(coffeeFont);
        text("that was so cool!", x, y);
      }
      if (messages == 5) {
        coffeeFont = createFont("Coffee Extra.ttf", size/5);
        textFont(coffeeFont);
        text("impressive!", x, y);
      }
    }
  }
  
  void act() {
    x += vx;
    y += vy;
    if (x - size/2 <= 0 || x + size/2 >= 450)
      vx *= -1;
    if (y - size/2 <= 0 || y + size/2 >= 500)
      vy *= -1;
  }
  
  float getx() {
    return x;
  }
  
  float gety() {
    return y;
  }
  
  float getSize() {
    return size;
  }
}
