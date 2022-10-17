// ** Global Variables ** //

int degrees = 360;
float [] theta = new float[degrees];
float k = 0.9;
boolean recording = false;


// ** Setup ** //

void setup(){
  size(1080, 640);
  background(30);
  smooth(4);
  frameRate(100);
  
  for (int i = 0; i < theta.length; i++){ // Populate theta array 1-360
    theta[i] = (i + 1);
  }
}


//  ** Recording button function ** //

//void keyPressed(){
//  if (key == 'r' || key == 'R'){
//    recording = !recording;
//  }
//}

void keyPressed() {
  final int k = keyCode;
  looping ^= k == 'P';
  redraw = k == 'S';
}


// ** Draw ** //

void draw(){
  background(30);
  translate(width/2, height/2); // Move origin to midpoint of the drawing window
 
  //k = mouseX;
  k += 0.0001; // Increase k slowly
  constrain(k, 0.9, 360); // k's max value is 360
  print(k, "\n");
  
  beginShape();
    stroke(255, 215, 0);
    strokeWeight(0.5);
    noFill();
  
    for (int i = 0; i < theta.length; i++){
      float r = cos(k * theta[i]);
      float x = r * cos(theta[i]);
      float y = r * sin(theta[i]);
      vertex(x * 225, y * 225);
    }  
  endShape();
  
  //if (recording){
  //  saveFrame("output/ms_####.png");
  //}
  

}