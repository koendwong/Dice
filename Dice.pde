float Spin = 0.0;
float accelSpin = 0.0;
int sum, rotation, ring;

////////////////////////////////////

void setup() {
  size(800, 800);
  noStroke();
  noLoop();
  textAlign(CENTER);
  textSize(70);
}

////////////////////////////////////

void draw() {
  background(255);
  translate(400, 400);

  sum = 0;
  accelSpin += 0.001;
  float ringGap = ((float)mouseX/160)+3.0;

  if (accelSpin >= 0.075)
    accelSpin = 0.075;
  if (Spin >= 2*PI)
    Spin = 0.0;
  if (mousePressed != true) {
    accelSpin -= 0.0012;
    if (accelSpin <= 0.0) {
      accelSpin = 0.0;
      endLoop();
    }
  }
  Spin += accelSpin*PI;
  
  for (rotation = 6; rotation <= 18; rotation += 3) {
    for (ring = 1; ring <= rotation*2; ring++) {
      rotate(Spin);
      rotate(PI/rotation);
      translate(150*((float)rotation/ringGap), 0);
      rotate(-0.1*PI);
      Die test = new Die(0, 0);
      test.show();
      test.roll();
      rotate(0.1*PI);
      translate(-150*((float)rotation/ringGap), 0);
      rotate(-Spin);
    }
  }
  fill(0);
  text(sum, 0, 25);
} // draw

////////////////////////////////////

void mousePressed() {
  loop();
}
void endLoop() {
  noLoop();
}

/////////////////////////////////////////////////////////////////

class Die {
  int rectX, rectY, ellX, ellY, rNG;

  Die(int x, int y) { // construct
    rectX = x-25;
    rectY = y-25;
    ellX = x;
    ellY = y;
  }
  void roll() { /////////////////////////////////////////////////////////////////////////////////////////// roll
    rNG = (int)(Math.random()*6)+1;
    fill(0);
    if (rNG == 1) {
      ellipse((ellX), (ellY), 10, 10);
    }
    if (rNG == 2) {
      ellipse((ellX-12), (ellY+12), 10, 10);
      ellipse((ellX+12), (ellY-12), 10, 10);
    }
    if (rNG == 3) {
      ellipse((ellX), (ellY), 10, 10);
      ellipse((ellX-12), (ellY+12), 10, 10);
      ellipse((ellX+12), (ellY-12), 10, 10);
    }
    if (rNG == 4) {
      ellipse((ellX-12), (ellY+12), 10, 10);
      ellipse((ellX+12), (ellY-12), 10, 10);
      ellipse((ellX-12), (ellY-12), 10, 10);
      ellipse((ellX+12), (ellY+12), 10, 10);
    }
    if (rNG == 5) {
      ellipse((ellX), (ellY), 10, 10);
      ellipse((ellX-12), (ellY+12), 10, 10);
      ellipse((ellX+12), (ellY-12), 10, 10);
      ellipse((ellX-12), (ellY-12), 10, 10);
      ellipse((ellX+12), (ellY+12), 10, 10);
    }
    if (rNG == 6) {
      ellipse((ellX+12), (ellY), 10, 10);
      ellipse((ellX-12), (ellY), 10, 10);
      ellipse((ellX-12), (ellY+12), 10, 10);
      ellipse((ellX+12), (ellY-12), 10, 10);
      ellipse((ellX-12), (ellY-12), 10, 10);
      ellipse((ellX+12), (ellY+12), 10, 10);
    }
    sum+=rNG;
  }
  void show() { /////////////////////////////////////////////////////////////////////////////////////////// show
    fill((int)(Math.random()*101)+150, (int)(Math.random()*101)+150, (int)(Math.random()*101)+150); 
    rect(rectX, rectY, 50, 50, 15);
  }
}
