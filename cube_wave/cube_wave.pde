import processing.opengl.*;

float angle;
float offset;
int w;
float maxD;
int counter;
boolean record;

void setup(){
  size(640, 640, OPENGL);
  angle = 0;
  w = 30;
  maxD = dist(0, 0, 200, 200);
  counter = 1;
  record = true;
}

void draw(){
  offset = 0;
  background(255, 255, 230);
  translate(width/2, height/2, 0);
  translate(0, 0, -400);
  rotateX(-PI/4);
  rotateY(PI/4); 
  
  directionalLight(255, 102, 102, 4, 6, -2); 
  /**
  directionalLight(0, 153, 153, 1, 0, 0);
  directionalLight(0, 150, 0, 0, 1, 0);
  directionalLight(102, 102, 153, 0, 0, -1);
  */
  
  for (float x = 0; x < width; x+=w){
    for (float z = 0; z < height; z+=w){
      push();
      float d = dist(x, z, width/2, height/2);
      float offset = map(d, 0, maxD, -PI, PI);
      float a = angle + offset; 
      float h = map(sin(a), -1, 1, 20, width/3);
      translate(x - width/2, 0, z - height/2);
      box(w, h, w);
      pop();
    }
  }
  angle -= 0.05;
  if (record){
    saveFrame("output/gif-" + counter + ".png");
    if (angle <= -TWO_PI){
      exit();
    }
    counter++;
  }
}
