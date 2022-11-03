Particle [] confetti;

void setup() {
  size(400, 400);
  loop();
  confetti = new Particle[200];
  for(int i = 0; i < confetti.length; i++) {
    confetti[i] = new Particle();
  }
  confetti[0] = new OddBallParticle();
}


void draw() {
  background(0);
  for(int i = 0; i < confetti.length; i++) {
    confetti[i].show();
    confetti[i].explode();
  }
}

void mousePressed() {
  redraw();
}

class Particle {
  double myX, myY, myS, myWidth, myHeight, myAngle, myOpacity;
  color myC;
  
 Particle() {
    //myX = mouseX;
    myX = 200;
    myY = 200;
    myS = (int)(Math.random()*10)+1;
    myC = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    myOpacity = 225;
    myWidth = (Math.random()*10)+2;
    myHeight = (Math.random()*10)+2;
    myAngle = (Math.random()*2)*Math.PI;
  }
  
  public void show() {
    fill(myC, (float)myOpacity);
    ellipse((float)myX, (float)myY, (float)myWidth, (float)myHeight);
  }
  
  public void explode() {
    myX += Math.cos(myAngle)*myS;
    myY += Math.sin(myAngle)*myS;
    myOpacity--;
  }
}

class OddBallParticle extends Particle { 
  OddBallParticle() {
    myX = 200;
    myY = 200;
    myS = 6;
    myC = color(#F5F5F5);
    myOpacity = 225;
    myWidth = 45;
    myHeight = 15;
    //myAngle = Math.PI/(int)(Math.random()*2)+3;
  }
  
  public void show() {
    fill(myC, (float)myOpacity);
    ellipse((float)myX, (float)myY, (float)myWidth, (float)myHeight);
  }
  
  public void explode() {
    myY -= myS;
    myOpacity--;
  }
}


