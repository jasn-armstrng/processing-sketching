// -- Simple draw and erase

void setup(){ 
  size(640,360);                          // set window size
  background(50);                        // set canvas background colour
}

void draw(){
  if (mousePressed){
   stroke(255);                            // set line colour
   line(pmouseX, pmouseY, mouseX, mouseY); // line(x1, y1, x2, y2). Draw line using mouse position changes
   // println(pmouseX, pmouseY, mouseX, mouseY); // print positions (Optional) 
  }
}

// Clear drawing
void keyPressed(){
  background(50);                         // restore default background                      
}
