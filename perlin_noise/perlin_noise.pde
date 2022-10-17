import processing.sound.*;

//FFT fft;
//Amplitude amp;
//AudioIn in;

int cols, rows;
int scale = 20;
int w = 2000;
int h = 1600;
float terrain [][]; 
float flying = 0; 


void setup(){
  frameRate(60);
  size(600, 600, P3D);
  
  //fft = new FFT(this);
  //in = new AudioIn(this, 0);
  //in.start();
  //fft.input(in);
  
  cols = w/scale;
  rows = h/scale;
  
  terrain = new float[cols][rows];
  
}

void draw(){
  flying -= 0.07;
  
  float yoffset = flying;
  for(int y = 0; y < rows; y++){
    float xoffset = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoffset, yoffset), 0, 1, -100, 100);
      //println(noise(xoffset, yoffset));
      xoffset += 0.2;
    }
    yoffset += 0.2;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2+50);
  rotateX(PI/3);
  
  translate(-w/2, -h/2);
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      //vertex(x*scale, y*scale, (cols));
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
      // rect(x*scale, y*scale, scale, scale);
    }
    endShape();
  }
}
