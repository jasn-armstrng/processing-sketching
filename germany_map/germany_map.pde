float x = 0;
float y = 0;
float z = 0;

float t = 10.7;
float r = 28.3;
float b = 8.4/PI;

float v = 0;

float angle;

float dx, dy, dz, dt;

color[] hexColors = new int[4];
int index;
color colour;


void setup(){
  frameRate(60);
  size(1080, 720, P3D);
  background(22);
  
  hexColors[0] = #8d230f;
  hexColors[1] = #1e434c;
  hexColors[2] = #9b4f0f;
  hexColors[3] = #c99e10;
}

void draw(){
  translate(width/2, height/2);
  // rotate(angle);
  rotateX(angle);
  scale(5);
  //stroke(x*10, y*10, z*10)
  //index = int(random(0,4));
  //println(hexColors[index]);
  //println(hexColors[index]);
  //colour = hexColors[index];
  //stroke(hexColors[(int)random(4)]);
  
  
  
  dt = 0.0088;
  
  dx = (t * (y - x)) * dt;  
  dy = ((x * (r - z)) - y) * dt;
  dz = ((x * y) - (b * z)) * dt;
  
  x =  x + dx;
  y =  y + dy;
  z =  z + dz;
  
  if (x>1){
    stroke(#ffcc00);
  }else{
    stroke(#ffcc00);
  }
  
  strokeWeight(0.3);
  point(z, x, y);

  if (x>1){
    stroke(#dd0000);
  }else{
    stroke(#dd0000);
    // stroke(0);
  }
  point(-z, -x, -y);
  x+=0.01;
  y+=0.01;
  z+=0.01;
  angle += 0.9;
  
}
