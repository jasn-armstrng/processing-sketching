import processing.sound.*;

SoundFile file;
Amplitude amp;
//AudioIn in;

int w = 1600; // terrain width
int h = 1600; // terrain lenth
int rows, cols = 0;
int scale = 10;
float [][] terrain;
float xoff, yoff;
float flying, n = 0;

void setup() {
  amp = new Amplitude(this);
  file = new SoundFile(this, "the-podcast-intro-111863.mp3");
  file.loop();
  amp.input(file);

  frameRate(60);
  size(1000, 600, P3D); // size does not take variables, only numbers
  background(#4C5270);
  cols = w/scale; // 600/20 = 30
  rows = h/scale; // same
  terrain = new float[cols][rows];
}

void draw() {
  // println(amp.analyze());
  flying -= 0.1;
  // n += 0.0001;

  yoff = flying;
  for (int y = 0; y < rows; y ++) {
    xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -20, 20); // for each row in the x starting with 0 each 
      // connecting vertex in the y [random(-11, 10)]
      xoff += amp.analyze(); // increase the offset by this 
    }
    yoff += amp.analyze();
  }

  background(#4C5270);
  stroke(#36EEE0);
  noFill();

  translate(width/2, height/2); // translate to the frame from 0,0
  rotateX(PI/3.0);
  rotateZ(PI/4);
  translate(-w/2, -h/2); // translate the terrain from width/2, height/2

  for (int y = 0; y < rows-1; y ++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      // 1. draw a 20 rectangle column 20px wide 20 times
      // rect(x*scl, y*scl, scl, scl); 
      // 2. Replacing 1. using beginShape to draw triangles 
      vertex(x*scale, y*scale, terrain[x][y]); // randoms the z value 
      vertex(x*scale, (y+1) * scale, terrain[x][y+1]);
    }
    endShape(); // Note ending the shape after the inner loop
  }
}
