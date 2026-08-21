void mousePressed() {
  //Home Page-------------------------------------------------
  if (playGame==0) {
    if (abs(mouseX-150)<60&&abs(mouseY-340)<30) {
      gameMode=1;
      playGame=1;
      a=51;//boss Health
      index=1;
      playGame=1;//"Start" Button
      life=20;
      score=0;
    }
    if (abs(mouseX-150)<60&&abs(mouseY-420)<30) {
      gameMode=2;
      playGame=1;
      a=51;//boss Health
      index=1;
      playGame=1;//"MultiPlayer" Button
      life=20;
      score=0;
    }
    if (abs(mouseX-150)<60&&abs(mouseY-500)<30) {
      playGame=2;//"Setting" Button
    }
    if (abs(mouseX-150)<60&&abs(mouseY-580)<30) {
      playGame=3;//"Help" Button
    }
    if (abs(mouseX-150)<60&&abs(mouseY-660)<30) {
      playGame=4;//"About" Button
    }
    if (abs(mouseX-150)<60&&abs(mouseY-740)<30) {
      exit();//"Exit" Button
    }
  } else {
    if (abs(mouseX-15)<20&&abs(mouseY-20)<20) {
      playGame=0;//"Back" Button on every page
    }
  }
  //Setting Page----------------------------------------------------------
  if (playGame==2) {
    if (abs(mouseX-width/2+200)<50&&abs(mouseY-300)<40) {
      music=0;
      //println(4);
      s1.play( );
    } else if (abs(mouseX-width/2)<50&&abs(mouseY-300)<40) {
      music=1;
      //println(5);
      s1.pause( );
    }
    
    if (abs(mouseX-width/2+200)<50&&abs(mouseY-500)<40) {
      bgc=0;
      println(1);
    } else if (abs(mouseX-width/2)<50&&abs(mouseY-500)<40) {
      bgc=1;
      println(2);
    } else if (abs(mouseX-width/2-200)<50&&abs(mouseY-500)<40) {
      bgc=2;
      println(3);
    }
    
    if (abs(mouseX-width/2+200)<50&&abs(mouseY-700)<40) {
      skin_id=0;
    } else if (abs(mouseX-width/2)<50&&abs(mouseY-700)<40) {
      skin_id=1;
    } else if (abs(mouseX-width/2-200)<50&&abs(mouseY-700)<40) {
      skin_id=2;
    }
  }
}
