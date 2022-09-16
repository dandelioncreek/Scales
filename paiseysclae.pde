void setup() {
  size(1000, 1000);
}


void draw() {
  background(255,255,255);
  float eyedepth = 100; //increase to make eye look more center
  float newmouseX = mouseX - 200;
  float newmouseY = mouseY - 200;
  float pupildistance = 10; //socket radius - eye radius
  float vectormultconstant = (float)(pupildistance/Math.sqrt(newmouseX*newmouseX + newmouseY*newmouseY + eyedepth*eyedepth));
  float pupilcenterx = newmouseX*vectormultconstant + 200;
  float pupilcentery = newmouseY*vectormultconstant + 130;

  boolean shift = true;
  for (float y = 0; y < 1100; y = y + pupilcentery) {
    for (float x = 50; x < 1100; x = x + pupilcenterx) {
      if (shift == true)
        scale(x + 150, y, 1);
      else
        scale(x, y, 1);
    }
    if (shift == true)
      shift = false;
    else
      shift = true;
  }
}

void scale(float x, float y, float siz) {
  //scale
  float diam = 0;
  float r = 255;
  noFill();
  while (diam < 800*siz) {
    stroke(r, diam/2, diam);
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex(x+50+diam, y+20+diam);
    curveVertex(x+40+diam, y+60+diam);
    curveVertex(x+diam, y+40+diam);
    curveVertex(x, y);
    curveVertex(x, y);
    endShape();
    //ellipse(x, y, diam, diam);
    diam++;
    r-=255/300.0;
  }
}
