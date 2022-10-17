import processing.sound.*;

FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512
float cloudX = 1;

void setup(){
  frameRate(60);
  size(640, 240);
  background(0);

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
  //sky
  background(#85C1E9);
  
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);
  
  // sun
  strokeWeight(1);
  stroke(#EBD110);
  fill(#EBD110);
  circle(550, 50, 40);
  
  // clouds
  
  stroke(255);
  fill(255);
  ellipseMode(CORNER);
  ellipse(cloudX-400, 40, 140, 25);  // -240
  ellipseMode(CENTER);
  ellipse(cloudX-180, 65, 80, 20); // -220
  ellipse(cloudX-100, 30, 100, 25); // -60
  ellipse(cloudX, 65, 100, 25);
   
  for(int i = 0; i < bands; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude

    // tree trunk
    stroke(#725c42); 
    strokeWeight(5);
    line(i, height, i, (height) - spectrum[i]*(height)*5);
    
    // foliage
    stroke(0, 100+(spectrum[i]*(height)*4), 0);
    strokeWeight(spectrum[i]*(height)*4);
    point(i, (height) - spectrum[i]*(height)*6);
    
    // grass
    stroke(0, 150, 0); 
    strokeWeight(5);
    line(i, height, i, (height) - spectrum[i]*(height)*1.5);
  }
  // wind speed
  if (cloudX-400 > width){
    cloudX = 0;
  }else{
    cloudX += 0.25;
  }
}
