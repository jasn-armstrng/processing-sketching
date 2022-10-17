float xpos = 200;
float ypos = 50;
float vy = 0;
float gravity = 0.98;
float bounce = -1;

void setup() 
{
  size(400,800);
  smooth();
  noStroke();
}
void draw() 
{
  background(0);
  ellipse(xpos, ypos, 30, 30);
  
// I've separated out the change in velocity and the change in position
//so that you can see what's happening
  vy += gravity;
  ypos += vy;
  if(ypos > height - 15)
  {
    vy *= bounce;
  }
  println(vy);
}
