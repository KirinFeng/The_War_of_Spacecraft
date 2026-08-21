class Shield {
  float x, y;
  Shield() {
    x=random(width);
    y=-200;
  }
  void  show() {
    image(shield, x, y, 40, 40);
  }
  void move() {
    if (play) {
      this.y+=2;
    }
  }
}
