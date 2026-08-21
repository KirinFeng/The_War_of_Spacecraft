class Speed {
  float x, y;
  Speed() {
    x=random(width);
    y=-200;
  }
  void  show() {
    image(speed, x, y, 40, 40);
  }
  void move() {
    if (play) {
      this.y+=2;
    }
  }
}
