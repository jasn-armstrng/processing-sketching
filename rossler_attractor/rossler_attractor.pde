float x = 0;
float y = 0;
float z = 0;

float a = 0.1;
float b = 0.1;
float c = 14.0;

float v = 0;

float dx, dy, dz, dt;

void setup(){
  frameRate(60);
  size(1000, 500, P3D);
  background(#011a27);
}

void draw(){
  translate(width/2, height/2);
  
  scale(3);
  rotateY(PI/3);
  //stroke(x*10, y*5, z*10);
  
  
  dt = 0.019;
  
  dx = (- y - z) * dt;  
  dy = (x + (a * y)) * dt;
  dz = (b + (z * (x - c))) * dt;
  
  x =  x + dx;
  y =  y + dy;
  z =  z + dz;
  
  strokeWeight(0.9);
  stroke(#f0810f);
  point(x, y, z);
  
  strokeWeight(1);
  stroke(#e6df44);
  point(-x, -y, -z);
  x+=0.0912;
  y+=0.255;
  z+=0.042;
  
}
