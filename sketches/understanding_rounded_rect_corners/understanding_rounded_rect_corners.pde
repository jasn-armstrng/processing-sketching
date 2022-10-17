// -- Understanding rounded corners on rectangles in Processing
// -- Reference: https://processing.org/reference/rect_.html

void setup(){ 
  size(640,360);               // set window size
  background(180);             // set canvas background colour
}

void draw(){
  
  // draw rectangle one
  fill(255, 255, 255);         // rectangle colour is white
  
  rect(100, 50, 100, 200, 30); // rect(x, y, w, l, r); r is the radius of the circle used to round the corner
  
  ellipseMode(RADIUS);         // draw ellipse using x,y as its centrepoint
  fill(100, 150, 56);          // ellipse colour green
  ellipse(130, 80, 30, 30);    // ellipse(x, y, w, h); 
  line(130, 80, 160, 80);      // draw the radius 
  
  // draw rectangle two
  fill(255, 255, 255);         // same colour as rect one        
  rect(250, 50, 100, 200, 10); // rectangle two has a rounded corner radius of 10
  
  ellipseMode(RADIUS);
  fill(200, 100, 36);          // ellipse colour is burnt orange
  ellipse(260, 60, 10, 10);    
  line(260, 60, 270, 60);      // draw the radius 
}
