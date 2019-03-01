// Store the colors in variables
color fg = #111111;
color bg = #f1f1f1;

// The image-object
PImage img; 

void setup() {
  size(500, 700); 
  background(bg);

  // load the image file from the data-folder
  img = loadImage("woman.jpg");

  // Resize the image to the appropriate size
  img.resize(width, height);
}

void draw() {
  background(bg);
  fill(#111111);
  noStroke();

  // Calculate the ratio of the sketch
  float ratio = float(height)/float(width);

  // Set the number of tiles in one row 
  float tilesX = map(mouseX, 0, width, 10, 100);

  // I wanna work with tiles that have equal width and height-values,
  // That's why i calculate the the tiles on the vertical axis with the ratio
  float tilesY = ratio*tilesX;

  // Calculate the width of each tile
  float tileW = width / tilesX;

  // Calculate the height of each tile
  float tileH = height / tilesY;

  // Let's build the loop!

  // I always start with the y-axis, because 
  // i want to draw the grid line by line 
  // and not column by column

  for (int y = 0; y < img.height; y += tileH) {
    for (int x = 0; x < img.width; x += tileW) {

      // Get the color of this pixel
      color c = img.get(x, y);

      // Calculate the brightness-value of the pixel and 
      // map it to a range between 0 and 1
      float b = map(brightness(c), 0, 255, 1, 0);

      // Open a new matrix
      pushMatrix();

      // set the position
      translate(x, y);

      // Draw the tile
      rect(0, 0, b*tileW, b*tileH);

      // close matrix
      popMatrix();
    }
  }
}
