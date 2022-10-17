// Study of parametrics

import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 128;
float[] spectrum = new float[bands];
float spec_val;


float[] t = {-4, -3, -2, -1, 0, 1, 2, 3, 4};
float x_pos;
float y_pos;

float[] theta = {PI/3, PI/2, (2*PI)/3, PI, (4*PI)/3, (4*PI)/2, (5*PI)/3, 2*PI};
float x2_pos;
float y2_pos;

static final int NUM_LINES = 10;
float u;

void setup(){
  size(640, 480);
  background(45);
  // frameRate(4);
  
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
  
}

void draw(){
  background(45);
  translate(width/2, height/2);
  
  //parabola_1();
  //parabola_2();
  //parabola_3();
  parametric_1();
  //circle_1();
  //circle_2();
  //shape_music_test();  
}

float x(float var_x){
  //return sq(var_x);
  return sin(var_x/10) * 100 + sin(var_x/5) * 20;
}

float y(float var_y){
  //return var_y * 2;
  return cos(var_y/10) * 100;
}

float x0(float var_x){
  //return sq(var_x);
  //return var_x;
  return (sin(var_x/10) * 100 + sin(var_x/5) * 20);
  //return (cos(16*var_x) + (cos(6*var_x)/2) + (sin(10*var_x)/3));
  //return sin(var_x/10) * 100 + sin(var_x/5) * 20;
}

float y0(float var_y){
  //return var_y * 2;
  return (cos(var_y/10) * 100);
  //return cos(var_y/10) * 100;
}

float x01(float var_x){
  //return sq(var_x);
  //return var_x;
  //return (sin(var_x/10) * 200 + sin(var_x) * 2);
  return (cos(16*var_x) + (cos(6*var_x)/2) + (sin(10*var_x)/3));
  //return sin(var_x/10) * 100 + sin(var_x/5) * 20;
}

float y01(float var_y){
  //return var_y * 2;
  //return (cos(var_y/20) * 200 + cos(var_y/12) * 20);
  return cos(var_y/10) * 100;
}

float x1(float var_x){
  //return sq(var_x);
  return sin(var_x/10) * 200 + sin(var_x) * 2;
}

float y1(float var_y){
  //return var_y * 2;
  return cos(var_y/20) * 200 + cos(var_y/12) * 20;
}

float x2(float var_x){
  return 3*sin(var_x);
}

float y2(float var_y){
  return 4*cos(var_y);
}

// Draw, parabolas
void parabola_1(){
  for (int i = 0; i < t.length; i++){
    //println(t[i]); 
    x_pos = x(t[i]);
    y_pos = y(t[i]);
    stroke(255);
    point(x_pos, y_pos);
    point(-(x_pos), -(y_pos));
  }
}

void parabola_2(){
  fft.analyze(spectrum);
  
  for (int j = 0; j < bands; j++){
    spec_val = spectrum[j] * (height) * 15;
    //println(t[i]); 
    x_pos = x(spec_val);
    y_pos = y(spec_val);
    x2_pos = x1(spec_val);
    y2_pos = y1(spec_val);
    
    if (y2_pos <= 100){
      stroke(220,20,60);
      //strokeWeight(5);
      //fill(220,20,60);
      //point(i, y_pos);
    } else if (y2_pos > 100 && y2_pos < 200){
      stroke(255,128,0);
      //strokeWeight(2);
    } 
    else if (y2_pos > 200){
      stroke(51,255,51);
      //strokeWeight(3);
    }else {
      stroke(255);
      //strokeWeight(2);
      //shininess(5.0); 
    }
    //println(x_pos, y_pos);
    //println(x2_pos, y2_pos);
    //stroke(255);
    //strokeWeight(5);
    point(x_pos, y_pos);
    point(-(x_pos), -(y_pos)); 
    point(x2_pos, y2_pos);
    point(-(x2_pos), -(y2_pos));  
  }
}

void parabola_3(){
  fft.analyze(spectrum);
  
  for (int j = 0; j < bands; j++){
    spec_val = spectrum[j] * (height) * 15;
    //println(t[i]); 
    x_pos = x0(spec_val);
    y_pos = y0(spec_val);

    stroke(205, 92, 92);
    strokeWeight(2);
    point(x_pos, y_pos);
    point(-(x_pos), -(y_pos)); 
    //point(x2_pos, y2_pos);
    //point(-(x2_pos), -(y2_pos));  
  }
}



void parametric_1(){
  fft.analyze(spectrum);
  
  for (int j = 0; j < bands; j++){
    spec_val = spectrum[j] * (height) * 200;
    //println(t[i]); 
    //x_pos = x0(spec_val);
    //y_pos = y0(spec_val);
    //x2_pos = x01(spec_val);
    //y2_pos = y01(spec_val);
    for (int i = 0; i < NUM_LINES; i++){
      stroke(205, 92, 92);
      //strokeWeight(2);
      line(x0(i + u), y0(i + u), x01(i + u), y01(i + u));
      line(x0(i - u), y0(i - u), x01(i - u), y01(i - u));
    }
    //stroke(205, 92, 92);
    //strokeWeight(2);
    ////line(x_pos, y_pos, x2_pos, y2_pos); 
    
    //point(-x2_pos, y2_pos);
    //point(-(x2_pos), (y2_pos));  
  }
  u += spec_val;
}

// Draw points on Circle 1
void circle_1(){
  for (int i = 0; i < theta.length; i++){
    //println(theta[i]); 
    x2_pos = x2(t[i]);
    y2_pos = y2(t[i]);
    stroke(255);
    noFill();
    point(x2_pos*10, y2_pos*10);
    point(-(x2_pos*10), -(y2_pos*10));
  }
}

// Draw points on Circle 2
void circle_2(){
  for (int i = 0; i < theta.length; i++){
    //println(theta[i]); 
    x2_pos = x2(t[i]);
    y2_pos = y2(t[i]);
    stroke(255);
    noFill();
    //point(x2_pos*10, y2_pos*10);
    //point(-(x2_pos*10), -(y2_pos*10));
    arc(0, 0, 60, 60, x2_pos, y2_pos);
  }
}

// Sound reactive shape test
void shape_music_test(){
    fft.analyze(spectrum);
  
    for (int i = 0; i < theta.length; i++){
      //println(theta[i]); 
      x2_pos = x2(t[i]);
      y2_pos = y2(t[i]);
      stroke(255);
      noFill();
      //point(x2_pos*10, y2_pos*10);
      //point(-(x2_pos*10), -(y2_pos*10));
      for (int j = 0; j < bands; j++){
        spec_val = spectrum[i] *(height) * 250;
        arc(0, 0, spec_val, spec_val, x2_pos, y2_pos);
      }
  }
}