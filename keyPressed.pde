void keyPressed() {
  // println(key);
  keys[key] = true;//Press 'w', key=119, key[119]=true;

  if (key=='b') {
    play=!play;
  }


  if (key=='r') {
    a=51;//boss Health
    index=1;
    playGame=1;
    score=0;
    life = 20;
    //level=0;
  }
}
