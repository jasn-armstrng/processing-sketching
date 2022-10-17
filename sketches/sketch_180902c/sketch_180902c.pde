class Ball {
  PVector location;
  PVector velocity;

  Ball(){
    location = new PVector(width/2, height/2);
    velocity = new PVector(2.5, -2);
  }  
  
  void move(){
    location.add(velocity);
  }
  
  void bounce(){
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)){
      velocity.y = velocity.y * -1;
    }
  }
  
  void display(float radA, float radB){
    stroke(0);
    strokeWeight(10);
    fill(255, 0, 150);
    ellipse(location.x, location.y, radA, radB);
  }
}
