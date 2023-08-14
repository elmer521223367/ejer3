float starX, starY; 
color starColor; 
float xSpeed, ySpeed; 

void setup() {
  size(600,600);
  starX = random(width); 
  starY = random(height); 
  starColor = color(random(255), random(255), random(255)); 
  xSpeed = random(1, 3); 
  ySpeed = random(1, 3); 
}

void draw() {
  background(255); 
  fill(starColor); 
  noStroke(); 
  

  drawStar(starX, starY, 30, 70, 5);
  
   starX += xSpeed;
  starY += ySpeed; 
  
  if (starX > width || starX < 0 || starY > height || starY < 0) {
    starColor = color(random(255), random(255), random(255)); 
    xSpeed = random(1, 3) * (random(2) > 1 ? 1 : -1); 
    ySpeed = random(1, 3) * (random(2) > 1 ? 1 : -1); 
  }
}

void drawStar(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle / 2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float x1 = x + cos(a) * radius2;
    float y1 = y + sin(a) * radius2;
    vertex(x1, y1);
    x1 = x + cos(a + halfAngle) * radius1;
    y1 = y + sin(a + halfAngle) * radius1;
    vertex(x1, y1);
  }
  endShape(CLOSE);
}
