import processing.sound.*;

SoundFile file;
FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
         // of an audio stream the moment it is queried with the analyze method.
// AudioIn in; // audio input
int bands = 4096; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // float array object of size 512

void setup(){
  size(1300, 775);
  background(#000000);

  // Create an input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  // in = new AudioIn(this, 0);
  
  // start the Audio Input
  // in.start();
  
  // file = new SoundFile(this, "/Users/jasonarmstrong/Downloads/the-future-bass-15017.mp3");
  file = new SoundFile(this, "Au5 feat. Tasha Baxter - Snowblind.mp3");
  // file = new SoundFile(this, "01 - I'm Dreaming.mp3");
  file.play();
  
  // patch the AudioIn. Audio -> FFT
  // input() the sound source. Can be an oscillator, noise generator, SoundFile, or AudioIn
  fft.input(file); 
}

void draw(){
  background(#000000);
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1
  fft.analyze(spectrum);

  
  for(int i = 0; i < bands; i++){
    // the result of the FFt is normalized 
    // draw the line for frequency band i scaling it up by 5 to get more amplititude
    //println(i, height, i, height - spectrum[i]*height*5, spectrum[i]);
    //stroke(#F6F6F6); 
    strokeWeight(0.5);
    line(i, height/2, i, (height/2) - spectrum[i]*(height/2)*2);
    line(i, height/2, i, (height/2) + spectrum[i]*(height/2)*2);
    stroke(#9EDE73); 
    strokeWeight(1);
    point(i, (height/2) - spectrum[i]*(height/2)*7);
    point(i, (height/2) + spectrum[i]*(height/2)*7);
    //point(i, height - spectrum[i]*height*5);
    // strokeWeight(2);
    stroke(#9EDE73); 
    //point(i, height - spectrum[i]*height*10);
    point((width-i), (height/2) - spectrum[i]*(height/2)*7);
    point((width-i), (height/2) + spectrum[i]*(height/2)*7);
    //stroke(#F6F6F6);
    strokeWeight(0.5);
    line((width-i), height/2, (width-i), (height/2) - spectrum[i]*(height/2)*2);
    line((width-i), height/2, (width-i), (height/2) + spectrum[i]*(height/2)*2);
  }
}
