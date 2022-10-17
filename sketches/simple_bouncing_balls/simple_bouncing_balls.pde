float circleX;
float circleY;
float xSpeed = 2;
float ySpeed = 2;

void setup(){
  size(640, 360);              // setup window size
  circleX = 0;  // ramdomize circle's x position
  circleY = 0;  // ramdomize circle's x position
}

void draw(){
  
  // -- Drawing stuff -- //
  background(50);
  
  // Moving ellipse
  fill(255);
  ellipseMode(RADIUS);
  ellipse(circleX, height/2, 24, 24);
  //fill(255);
  //ellipseMode(RADIUS);
  ellipse(width/2, circleY, 24, 24);
  
  circleX = circleX + xSpeed;
  circleY = circleY + ySpeed;

  // -- Logic Stuff -- //
  if (circleX > width || circleX < 0){
    // Turn around! Change polarity of speed when either of the above becomes true
    xSpeed = xSpeed * -1;
  }
  
   if (circleY > height || circleY < 0){
    // Turn around! Change polarity of speed when either of the above becomes true
    ySpeed = ySpeed * -1;
  }
}
