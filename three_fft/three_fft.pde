import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512
float k;

void setup(){
  frameRate(60);
  size(640, 480, P3D);
  background(#4c5270);

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
  background(#4c5270);
  
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);
  
  for(int i = 0; i < bands; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
    

   
    strokeWeight(2);
    stroke(#bcece0);
    line(i+(width*0.11), (height*0.25), i+(width*0.11), (height*0.25) - spectrum[i]*(height*0.25)*4);
    strokeWeight(0.5);
    stroke(255);
    point(i+(width*0.11), (height*0.25) - spectrum[i]*(height*0.25)*10);  
    
    

   
    strokeWeight(2);
    stroke(#f652a0);
    line(i+(width*0.33), (height/2), i+(width*0.33), (height/2) - spectrum[i]*(height/2)*4);
    strokeWeight(0.5);
    stroke(255);
    point(i+(width*0.33), (height/2) - spectrum[i]*(height/2)*10);
    

    
    strokeWeight(2);
    stroke(#36eee0);
    line(i+(width*0.66), (height*0.75), i+(width*0.66), (height*0.75) - spectrum[i]*(height*0.75)*4);
    strokeWeight(0.5);
    stroke(255);
    point(i+(width*0.66), ((height*0.75)) - spectrum[i]*((height*0.75))*10);
    

  }
}
