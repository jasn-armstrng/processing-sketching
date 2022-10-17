import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 4096;
float[] spectrum = new float[bands];

// for display color
float r;
float g;
float b;
float y_pos; 
//int scale = 0;
// float y_pos2;

void setup() {
  size(1024, 480);
  background(0);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
}      

void draw() { 
  background(0);
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  
  fft.analyze(spectrum);

  for(int i = 0; i < bands; i++){
    // amplitude variable to to track   
    y_pos = height - spectrum[i]*(height) * 15;
    // y_pos2 = spectrum[i] * 60;
    
    // Change color (Flicker)
    // stroke(r, g, b);
    
    //Change color based on amplitude
    colourOnHeight(y_pos);
    
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    line( i, height, i, (height) - spectrum[i]*(height)*5 ); // this
    
    // The result of the FFT is normalized
    // draw the point for frequency band i scaling it up by 5 to get more amplitude.
    point(i, y_pos); // This
        
    // For analysis and debugging
    //println(spectrum[i], " ", (height/2) - spectrum[i], " ", (height/2) - spectrum[i]*(height/2)*5 );
    //println(bands);
    //println(y_pos2);
  } 
}

void colourOnHeight(float y){
  if (y <= 120){
      stroke(220,20,60);
      strokeWeight(5);
      //shininess(5.0); 
    } else if (y > 120 && y < 240){
      stroke(255,128,0);
      strokeWeight(4);
    } 
    else if (y <= 400 && y >= 240){
      stroke(51,255,51);
      strokeWeight(3);
    }else {
      stroke(255);
      strokeWeight(2);
      //shininess(5.0); 
    }
}
