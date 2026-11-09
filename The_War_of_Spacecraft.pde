import ddf.minim.*;
Minim m;
AudioPlayer s1;
float x=15;
float x2=1000-15;
float y=785;
float y2=785;
float angle = 0;
float angle2 = 0;
float ysped=8;
float ysped2=8;
float topheight=585;
float toheight2=585;
float sped=8;
float sped2=8;
int music=1;
int bgc=0;
int yPos = 0;
int gameMode = 1;
boolean jump;
boolean jump2;
boolean flag;
boolean fast;
boolean [] keys = new boolean[66666];
ArrayList<Ball>balls=new ArrayList<Ball>();
ArrayList<Player2Ball>balls2=new ArrayList<Player2Ball>();
ArrayList<Youjun>youjuns=new ArrayList<Youjun>();
ArrayList<Buji>buji=new ArrayList<Buji>();
ArrayList<Boos>boos=new ArrayList<Boos>();
ArrayList<Frozen>frozens=new ArrayList<Frozen>();
ArrayList<Shield>shields=new ArrayList<Shield>();
ArrayList<Speed>speeds=new ArrayList<Speed>();
int score=1;
int life=20;
int index=0;
int time=300, frozenTime=-999, shieldTime=-999, speedTime=-999;
int boosx, boosy;
float a=51;//boss health
int  playGame=0;
Peo[]ps=new Peo[15];
PImage speed, power, snow, heal, shield, kkl, ghost;
PImage[] skin=new PImage[3];
PImage[] bg=new PImage[3];
PImage[] avator=new PImage[3];
PImage skin4;
int skin_id=0;
boolean play=true;
import java.util.Iterator;

void setup() {
  size(1000, 800);
  rectMode(CENTER);
  yPos = 0;
  m = new Minim(this);
  s1 = m.loadFile("background music.mp3", 1024);
  imageMode(CENTER);
  textAlign(CENTER);
  boosx=(int)random(width);
  boosy=80;
  for (int i=0; i<ps.length; i++) {
    ps[i]=new Peo();
  }
  speed = loadImage("MovingSpeed.png");
  power = loadImage("Power.png");
  snow = loadImage("snow.png");
  heal = loadImage("Heal.png");
  shield = loadImage("Shield.png");
  skin[0]=loadImage("skin1.png");
  skin[1]=loadImage("skin2.png");
  skin[2]=loadImage("skin3.png");
  kkl=loadImage("enemy1.png");//enemy
  ghost = loadImage("boss1.png");//boss
  skin4 = loadImage("skin4.png");
  for (int i = 0; i<3; i++) {
    bg[i] = loadImage("bg"+i+".jpg");
    avator[i] = loadImage("a"+i+".png");
  }
}

void draw() {
  //Home Page Display------------------------------------------------------------
  if (playGame == 0) {
    background(0);
    if (index==0) {
      fill(255);
      textSize(62);
      text("Welcome to the game", width/2, 182);
      textSize(16);
      text("Press 'a' or 'd' to move left or right, 'w' for jumping,'q' 'e' for range shooting", width/2, 400);
      text("Press 'j' or 'l' to move left or right, 'i' for jumping,'u' 'o' for range shooting", width/2, 450);
      text("Press 'b' to pause or start", width/2, 500);
      text("Press 'r' to restart", width/2, 550);
      //text("Press 'P' to fire the bullet", width/2, 557);
      textSize(30);
      text("Have fun playing!", width/2, 650);
    } else if (index==-1) {
      background(155);
      textSize(50);
      fill(255);
      text("You lost\nPress 'r' to try again", width/2, height/2);
    } else if (index>6) {
      background(0);
      fill(random(150, 255), random(150, 255), random(150, 255));
      textSize(80);
      text("Congratulations!!!", width/2, height/2-150);
      text("You Win!!!", width/2, height/2-50);
    }
    // Six button on Home Page------------------------
    if (abs(mouseX-100)<60&&abs(mouseY-340)<30) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
    rect(100, 340, 150, 60);
    if (abs(mouseX-100)<60&&abs(mouseY-420)<30) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
    rect(100, 420, 150, 60);
    if (abs(mouseX-100)<60&&abs(mouseY-500)<30) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
    rect(100, 500, 150, 60);
    if (abs(mouseX-100)<60&&abs(mouseY-580)<30) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
    rect(100, 580, 150, 60);
    if (abs(mouseX-100)<60&&abs(mouseY-660)<30) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
    rect(100, 660, 150, 60);
    if (abs(mouseX-100)<60&&abs(mouseY-740)<30) {
      fill(100, 255, 100);
    } else {
      fill(255);
    }
    rect(100, 740, 150, 60);
    //------------------------------
    textSize(30);
    fill(0);
    text("Start", 100, 355);
    text("MultiPlayer", 100, 435);
    text("Setting", 100, 515);
    text("Help", 100, 595);
    text("About", 100, 675);
    text("Exit", 100, 755);
  }
  //In-Game Page---------------------------------------------------------------------------------------
  else if (playGame==1) {
    if (bgc==0) {
      imageMode(CORNER);
      image(bg[0], 0, yPos);
      imageMode(CENTER);
      yPos--;
      if (yPos<-2000) {
        yPos = 0;
      }
    }
    if (bgc==1) {
      imageMode(CORNER);
      image(bg[1], 0, yPos);
      imageMode(CENTER);
      yPos--;
      if (yPos<-2000) {
        yPos = 0;
      }
    }
    if (bgc==2) {
      imageMode(CORNER);
      image(bg[2], 0, yPos);
      imageMode(CENTER);
      yPos--;
      if (yPos<-2000) {
        yPos = 0;
      }
    }

    if (time<0) {
      flag=false;
      fast=false;
    }
    noStroke();

    if (index<6) {
      for (int i=0; i<ps.length; i++) {
        ps[i].show();
        if (play)
          if (frameCount-frozenTime>200)ps[i].move();
      }
    }
    //balls.add(new Ball(300,300));
    Iterator<Ball>it= balls.iterator();
    while (it.hasNext()) {
      Ball b=it.next();
      b.show();
      if (play)
        b.move();
      if (b.isDead()||abs(b.xb-boosx)<50&&b.yb<boosy-50) {
        it.remove();
      }
      if (abs(b.xb-boosx)<50&&abs(b.yb-boosy)<50) {
        a-=0.03;//ammo damage
      }
    }
    if (gameMode == 2) {
      Iterator<Player2Ball>it2= balls2.iterator();
      while (it2.hasNext()) {

        Player2Ball b2=it2.next();
        b2.show();
        if (play)
          b2.move();
        if (b2.isDead()||abs(b2.x2-boosx)<50&&b2.y2<boosy-50) {
          it2.remove();
        }
        if (abs(b2.x2-boosx)<50&&abs(b2.y2-boosy)<50) {
          a-=0.03;//ammo damage
        }
      }
    }
    //More ammo system
    Iterator<Youjun>yo= youjuns.iterator();
    while (yo.hasNext()) {
      Youjun you=yo.next();
      you.show();
      if (frameCount-frozenTime>200)you.move();//prop going down-------
      if (abs(x-you.youjunX)<25&&abs(y-you.youjunY)<25) {
        yo.remove();
        flag=true;
        time=300;
      }
      if (gameMode == 2) {
        if (abs(x2-you.youjunX)<25&&abs(y2-you.youjunY)<25) {
          yo.remove();
          flag=true;
          time=300;
        }
      }
    }
    //Freeze
    Iterator<Frozen>fo= frozens.iterator();
    while (fo.hasNext()) {
      Frozen one=fo.next();
      one.show();
      if (frameCount-frozenTime>200)one.move();
      if (abs(x-one.x)<25&&abs(y-one.y)<25) {
        fo.remove();
        frozenTime = frameCount;
      }
      if (gameMode == 2) {
        if (abs(x2-one.x)<25&&abs(y2-one.y)<25) {
          fo.remove();
          frozenTime = frameCount;
        }
      }
    }
    //Shield block
    Iterator<Shield>sh= shields.iterator();
    while (sh.hasNext()) {
      Shield one=sh.next();
      one.show();
      if (frameCount-shieldTime>200)one.move();
      if (abs(x-one.x)<25&&abs(y-one.y)<25) {
        sh.remove();
        shieldTime = frameCount;
      }
      if (gameMode == 2) {
        if (abs(x2-one.x)<25&&abs(y2-one.y)<25) {
          sh.remove();
          shieldTime = frameCount;
        }
      }
    }
    ///Heal
    Iterator<Buji>b= buji.iterator();
    while (b.hasNext()) {
      Buji buji=b.next();
      buji.show();
      if (frameCount-frozenTime>200)buji.move();
      if (abs(x-buji.bujiX)<25&&abs(y-buji.bujiY)<25) {
        b.remove();
        life+=5;
      }
      if (gameMode == 2) {
        if (abs(x2-buji.bujiX)<25&&abs(y2-buji.bujiY)<25) {
          b.remove();
          life+=5;
        }
      }
    }
    //Speed
    Iterator<Speed>sp= speeds.iterator();
    while (sp.hasNext()) {
      Speed speed=sp.next();
      speed.show();
      if (frameCount-speedTime>200)speed.move();
      if (abs(x-speed.x)<25&&abs(y-speed.y)<25) {
        sp.remove();
        speedTime = frameCount;

        fast=true;
        time=300;
      }
      if (gameMode == 2) {
        if (abs(x2-speed.x)<25&&abs(y2-speed.y)<25) {
          sp.remove();
          speedTime = frameCount;

          fast=true;
          time=300;
        }
      }
    }
    //BOOS
    Iterator<Boos>bo= boos.iterator();
    while (bo.hasNext()) {
      Boos boo=bo.next();
      boo.show();
      boo.move();
      if (boo.isDead()||abs(boo.loc.x-x)<15&&abs(boo.loc.y-y)<15) {
        bo.remove();
      }
      if (abs(boo.loc.x-x)<15&&abs(boo.loc.y-y)<15) {
        if (frameCount-shieldTime>300)life--;
      }
    }
    //boos
    if (index==6) {
      if (frameCount-frozenTime>200)boos.add(new Boos(boosx, boosy));

      stroke(255, 0, 0);
      line(0, 30, width, 30);
      line(0, 100, width, 100);
      fill(255, 0, 0);
      textSize(50);
      text("BOSS", width/2, 80);
      //---------------------------------------
      boos.add(new Boos(boosx, boosy));
      push();
      tint(255, map(a, 51, 0, 255, 0));
      image(ghost, boosx, boosy, 100, 100);
      pop();
      //------------------------------------------
      //fill(255, a);
      //stroke(random(255), random(255), random(255));
      //ellipse(boosx, boosy, 100, 100);
      //stroke(0);

      //----------------------------------------
      //noFill();
      //rect(boosx, boosy-55, 51, 10);
      //noStroke();
      //fill(0, 255, 0);
      //rect(boosx-(25-a/2), boosy-55,a, 8);
      rectMode(CORNER);
      noFill();
      rect(boosx-25, boosy-55, 51, 10);//Total Boss Health
      noStroke();
      fill(0, 255, 0);
      rect(boosx-24, boosy-54, a, 8);//Current Boss Health
      rectMode(CENTER);
      //----------------------------------------
      if (frameCount%300==0 && frameCount-frozenTime>200) {
        boosx=(int)random(width);
      }
      if (a<0) {
        index=7;
        playGame=0;
      }
    }
    //teleport bar----------------------------------------------------
    push();
    if (index<6) {
      //teleport bar-----------------------------------------
      stroke(random(200,255), random(200,255), random(200,255));
      strokeWeight(3);
      line(width/2-50, height-5, width/2+50, height-5);//middle bar
      if (abs(x-(width/2))<50&&abs(y-(height-5))<30) {
        sped=200;
      } else {
        sped=8;
      }
      if (gameMode == 2) {
        if (abs(x2-(width/2))<50&&abs(y2-(height-5))<30) {
          sped2=200;
        } else {
          sped2=8;
        }
      }

      if (index>2) {
        line(100, height-5, 200, height-5);//left bar
        line(800, height-5, 900, height-5);//right bar
        if (abs(x-150)<50&&abs(y-(height-5))<30) {
          sped=200;
        }
        if (abs(x-850)<50&&abs(y-(height-5))<30) {
          sped=200;
        }
        if (gameMode == 2) {
          if (abs(x2-150)<50&&abs(y2-(height-5))<30) {
            sped2=200;
          }
          if (abs(x2-850)<50&&abs(y2-(height-5))<30) {
            sped2=200;
          }
        }
      }
    }
    pop();
    //limiting plane move range--------------------------
    if (x>width-15) {
      x=width-15;
    }
    if (x<15) {
      x=15;
    }
    //-------------------
    if (gameMode == 2) {
      if (x2>width-15) {
        x2=width-15;
      }
      if (x2<15) {
        x2=15;
      }
    }
    //key
    move();
    //system
    textSize(25);
    fill(255, 0, 0);
    if (index<7) {
      text("score:"+score, width/2-200, 30);
    }
    fill(251, 174, 26);
    text("Level:"+index, width/2, 30);
    fill(10, 200, 0);
    text("life:"+life, width/2+200, 30);

    //check
    if (jump) {
      y-=ysped;
    }
    if (y<topheight) {
      y=585;
      ysped*=-1;
    }
    if (y>785) {
      y=785;
      ysped*=-1;
      jump=false;
    }
    //---------
    if (gameMode == 2) {
      if (jump2) {
        y2-=ysped2;
      }
      if (y2<topheight) {
        y2=585;
        ysped2*=-1;
      }
      if (y2>785) {
        y2=785;
        ysped2*=-1;
        jump2=false;
      }
    }

    //if false or next level
    if (score%10==0&&index<6) {
      index=floor(score/10);
      //score=0;
    }
    if (life<0) {
      index=-1;
      playGame=0;
    }
    //occur frequency------------------------------------------------------
    //ammo more
    if (frameCount%600==0) {
      youjuns.add(new Youjun());
    }
    //freeze more
    if (frameCount%600==300) {
      frozens.add(new Frozen());
    }
    //shield more
    if (frameCount%800==0) {
      shields.add(new Shield());
    }
    //BUji
    if (frameCount%1000==0) {
      buji.add(new Buji());
    }
    //speed more
    if (frameCount%1000==0) {
      speeds.add(new Speed());
    }

    if (frameCount-shieldTime<300) {
      fill(0, 255, 0);
      ellipse(x, y, 200, 200);
      if (gameMode == 2) {
        ellipse(x2, y2, 200, 200);
      }
    }
    //myself
    image(skin[skin_id], x, y, 100, 80);
    if (gameMode == 2) {
      image(skin4, x2, y2, 100, 80);
    }
  }
  //Setting Page---------------------------------------------------------------------------------------
  else if (playGame==2) {
    background(0);
    fill(255);
    textSize(50);
    text("Setting", 100, 80);
    strokeWeight(2);

    text("Music", 200, 200);
    noFill();
    stroke(0, 255, 0);

    rect(width/2-(1-music)*200, 290, 100, 80);
    fill(255, 0, 0);
    text("ON", width/2-200, 300, 100, 80);
    fill(0, 255, 0);
    text("OFF", width/2, 300, 100, 80);

    fill(255);
    text("Background", 200, 400);
    noFill();
    //-------------------------------------
    //fill(255);
    //rect( width/2-200, 500, 100, 80);
    //fill(0, 255, 255);
    //rect( width/2, 500, 100, 80);
    //fill(0, 0, 0);
    //rect( width/2+200, 500, 100, 80);
    //-------------------------------------
    stroke(0, 255, 0);
    rect(width/2-(1-bgc)*200, 500, 110, 90);
    stroke(125);
    fill(255);
    image(avator[0], width/2-200, 500, 100, 80);

    fill(0, 255, 255);
    image(avator[1], width/2, 500, 100, 80);

    fill(0, 0, 0);
    image(avator[2], width/2+200, 500, 100, 80);

    //-------------------------------------------------------------------
    fill(255);
    text("Skin", 200, 600);
    noFill();
    stroke(0, 255, 0);
    rect(width/2-(1-skin_id)*200, 700, 120, 100);
    image(skin[0], width/2-200, 700, 100, 80);
    image(skin[1], width/2, 700, 100, 80);
    image(skin[2], width/2+200, 700, 100, 80);
  }
  //Help Page---------------------------------------------------------------------------------------
  else if (playGame==3) {
    background(0);
    fill(255);
    textSize(50);
    text("Help", 100, 80);
    
    pushMatrix();
    translate(0,30);
    textSize(30);
    image(speed, 150, 100, 40, 40);
    text("-- increase moving speed", width/2-110, 110);
    image(snow, 150, 200, 40, 40);
    text("-- freeze enemies", width/2-150, 210);
    image(shield, 150, 300, 40, 40);
    text("-- shield 5 second block", width/2-110, 310);
    fill(0, 255, 0);
    //rect(150, 400, 40, 40);
    image(heal, 150, 400, 40, 40);
    fill(255);
    text("-- Heal yourself", width/2-160, 410);
    image(power, 150, 500, 40, 40);
    text("-- More ammo", width/2-170, 510);
    text("Player 1", 150, 570);
    text("-- Use a, d, w to control left, right, jump of the player 1", width/2+90, 570);
    text("Player 2", 150,680 );
    text("-- Use j, l, i to control left, right, jump of the player 2", width/2+80, 680);
    text("Player 1 press q and e change bullet direction",width/2+70,620);
    text("Player 2 press u and o change bullet direction",width/2+70,730);
    popMatrix();
    
    //fill(random(255), random(255), random(255));
    //noStroke();
    //rect(150, 700, random(40), random(40));
  }
  //About Page---------------------------------------------------------------------------------------
  else if (playGame==4) {
    background(0);
    fill(255);
    textSize(50);
    text("About", 100, 80);
    text("Prepared by", width/2, 200);
    textSize(30);
    text("Yuanqi Feng", width/2, 400);
    text("Yuanbin Chang", width/2, 500);
    text("Haozheng Wang", width/2, 600);
  }
  if (playGame!=0) {
    strokeWeight(3);
    stroke(255);
    line(10, 20, 20, 10);
    line(10, 20, 20, 30);
    strokeWeight(1);
  }
}
