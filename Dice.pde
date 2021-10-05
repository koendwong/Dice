float Spin = 0.0;
float accelSpin = 0.0;
float scale;
int sum, rotation, ring;

////////////////////////////////////

void setup() {
  size(800, 800);
  noStroke();
  noLoop();
  textAlign(CENTER);
}

////////////////////////////////////

void draw() {
  background(255);
  translate(400, 400);

  scale = ((float)mouseY/800)+1;
  sum = 0;
  accelSpin += 0.001;
  float ringGap = ((float)mouseX/((float)300))+0.8;

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
  
  for (rotation = 2; rotation <= (mouseY/100)+2; rotation ++) {
    for (ring = 1; ring <= rotation*6; ring++) {
      float rngRotate = (float)(Math.random()*2);
      rotate(Spin);
      rotate(PI/(rotation*3));
      translate(150*((float)rotation/ringGap), 0);
      rotate(-(rngRotate-1)*PI);
      Die test = new Die(0, 0);
      test.show();
      test.roll();
      rotate((rngRotate-1)*PI);
      translate(-150*((float)rotation/ringGap), 0);
      rotate(-Spin);
    }
  }
  fill(0);
  textSize(70/scale);
  text(sum, 0, 25/scale);
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
  float scale;

  Die(int x, int y) { // construct
    rectX = x-25;
    rectY = y-25;
    ellX = x;
    ellY = y;
    scale = ((float)mouseY/800)+1;
  }
  void roll() { /////////////////////////////////////////////////////////////////////////////////////////// roll
    rNG = (int)(Math.random()*6)+1;
    fill(0);
    if (rNG == 1) {
      ellipse((ellX)/scale, (ellY)/scale, 10/scale, 10/scale);
    }
    if (rNG == 2) {
      ellipse((ellX-12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
    }
    if (rNG == 3) {
      ellipse((ellX)/scale, (ellY)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
    }
    if (rNG == 4) {
      ellipse((ellX-12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
    }
    if (rNG == 5) {
      ellipse((ellX)/scale, (ellY)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
    }
    if (rNG == 6) {
      ellipse((ellX+12)/scale, (ellY)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
    }
    sum+=rNG;
  }
  void show() { /////////////////////////////////////////////////////////////////////////////////////////// show
    fill((int)(Math.random()*101)+150, (int)(Math.random()*101)+150, (int)(Math.random()*101)+150);
    rect(rectX/scale, rectY/scale, 50/scale, 50/scale, 15/scale);
  }
}
