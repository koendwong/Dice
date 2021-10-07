float Spin = 0.0; float accelSpin = 0.0; float scale;
int sum, rotation, ring, oR, oG, oB, nR, nG, nB;
int rows = 1;

////////////////////////////////////

void setup() {
  size(800, 800);
  noStroke();
  noLoop();
  textAlign(CENTER);
}

////////////////////////////////////

void draw() {
  background(0);
  translate(400, 400);

  scale = ((float)mouseY/800)+1;
  sum = 0;
  float ringGap = ((float)mouseX/((float)290))+0.8;
  
  // accelerate
  accelSpin += 0.001;
  if (accelSpin >= 0.1)
    accelSpin = 0.1;
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
  
  // gradient
  int r = oR; int g = oG; int b = oB;
  if (r < nR)
    oR+=1;
  if (r > nR)
    oR-=1;
  if (g < nG)
    oG+=1;
  if (g > nG)
    oG-=1;
  if (b < nB)
    oB+=1;
  if (b > nB)
    oB-=1;
  
  rows = rotation-2;
  if (rows < 1)
    rows = 1;

  for (rotation = 2; rotation <= (mouseY/100)+2; rotation++) {
    for (ring = 1; ring <= rotation*6; ring++) {
      float rngRotate = (float)(Math.random()*2);
      rotate(Spin);
      rotate(PI/(rotation*3));
      translate(150*((float)rotation/ringGap), 0);
      rotate(-(rngRotate-1)*PI);
      Die test = new Die(0, 0, r, g, b);
      if (r < 0)
        r = 0;
      if (r > 255)
        r = 255;
      if (g < 0)
        g = 0;
      if (g > 255)
        g = 255;
      if (b < 0)
        b = 0;
      if (b > 255)
        b = 255;
      fill(r, g, b);
      test.show();
      fill(255);
      test.roll();
      rotate((rngRotate-1)*PI);
      translate(-150*((float)rotation/ringGap), 0);
      rotate(-Spin);
    }
    r -= 250/rows; g -= 250/rows; b -= 250/rows;
    if (r < 0)
      r = 0;
    if (r > 255)
      r = 255;
    if (g < 0)
      g = 0;
    if (g > 255)
      g = 255;
    if (b < 0)
      b = 0;
    if (b > 255)
      b = 255;
  }
  
  fill(255);
  textSize(70/scale);
  text(sum, 0, 25/scale);
} // draw

////////////////////////////////////

void mousePressed() {
  oR = nR; oG = nG; oB = nB;
  nR = (int)(Math.random()*101)+150;
  nG = (int)(Math.random()*101)+150;
  nB = (int)(Math.random()*101)+150;
  loop();
}
void endLoop() {
  noLoop();
}

/////////////////////////////////////////////////////////////////

class Die {
  int rectX, rectY, ellX, ellY, rNG;
  float scale;

  Die(int x, int y, int r, int g, int b) { // construct
    rectX = x-25; rectY = y-25;
    ellX = x; ellY = y;
    scale = ((float)mouseY/800)+1;
  }
  void roll() { /////////////////////////////////////////////////////////////////////////////////////////// roll
    rNG = (int)(Math.random()*6)+1;
    if (rNG == 1) {
      ellipse((ellX)/scale,    (ellY)/scale,    10/scale, 10/scale);
    }
    if (rNG == 2) {
      ellipse((ellX-12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
    }
    if (rNG == 3) {
      ellipse((ellX)/scale,    (ellY)/scale,    10/scale, 10/scale);
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
      ellipse((ellX)/scale,    (ellY)/scale,    10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
    }
    if (rNG == 6) {
      ellipse((ellX+12)/scale, (ellY)/scale,    10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY)/scale,    10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX-12)/scale, (ellY-12)/scale, 10/scale, 10/scale);
      ellipse((ellX+12)/scale, (ellY+12)/scale, 10/scale, 10/scale);
    }
    sum+=rNG;
  }
  void show() { /////////////////////////////////////////////////////////////////////////////////////////// show
    rect(rectX/scale, rectY/scale, 50/scale, 50/scale, 15/scale);
  }
}
