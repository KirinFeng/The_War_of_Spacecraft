class Peo {
  float  x, y;
  float speed;
  int size;
  Peo() {
    x=(int)random(15, width-15);
    y=int (random(-300, 100));
    speed=1;
    size=40;
  }
  void show() {
    if (index==2) {//index is the level number
      size=35;
    } else if (index==3) {
      size=30;
    } else if (index==4) {
      size=25;
    } else if (index==5) {
      size=20;
    } else {
      size=40;
    }
    fill(x, y, 50);
    //fill(random(255), random(255), random(255));
    noStroke();
    image(kkl,x, y, size*1.2, size*1.2);
    for (Ball ba : balls) {
      if (abs(ba.yb-y)<size/2&&abs(ba.xb-x)<(size-5)/2) {
        y=-200;
        score++;
      }
    }
    if (y>height) {
      y=-200;
      if (frameCount-shieldTime>300)life--;
    }
  }
  void move() {
    y+=speed;
    if (index==2) {
      speed=1.5;
    } else if (index==3) {
      speed=2;
    } else if (index==4) {
      speed=2.5;
    } else if (index==5) {
      speed=3;
    } else {
      speed=1;
    }
    
  }
}
