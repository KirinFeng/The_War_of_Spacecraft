class Boos {
  PVector loc, vel, acc;
  float t;
  Boos(float x, float y) {
    t=8;
    loc=new PVector(x, y);
    vel=new PVector(sin(t)*10, cos(t)*10);
    acc=PVector.random2D();
  }
  boolean isDead() {
    return loc.x>width||loc.x<0||loc.y<0||loc.y>height;
  }
  void show() {
    noStroke();
    fill(x, y, 200);
    ellipse(loc.x, loc.y, 5, 5);
    //rect(loc.x, loc.y, 10, 5);
  }
  void move() {
    loc.add(vel);
    vel.add(acc);
    vel.mult(1);
    vel.limit(4.7);
  }
}
