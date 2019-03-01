color fg = #111111;
color bg = #f1f1f1;
PImage img; 

void setup() {
  size(500, 700); 
  background(bg);
  img = loadImage("woman.jpg");
  img.resize(width, height);
}

void draw() {
  background(bg);
  fill(#111111);
  noStroke();
  float ratio = float(height)/float(width);
  float tilesX = map(mouseX, 0, width, 10, 100);
  float tilesY = ratio*tilesX;
  float tileW = width / tilesX;
  float tileH = height / tilesY;
  for (int y = 0; y < img.height; y += tileH) {
    for (int x = 0; x < img.width; x += tileW) {
      color c = img.get(x, y);
      float b = map(brightness(c), 0, 255, 1, 0);
      
      pushMatrix();
      translate(x, y);
      rect(0, 0, b*tileW, b*tileH);
      popMatrix();
    }
  }
}
