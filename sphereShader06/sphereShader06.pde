float x1 = 0;
float y1 = 0;
float z1 = 0;

float x2 = 0;
float y2 = 0;
float z2 = 0;

float r = 50;
float t = 0;
float a = 3;

void setup(){
  frameRate(60);
  size(400, 400, P3D);
  background(0);
}

void draw(){
  translate(width/2, height/2);
  rotateX(PI/2);
  scale(3);
  x2 = x1;
  y2 = y1;
  z2 = z1;
  
  y1 = r*sin(t)*cos(a*t);
  x1 = r*sin(t)*sin(a*t);
  z1 = r*cos(t);
  
  stroke(#FFBF00);
  point(x2, y2, z2);
  
  stroke(0);
  line(x2, -y2, z2, x1, -y1, z1);
  
  stroke(#FBCEB1);
  point(-x1, y1, z1);
  
  stroke(#FAD5A5);
  point(-x2, -y2, z2);
  
  stroke(#F89880);
  point(x2, -y2, z2);
  
  t += 0.001;
  a += 0.09;
}
