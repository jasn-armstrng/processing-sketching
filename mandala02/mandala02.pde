float x = 0;
float y = 0;
float z = 0;

float a = 0;
float t = 1;
float b = 0;


void setup(){
  frameRate(60);
  size(600, 600);
  background(35);
}

void draw(){
  translate(width/2, height/2);
  
  strokeWeight(1);
  stroke(255);
  x = a*sin(t);
  y = a*cos(t);
  // println(x, y);
   
  if (x < 0){
    stroke(#FFD700);
  }
  
  point(x, y);
  point(-x, -y);

  
  t += 0.1;
  a += 0.1;

}
