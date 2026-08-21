//Heal
class Buji {
  float bujiX, bujiY;
  Buji() {
    bujiX=random(width);
    bujiY=-200;
  }
  void  show() {
    //fill(0,255,0);
    //noStroke();
    ////circle(bujiX, bujiY, 30);
    //rect(bujiX, bujiY, random(40), random(40));//green rectangle
    image(heal, bujiX, bujiY, 40, 40);
  }
  void move() {
    if (bujiY>height) {
      bujiX=(int)random(width);
      bujiY=-200;
    }
    if (play) {
      bujiY+=2;
    }
  }
}
