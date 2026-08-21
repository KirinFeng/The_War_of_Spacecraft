class Player2Ball {
  float x2, y2;
  float ysped2;
  
  Player2Ball(float x2_, float y2_) {
    x2=x2_;
    y2=y2_;
    ysped2=30;
  }
  boolean isDead() {
    if (y2<0) {
      return true;
    } else {
      return false;
    }
  }
  void show() {
    fill(x2, y2, 50);
    fill(0);
    noStroke();
    ellipse(x2, y2, 5, 5);
    //rect(x2, y2, 10, 5);
  }
  void move() {
    y2-=ysped;
  }
}
