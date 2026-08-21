//More Bullet
class Youjun {
  int youjunX, youjunY;
  Youjun() {
    youjunX=(int)random(width);
    youjunY=-200;
  }
  void  show() {
    //fill(random(255), random(255), random(255));
    //noStroke();
    ////circle(youjunX, youjunY, 30);
    //rect(youjunX, youjunY, random(40), random(40));//flashing changing rectangle
    image(power, youjunX, youjunY, 40, 40);
  }
  void move() {
    if (play) {
      youjunY+=2;
    }
  }
}
