// y = 2x
float x = width/4;
float y = height/2;
float z = 0;

void setup(){
  size(780, 390);
  background(0);
}

void draw(){
  stroke(x,y,z);
  y += sin(x);
  println(x, y);
  point(x, y );
  point(y, x );
  x += 1;
  z = x + y;
}
