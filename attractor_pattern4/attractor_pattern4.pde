float x = 0.1;
float y = 0;
float z = 0;

float dx;
float dy;
float dz;
float dt;

float s = 6.063;
float r = 19.76;
float b = 8.7/PI;

void setup(){
  frameRate(60);
  size(350, 650, P3D);
  background(#1F4690);
  smooth();
}

void draw(){
  //background(#4C5270);
  translate(width/2, height/2);
  rotateX(PI/2.0);
  rotateZ(PI/2); // tweak here
  scale(4);
  dt = 0.01;
  dx = (s*(y-x))*dt;
  dy = (x*(r-z)-y)*dt;
  dz = ((x*y)-(b*z))*dt;

  x = x + tan(dx); // added trig funcs
  y = y + (dy);
  z = z + (dz);
  
  strokeWeight(0.4);
  stroke(#FFA500);
  point(x, -y, (z));
  
  strokeWeight(0.3);
  stroke(#3A5BA0);
  point(x, tan(y), z);
  
  strokeWeight(0.3);
  stroke(#FFE5B4);
  //point(x, y, -z);
  point(tan(x), -y, -z);
  
  strokeWeight(0.7);
  stroke(#BCECE0);
  //stroke(#4C5270);
  //point(x, y, z);
  point(x, y, -z);
  
  strokeWeight(0.4);
  stroke(255);
  point(x, tan(y), -z);
}
