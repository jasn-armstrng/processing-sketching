// rect()
// ellipse()
// line()
// point()

void setup() { // anything in setup happens once
  // order of what is setup matters

  size(640, 360);     // size canvas
  background(255);
}

void draw() { // anything in draw repeats
  // order of what is setup matters
  // background(255);    // colour canvas background

  // stroke(45, 56, 75);     // color line
  // line(100, 50, 600, 250); // draw line
  line(pmouseX, pmouseY, mouseX, mouseY); // draw line. Background should be in setup
  
  // fill(23, 56, 89);       // colour rect
  // rectMode(CENTER);
  // rect(mouseX, mouseY, 100, 100, 3); // draw rect
  
  if (mousePressed){ // erase drawing when mouse pressed
    background(255); 
  }
}
