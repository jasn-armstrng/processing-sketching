float x1 = 0;
float y1 = 0;
float z1 = 0;

float x2 = 0;
float y2 = 0;
float z2 = 0;

float r = 50;
float t = 0;
float a = 3;

float angle = PI/8; 

void setup(){
  frameRate(60);
  size(400, 400, P3D);
  background(#222831);
}

void draw(){
  translate(width/2, height/2, 10);
  rotateX(PI/3);
  rotateY(angle);
  scale(3);
  x2 = x1;
  y2 = y1;
  z2 = z1;
  
  x1 = r*sin(t)*cos(a*t);
  y1 = r*sin(t)*sin(a*t);
  z1 = r*cos(t);
  
  stroke(#EEEEEE);
  line(-x2, y2, z2, x1, y1, z1);
  
  stroke(#FFD369);
  line(x2, -y2, z2, x1, y1, z1);
  
  stroke(#393E46);
  line(x2, y2, z2, -x1, y1, z1);
  
  stroke(#222831);
  line(x2, y2, z2, x1, -y1, z1);
    
  t += 0.001;
  a += 0.009;
  angle+=PI/3;
}
