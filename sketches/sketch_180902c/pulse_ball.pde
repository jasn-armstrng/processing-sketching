/**
 * Processing Sound Library, Example 6
 * 
 * This sketch shows how to use the Amplitude class to analyze a
 * stream of sound. In this case a sample is analyzed. The smoothFactor
 * variable determines how much the signal will be smoothed on a scale
 * from 0 - 1.
 */

import processing.sound.*;

Ball b;

// Declare the processing sound variables 
//SoundFile sample;
Amplitude rms;
AudioIn in;



// Declare a scaling factor
float scale = 5.0;

// Declare a smooth factor
float smoothFactor = 0.25;

// Used for smoothing
float sum;

void settings() {
  size(640, 480);
}

void setup() {
  //size(400, 300);

  //Load and play a soundfile and loop it
  //sample = new SoundFile(this, "beat.aiff");
  //sample.loop();

  // Create and patch the rms tracker
  rms = new Amplitude(this);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  rms.input(in);
  
  b = new Ball();
}      

void draw() {
  // Set background color, noStroke and fill color
  background(0);
  //noStroke();
  //strokeWeight(10);
  //fill(255, 0, 150);

  // Smooth the rms data by smoothing factor
  sum += (rms.analyze() - sum) * smoothFactor;  

  // rms.analyze() return a value between 0 and 1. It's
  // scaled to height/2 and then multiplied by a scale factor
  float rmsScaled = sum * (height/2) * (scale * 1.5);

  // Draw an ellipse at a size based on the audio analysis
  b.move();
  b.bounce();
  b.display(rmsScaled, rmsScaled);
  // ellipse(width/2, height/2, rmsScaled, rmsScaled);
}
