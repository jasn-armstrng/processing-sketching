// Generative art with Parametric equations

static final int NUM_LINES = 10;
float t; // Time variable

void setup(){
  background(30);
  size(500, 500);
}

void draw(){
  background(30);
  //stroke(255);
  strokeWeight(5);
  
  translate(width/2, height/2); // Moves the origin to this location
  
  //point(x1(t), y1(t)); 
  //point(x2(t), y2(t));
  for (int i = 0; i < NUM_LINES; i++){
    stroke(233,54,16);
    line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
    line(x1(t - i), y1(t - i), x2(t - i), y2(t - i));
    stroke(70,130,180);
    line(x3(t + i), y3(t + i), x4(t + i), y4(t + i));
    line(x3(t - i), y3(t - i), x4(t - i), y4(t - i));
  }
  t+= 0.5;
}

float x1(float t){
  return sin(t/10) * 100 + sin(t/5) * 20;
}

float y1(float t){
  return cos(t/10) * 100;
}

float x2(float t){
  return sin(t/10) * 200 + sin(t) * 2;
}

float y2(float t){
  return cos(t/20) * 200 + cos(t/12) * 20;
}

///////// Second wave

float x3(float t){
  return -(sin(t/10) * 100 + sin(t/5) * 20);
}

float y3(float t){
  return -(cos(t/10) * 100);
}

float x4(float t){
  return -(sin(t/10) * 200 + sin(t) * 2);
}

float y4(float t){
  return -(cos(t/20) * 200 + cos(t/12) * 20);
}
