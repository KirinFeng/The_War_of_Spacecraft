class Forzen {
  float x, y;
  Forzen() {
    x=random(width);
    y=-200;
  }
  void  show() {
    image(snow, x, y, 40, 40);
  }
  void move() {
    if (play) {
      this.y+=2;
    }
  }
}
