import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512
float lumen = 0;

void setup(){
  size(750, 750);
  background(#1B262C);

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
  //background(#1B262C);
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);

  
  for(int i = 0; i < bands; i++){
    
    
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude


    
    fill(0);
    strokeWeight(1);
    
    if ((spectrum[i]*height*3) > 350){
      stroke(#FDCB9E); 
    }else if((spectrum[i]*height*3) > 250){
      stroke(#00B7C2); 
    }else if((spectrum[i]*height*3) > 150){
      stroke(#0F4C75); 
    }else{
      stroke(random(255));
    }
    circle(width/2, height/2, spectrum[i]*height*random(5));
  }
}
