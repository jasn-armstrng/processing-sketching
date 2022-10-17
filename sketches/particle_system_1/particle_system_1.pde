int d = 29;
int degrees = 360;
float [] theta = new float[degrees];
float step = 0.1;

void setup(){
  size(640, 580, P3D);
  background(30);
  frameRate(30);
  
  for (int i = 0; i < theta.length; i ++){
    theta[i] = (i + 1);
  }
  
}

void draw(){
  background(30);
  translate(width/2, height/2, -100);
  
  step += 0.001;
  constrain(step, 0.1, width);
  
  rotateX(0);
  rotateY(0);
  rotateZ(33);
  
  beginShape();
  for (int i = 0; i < theta.length; i++){
    float x = -cos(theta[i] * d * PI/180) * tan(theta[i]);
    float y = tan((theta[i] * step) * d * PI/180 * tan(theta[i]));
    
    noFill();
    stroke(255, 90);
    strokeWeight(3);
    point(x, y); // Centre mass of light
    
    if (abs(x * 10) > 20){
      strokeWeight(random(3, 5));
    } else{
      strokeWeight(2);
    }
    
    point((x * 50), (y * 50));
    point(-(x * 100), -(y * 100));
    point((x * 150), (y * 150));
    point(-(x * 200), -(y * 200));
  }
  endShape();
}