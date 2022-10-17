float circleX;
float Xspeed = 0.5;
boolean moving = false;

void setup(){
  size(640, 360);              // setup window size
  circleX = random(0, width);  // ramdomize circle's x position
}

void draw(){
  
  // -- Drawing stuff -- //
  background(50);
  
  // Initial lines
  stroke(255);
  line(100, 0, 100, height);
  line(200, 0, 200, height);
  line(300, 0, 300, height);
  line(400, 0, 400, height);
  line(500, 0, 500, height);
  line(600, 0, 600, height);
  
  // Moving ellipse
  fill(255);
  ellipseMode(RADIUS);
  ellipse(circleX, 180, 24, 24);
  
  // -- Logic stuff -- //
  if (moving){
   circle_position_reset();
  }
  
  change_line_marker();
  
}

void change_line_marker(){
  // Change position line markers based on Circle's centre position
  if (circleX >= 600){
    stroke(222, 111, 75);
    line(600, 0, 600, height);
  } 
  else if ((circleX >= 500) && (circleX < 600)){
    stroke(222, 111, 75);
    line(500, 0, 500, height);
  } 
  else if ((circleX >= 400) && (circleX < 500)){
    stroke(222, 111, 75);
    line(400, 0, 400, height);
  } 
  else if ((circleX >= 300) && (circleX < 400)){
    stroke(222, 111, 75);
    line(300, 0, 300, height);
  }
  else if ((circleX >= 200) && (circleX < 300)){
    stroke(222, 111, 75);
    line(200, 0, 200, height);
  }
  else if ((circleX >= 100) && (circleX < 200)){
    stroke(222, 111, 75);
    line(100, 0, 100, height);
  }
}

void circle_position_reset(){
  // Move circle to end and reset it's position back to start
  if (circleX < width){
    circleX = circleX + Xspeed;
  } 
  else {
    circleX = 0;
  }
}

void mousePressed(){
  if (moving){
    moving = false;
  } 
  else{
    moving = true;
  }
  // the above can also be written as (moving = !moving)
}
