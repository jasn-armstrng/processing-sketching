import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512

void setup(){
  size(810, 540);
  background(#474747);

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
  //background(#594F4F);
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);

  
  for(int i = 0; i < bands; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
    
    //stroke(#547980);
    //line(i, height, i, height - spectrum[i]*height*5);
    //stroke(#45ADA8);
    //line(i, 0, i, 0 + spectrum[i]*height*5);
    
    stroke(#547980);
    //point(i, height - spectrum[i]*height*5);
    stroke(#45ADA8);
    //point(i, 0 + spectrum[i]*height*5);
     
    strokeWeight(1);
    stroke(0);
    //point(i, (height) - (spectrum[i]*(height)*7));
    rectMode(CENTER);
    fill(0);
    rect(i, height, 10, (spectrum[i]*(height)*7));
    strokeWeight(1);
    stroke(#F9CDAD);
    //stroke(255);
    point(i, 0 + tan(spectrum[i]*(height/2)*7));
    strokeWeight(1);
    stroke(#C8C8A9);
    //point((width-i), (height/2) - (spectrum[i]*(height/2)*7));
    strokeWeight(1);
    stroke(#FE4365);
    //stroke(255);
    //point((width-i), (height/2) + spectrum[i]*(height/2)*7);
    
    //strokeWeight(2);
    //stroke(#2A363B);
    //point(i, (height/2) - spectrum[i]*(height/2)*3);
    //strokeWeight(1);
    //stroke(#2A363B);
    //point(i, (height/2) + spectrum[i]*(height/2)*4);
    //strokeWeight(1);
    //stroke(#2A363B);
    //point((width-i), (height/2) - spectrum[i]*(height/2)*5);
    //strokeWeight(2);
    //stroke(#2A363B);
    //point((width-i), (height/2) + spectrum[i]*(height/2)*2);

  }
}
