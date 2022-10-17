import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 4096;
float[] spectrum = new float[bands]; // So my spectrum display is 4096 bands or pixels in range

float rad = 0;

void setup() {
  size(1024, 480);
  background(0);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
}      

void draw() { 
  
  translate(width/2, height/2);
  background(55);
  //point(0,0);
  
  fft.analyze(spectrum);

  for(int i = 0; i < bands; i++){
    
    rad = (spectrum[i] * (height) * 100);
    //stroke(0);
    //ellipseMode(CENTER);  // Set ellipseMode to CENTER
    println(rad);
    //point();
    //ellipse(0, 0, rad, rad);  // Draw white ellipse using CENTER mode
    
  } 
}