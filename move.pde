///Key Press
void move() {
  float angleSped = 1;
  if (play && keyPressed) {
    if (keys['a']) {
      x -= sped;
    }
    if (keys['d']) {
      x += sped;
    }
    if (keys['w']) {
      jump=true;
    }
    if (keys['q']) {
      angle-=angleSped;
    }
    if (keys['e']) {
      angle+=angleSped;
    }
    if (angle < -90) {
      angle = -90;
    } else if (angle > 90) {
      angle = 90;
    }
    //--------------------------------
    if (gameMode == 2) {
      if (keys['j']) {
        x2 -= sped2;
      }
      if (keys['l']) {
        x2 += sped2;
      }
      if (keys['i']) {
        jump2 = true;
      }
      if (keys['u']) {
        angle2-=angleSped;
      }
      if (keys['o']) {
        angle2+=angleSped;
      }
      if (angle2 < -90) {
        angle2 = -90;
      } else if (angle2 > 90) {
        angle2 = 90;
      }
    }
    //if (key == 'k') {//player2 bullet control
    //  balls.add(new Ball(x2+200, y2)); 
    //}
  }
  if (true) {

    //if(keyPressed && key=='p') {
    balls.add(new Ball(x, y-15, angle));//player1 auto shot
    if (gameMode == 2) {
      balls.add(new Ball(x2, y2, angle2));//player2 auto shot
    }
    if (flag) {
      time--;
      balls.add(new Ball(x-15, y-15, angle));
      balls.add(new Ball(x+15, y-15, angle));
      balls.add(new Ball(x-30, y-15, angle));
      balls.add(new Ball(x+30, y-15, angle));
      
      if (gameMode == 2) {
        balls.add(new Ball(x2-15, y2-15, angle2));
        balls.add(new Ball(x2+15, y2-15, angle2));
        balls.add(new Ball(x2-30, y2-15, angle2));
        balls.add(new Ball(x2+30, y2-15, angle2));
      }
    }
    if (fast) {
      time--;
      sped = 30;
    }
    //}
  }
}
