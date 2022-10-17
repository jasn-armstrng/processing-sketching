class Walker{
  // Instance variables
  int x;
  int y;
  
  // Constructor
  Walker(){
    x = width/2;
    y = height/2;
  }
  
  // Function for the Walker instance to display itself on screen 
  void display(){
    stroke(0); // Colour of our 'footprint'
    point(x, y);
  }
  
  // Step (move) in a random direction. Ver. 1 - only 4 directions
  //void step(){
  //  int choice = int(random(4)); // returns an integer between 0 and 3. Note the random function returns a float 
    
  //  // Direction of the step based on value of choice
  //  if (choice == 0){
  //    x++;
  //  } else if (choice == 1){
  //    x--;
  //  } else if (choice == 2){
  //    y++;
  //  } else {
  //    y--;
  //  }
  //}
  
  //// Step (move) in a random direction. Ver. 2 - 8 directions -  we now include NE, NW, SE, SW
  //void step(){
  //  int stepx = int(random(3))-1; // Yields -1, 0, 1
  //  int stepy = int(random(3))-1;
    
  //  x += stepx;
  //  y += stepy;
  //}
  
  // Step (move) in a random direction. Ver. 3. Walker with bias in step
  void step() {
    float r = random(1);
    //[full] A 40% chance of moving to the right!
    if (r < 0.4) {
      x++;
      //[end]
    } else if (r < 0.6) {
      x--;
    } else if (r < 0.8) {
      y++;
    } else {
      y--;
    }
  }
}


Walker w; // For our single random walk model

void setup(){
  size(640, 360);
  w = new Walker(); // Call constructor
  background(255);
}

void draw(){
  w.step(); // walk
  w.display(); // show walk
}
  
