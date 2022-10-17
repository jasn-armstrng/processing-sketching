import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512

float y;

void setup(){
  size(1080, 440);
  background(44);

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
  //background(44);
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);

  
  for(int i = 0; i < bands; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
    //println(i, height, i, height - spectrum[i]*height*5, spectrum[i]);
    //println(spectrum[i]*height*7);
    //line(i, height/2, i, (height/2) + spectrum[i]*(height/2)*7);
    strokeWeight(0.95); 
    
    //if (y < 218){
    //  stroke(255);
    //  strokeWeight(3);
    //}else{
    //  stroke(44);
    //}
    point((width/2) - (spectrum[i]*(width/2)*15), i);
    point((width/2) + (spectrum[i]*(width/2)*15), i);
    
    line(width/2, i, (width/2) + spectrum[i]*(width/2)*7, i);
    line(width/2, i, (width/2) - spectrum[i]*(width/2)*7, i);
    //line(width/2, i, (width/2) - spectrum[i]*(width/2)*7, tan(i));
    //line(i, height/2, i, (height/2) - spectrum[i]*(height/2)*7);
   
  }
}
