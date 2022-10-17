float x = 0.1;
float y = 0;
float z = 0;

float dx;
float dy;
float dz;
float dt;

float s = 6.053;
float r = 18.66;
float b = 8/PI;

void setup(){
  frameRate(60);
  size(350, 650, P3D);
  background(#0B3954);
}

void draw(){
  //background(#4C5270);
  translate(width/2, height/2);
  rotateX(PI/5.0);
  rotateZ(PI/2.0); // tweak here
  scale(4);
  dt = 0.01;
  dx = (s*(y-x))*dt;
  dy = (x*(r-z)-y)*dt;
  dz = ((x*y)-(b*z))*dt;

  x = x + sin(dx); // added trig funcs
  y = y + tan(dy);
  z = z + tan(dz);
  
  strokeWeight(random(0.2, 4.0));
  
  stroke(#BFD7EA);
  point(x, y, z);
  
  stroke(#FF6663);
  point(x, -y, z);
  
  stroke(#E0FF4F);
  point(x, y, -z);
  
  stroke(#0B3954);
  point(x, -y, -z);
  
  stroke(#FEFFFE);
  //stroke(#4C5270);
  point(-x, y, z);
}
