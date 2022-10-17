import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512


float x;
float y;
float a = 50;
float r = 50;

void setup(){
  frameRate(60);
  size(1080, 720);
  background(#2f496e);
  
  // Create an input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn. Audio -> FFT
  // input() the sound source. Can be an oscillator, noise generator, SoundFile, or AudioIn
  fft.input(in); 
}

void draw(){
  //background(#4c5270);
  translate(width/2, height/2);
  fft.analyze(spectrum);
  
  beginShape();
  for(int i = 0; i < 360; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
   
    strokeWeight(2);
    stroke(#f4eade);
    r = spectrum[i]*(height)*2;
    x = r * cos(a);
    y = r * sin(a);
    
    //line(x, y, x+10, y+10);
    point(x, y);  
    //stroke(#4c5270);
    //point(y, x);
 
    //point(y, x);
    
  }
  endShape();
  
   beginShape();
  for(int i = 0; i < 360; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
   
    strokeWeight(1);
    //stroke(#bcece0);
    r = spectrum[i]*(height)*3;
    x = r * cos(a);
    y = r * sin(a);
    
    //line(x, y, x+10, y+10);
    //vertex(x, y);  
    stroke(#ed8c72);
    point(x, y);
 
    //point(y, x);
    
  }
  endShape();
  
  beginShape();
  for(int i = 0; i < 360; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
   
    strokeWeight(1);
    //stroke(#bcece0);
    r = spectrum[i]*(height)*5;
    x = r * cos(a);
    y = r * sin(a);
    
    //line(x, y, x+10, y+10);
    //vertex(x, y);  
    stroke(#2988bc);
    point(x, y);
 
    //point(y, x);
    
  }
  endShape();
  
  a+=0.01;
  
  
}
