int x1, y1, x2, y2;
float a;

void setup(){
  size(600, 400);
  background(0, 0, 0);
  x1 = 0;
  y1 = 0;
  x2 = 0;
  y2 = 0;
  a = 0;
}

void draw(){
  translate(width/2, height/2);
  background(0, 0, 0);
  
  stroke(255, 255, 255);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);
  
  noStroke();
  fill(255, 0, 0);
  ellipse(x1, y1, 50, 50);
  ellipse(x2, y2, 50, 50);
  
  a = a + 0.05;
  x1 = -100 + int(100*sin(a));
  x2 = 100 + int(100*sin(0.9*a));
  
  
}
