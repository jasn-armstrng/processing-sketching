float x = 0.1;
float y = 0;
float z = 0;

float dx;
float dy;
float dz;
float dt;

float s = 31.7654;
float r = 14.65;
float b = 8.128/3;

void setup(){
  frameRate(60);
  size(750, 650, P3D);
  background(55);
  smooth();
}

void draw(){
  //background(#4C5270);
  translate(width/2, height/2);
  rotateX(PI/2.0);
  rotateY(PI/2.0); // tweak here
  //rotate(180);
  scale(5);
  dt = 0.01;
  dx = (s*(y-x))*dt;
  dy = (x*(r-z)-y)*dt;
  dz = ((x*y)-(b*z))*dt;

  x = x + tan(dx); // added trig funcs
  y = y + sin(dy);
  z = z + sin(dz);
  
  // Upper right petal
  strokeWeight(0.8);
  stroke(#375e97);
  point(-x, y, z);
  stroke(#fb6542);
  point(-x, tan(y), z);
  
  // Top right
  stroke(#6fb98f);
  point(-z, tan(z), x);
  
  
  // Lower right petal
  strokeWeight(0.7);
  stroke(#ffbb00);
  point(x, sin(y), z);
  stroke(#3f681c);
  point(x, tan(y), z);
  
  // Upper left petal
  stroke(#ffffff);
  point(-x, tan(y), -z);
  stroke(#375e97);
  point(-x, sin(y), -z);
  
  // Top left
  stroke(#000000);
  point(-z, tan(z), -x);
  
  // Lower left petal
  stroke(#fb6542);
  point(x, -y, -z);
  stroke(#ffbb00);
  point(x, tan(y), -z);
  
  //bottom right
  stroke(#3f681c);
  point(z, tan(x), y);
  
  // bottom left
  stroke(#ffffff);
  point(z, tan(x), -y);
}
