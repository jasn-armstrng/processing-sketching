float x1 = 0;
float y1 = 0;
float x2 = 0;
float y2 = 0;
float r = 0;
float t = 0;


void setup(){
  frameRate(30);
  size(400, 400, P3D);
  background(22);
}

void draw(){
  translate(width/2, height/2, -50);
  rotateX(PI/4);
  rotateZ(PI/8);
  strokeWeight(2);
  stroke(x1*10, y1*10, r*10);
  x1 = r*sin(t);
  y1 = r*cos(t);
  point(x1, y1, -50);
  point(y1, x1, -50);
 
  //point(r, t);
  //point(t, r);
  t += 0.1;
  r += 0.1;
}
