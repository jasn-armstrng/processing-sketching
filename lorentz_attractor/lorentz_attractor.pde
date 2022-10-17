float x = 0;
float y = 0;
float z = 0;

float t = 10;
float r = 28;
float b = 8/3;

float v = 0;

float dx, dy, dz, dt;

void setup(){
  frameRate(60);
  size(400, 400, P3D);
  background(0);
}

void draw(){
  translate(width/2, height/2);
  scale(3);
  stroke(x*10, y*10, z*10);
  
  dt = 0.01;
  
  dx = (t * (y - x)) * dt;  
  dy = ((x * (r - z)) - y) * dt;
  dz = ((x * y) - (b * z)) * dt;
  
  x =  x + dx;
  y =  y + dy;
  z =  z + dz;
  
  point(x, y, z);
  x+=0.01;
  y+=0.01;
  z+=0.01;
  
}
