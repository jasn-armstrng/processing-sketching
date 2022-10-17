import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio i nput
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512

void setup(){
  size(1024, 512);
  background(#F8B195);

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
  //background(#F8B195);
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);

  
  for(int i = 0; i < bands; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
    //println(i, height, i, height - spectrum[i]*height*5, spectrum[i]);
    
    
    strokeWeight(1);
    stroke(#6C5B7B); 
    point(i, (height/2) - spectrum[i]*(height/2)*15);
    strokeWeight(1);
    stroke(#C06C84); 
    point(i, (height/2) + spectrum[i]*(height/2)*15);
    
    strokeWeight(2);
    stroke(#F67280); 
    point(i, (height/2) - spectrum[i]*(height/2)*10);
    strokeWeight(2);
    stroke(#355C7D);
    point(i, (height/2) + spectrum[i]*(height/2)*10);

  }
}
