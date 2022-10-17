float x1 = 0;
float y1 = 0;
float z1 = 0;

float x2 = 0;
float y2 = 0;
float z2 = 0;

float r = 50;
float t = 0;
float a = 3;

// float angle = PI/8; 

void setup(){
  frameRate(60);
  size(1100, 500, P3D);
  background(#293462);
}

void draw(){
  translate(width/2, height/2, 10);
  rotateY(PI/15);
  // rotateY(angle);
  scale(3);
  x2 = x1;
  y2 = y1;
  z2 = z1;
  
  x1 = r*sin(t)*cos(a*t);
  y1 = r*sin(t)*sin(a*t);
  z1 = r*PI/90*tan(t);
  
  stroke(#D61C4E);
  strokeWeight(1);
  line(x2, -y2, z2, x1, -y1, z1);
  // point(x2, y2, z2);
  
  //stroke(random(255), random(128), random(255));
  stroke(#FEB139);
  line(x2, y2, -z2, x1, y1, -z1);
  
  stroke(#FFF80A);
  point(x1, -y1, -z1);
  
  stroke(#293462);
  point(-x1, y1, z1);
  
  //stroke(255);
  //strokeWeight(2);
  //point(-x1, y1, -z1);
  
  
  t += 0.01;
  a += 0.9;
  // angle+=PI/2;
}
