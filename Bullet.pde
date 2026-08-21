class Ball {
  float xb, yb;
  float xspeed, yspeed;
  Ball(float x_, float y_, float angle) {
    xb=x_;
    yb=y_;
    float speed = 50;
    float rad = radians(angle - 90);

    xspeed = cos(rad) * speed;
    yspeed = sin(rad) * speed;
  }
  boolean isDead() {
    if (yb<0) {
      return true;
    } else {
      return false;
    }
  }
  void show() {
    fill(xb, yb, 50);
    noStroke();
    ellipse(xb, yb, 5, 5);
  }
  void move() {
    xb += xspeed;
    yb += yspeed;
  }
}
