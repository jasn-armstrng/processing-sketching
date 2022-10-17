import processing.sound.*;
import peasy.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8/3;

float r = 0.0;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup(){
  size(1024, 720, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
  
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
  //background(0);
}

void draw(){
  background(0);
  fft.analyze(spectrum);
  
  float dt = 0.01;
  
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = ((x * y) - (c * z)) * dt;
  
  x =  x + dx;
  y =  y + dy;
  z =  z + dz;
  
  points.add(new PVector(x, y, z));
  
  translate(0, 0, -80);
  scale(5);
  stroke(255);
  noFill();
  
  float hu = 0;
  
  beginShape();
  rotateY(r);
  for (PVector v : points){
    strokeWeight(1);
    stroke(hu, 255, 255);
    point(v.x, v.y, v.z);
    //strokeWeight(5);
    //noFill();
    //point(v.x+2, v.y+3, v.z+5);
    
    for(int i = 0; i < bands; i++){
      PVector offset = PVector.random3D();
      offset.mult(spectrum[i]*15*5);
      v.add(offset);
    }
    
    
    hu += 0.01;
    if (hu > 255){
      hu = 0;
    }
  }
  endShape();
  
  
  
  r += 0.001;
  //point(x, y, z);
  
  //println(x, y, z);

}
