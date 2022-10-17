import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512

void setup(){
  size(810, 540);
  background(#363636);

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
  //background(#363636);
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);

  
  for(int i = 0; i < bands; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
   
    strokeWeight(2);
    stroke(#E8175D);
    line(i, (height/2), i, (height/2) - spectrum[i]*(height/2)*3);
    strokeWeight(1);
    stroke(#CC527A);
    line(i, (height/2), i, (height/2) + spectrum[i]*(height/2)*4);
    strokeWeight(2);
    stroke(#474747);
    line((width-i), (height/2), (width-i), (height/2) - spectrum[i]*(height/2)*4);
    strokeWeight(2);
    stroke(#A8A7A7);
    line((width-i), (height/2), (width-i), (height/2) + spectrum[i]*(height/2)*5);

  }
}
