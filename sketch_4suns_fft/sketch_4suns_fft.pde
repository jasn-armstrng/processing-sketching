import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512
float k;

void setup(){
  frameRate(60);
  size(1080, 720, P3D);
  background(#2988BC);

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
  //background(55);
  
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);
    
  for(int i = 0; i < bands; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
   
    stroke(0.2);
    noFill();
    //stroke(#102A49);
    //circle(width/2, height*0.1, spectrum[i]*(height*0.25)*5);
    stroke(#c1e1dc);
    circle(width/2, height*0.2, spectrum[i]*(height*0.25)*10);
    stroke(#f4eade);
    circle(width/2, height*0.4, spectrum[i]*(height*0.25)*15);
    stroke(#ed8c72);
    circle(width/2, height*0.6, spectrum[i]*(height*0.25)*20);
    stroke(#fdd475);
    circle(width/2, height*0.8, spectrum[i]*(height*0.25)*25);
    stroke(#102A49);
    point(i+width/2, height - spectrum[i]*(height)*60);
    point((width/2)-i, height - spectrum[i]*(height)*60);
  }
}
  
