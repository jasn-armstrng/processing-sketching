import processing.sound.*;

SoundFile file;
FFT fft; // FFT (Fast Fourier Transform) analyzer. It calculates the normalized power spectrum
// of an audio stream the moment it is queried with the analyze method.

//AudioIn in; // audio input

int bands = 1024; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands]; // Create an array of floats for the spectrum values

float x = 0;
float y = 0;
float z = 0;

void setup() {
  

  // Create an input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  //in = new AudioIn(this, 0);

  file = new SoundFile(this, "milk-shake-116330.mp3");
  file.play();

  // start the Audio Input
  //in.start();

  // patch the AudioIn. Audio -> FFT
  // input() the sound source. Can be an oscillator, noise generator, SoundFile, or AudioIn (mic)
  fft.input(file);
  
  frameRate(60);
  size(640, 480, P3D);
  background(0);
  y = height;
}

void draw() {
  background(0); // continuosly draw the background black
  // analyze(): queries a value from the analyzer and returns a float between 0 and 1. Calculates the 
  // current frequency spectrum and returns it as an array with as many elements as frequency bands.
  fft.analyze(spectrum);
  //rotateY(PI/4);

  // translate(width/2, height/2);
  // rotateX(PI/3);
  
  for (int i = 0; i < bands; i++) {
  //  // the result of the FFT is normalized 
  //  // draw the line for frequency band i scaling it up by 5 to get more amplititude

    int j = int(random(i, 511));
    x = j+104;


  //  // println(i, spectrum[i]); 
  //  // i is between 0-511
    stroke(255);
    line(i, height, i, height - (spectrum[i]*height)); // display the FFT as a white vertical lines

  //  //stroke(#FF7077);
  //  //point(x, y - spectrum[i]*y*10);


  //  //if (y < 5){
  //  //  y = height;
  //  //} else {
  //  //  y -= 0.0001;
  //  //}
  }
}
