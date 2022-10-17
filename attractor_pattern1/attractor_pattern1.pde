float x = 0.1;
float y = 0;
float z = 0;

float dx;
float dy;
float dz;
float dt;

float s = 10.8378;
float r = 38.729;
float b = 12.882/PI;

void setup(){
  frameRate(60);
  size(550, 650, P3D);
  background(#4C5270);
}

void draw(){
  //background(#4C5270);
  translate(width/2, height/2);
  rotateX(PI/2.0);
  rotateZ(PI/2.0);
  scale(3);
  dt = 0.01;
  dx = (s*(y-x))*dt;
  dy = (x*(r-z)-y)*dt;
  dz = ((x*y)-(b*z))*dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  strokeWeight(random(2));
  
  stroke(#F652A0);
  point(x, y, z);
  point(x, -y, z);
  
  stroke(#36EEE0);
  point(x, y, -z);
  point(x, -y, -z);
  
  // stroke(#BCECE0);
  stroke(#4C5270);
  point(-x, y, z);
  point(-x, y, -z);
}
