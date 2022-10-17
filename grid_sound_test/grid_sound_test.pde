import processing.sound.*;

SoundFile file;
FFT fft; 
// AudioIn in;

int w = 512; // terrain width
int h = 512; // terrain lenth
int bands = w; // number of frequency bands for the FFT as an integer (default 512)
float[] spectrum = new float[bands];
int rows, cols = 0;
int scale = 10;
float z, n;

void setup(){
  fft = new FFT(this, bands);
  file = new SoundFile(this, "INZO - Multiverse.mp3");
  //file = new SoundFile(this, "01 - I'm Dreaming.mp3");
  file.loop();
  fft.input(file);
 
  frameRate(60);
  size(1000, 800, P3D);
  background(#120078);
  
  cols = w/scale; // 600/20 = 30
  rows = h/scale; // same
}

void draw(){
  fft.analyze(spectrum);
  background(#120078);
  n += 0.0001;

  translate(width/2, height/2); // translate to the frame from 0,0
  rotateX(PI/3.0);
  rotateZ(PI/n);
  translate(-w/2, -h/2); // translate the terrain from width/2, height/2

  for (int y = 0; y < rows; y ++) {
    for (int x = 0; x < cols; x++) {
      // 1. draw a 20 rectangle column 20px wide 20 times
      strokeWeight(2);
      stroke(#9D0191);
      noFill();
      rect(x*scale, y*scale, scale, scale); 
      z = spectrum[x]*100;
      strokeWeight(4);
      stroke(#FD3A69);
      
      
      line(x*scale, y*scale, 0, x*scale, y*scale, z);
      strokeWeight(3);
      stroke(#FECD1A);
      point(x*scale, y*scale, z+5);
      
      // println(x*scale, y*scale);
      // 2. Replacing 1. using beginShape to draw triangles 
      //vertex(x*scale, y*scale, terrain[x][y]); // randoms the z value 
      //vertex(x*scale, (y+1) * scale, terrain[x][y+1]);
    }
    // Note ending the shape after the inner loop
  }
}
