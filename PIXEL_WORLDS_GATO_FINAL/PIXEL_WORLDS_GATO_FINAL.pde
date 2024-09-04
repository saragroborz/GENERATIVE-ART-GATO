/*---------------------------------
 Name: Albert Planas i Torrella a.k.a Gato
 Date: Sept 2024
 Tittle:  PIXEL WORLDS
 
 Description:
 This Art Piece is intended to be a live canvas of PixelArt. 
 Everytime it generates a new composition based on different
 factors such as the size of the pixels, velocities, direction
 and line lenghts. 
 See for yourself the compositions not expected, color harmonies
 and decipher the pattern. Hope you like it. 
 
 -----------------------------------*/


int gridSize = int(random(1,20));  // Size of the grid cells
int cols, rows;
color[] colors;
FloatList changeRate; // To change afterwards vertical lines or horitzontal
float z;



void setup() {
  size(800, 400);
  noStroke();
  
  // Initialize grid
  cols = width / gridSize;
  rows = height / gridSize;
  
  // Color Palette Array
  colors = new color[]{
    color(200, 200, 21),  // KINDA YELLOW
    color(184, 242, 108),   // SOFT YELLOW/GREEN
    color(6, 150, 248),  // SATURATED BLUE 2G
    color(14, 145, 170),    // TURQUOISE BLUE MID
    color(12, 76, 28),     // DARK OLIVE GREEN
    color(3, 242, 150),    // SATURATED GREEN TURQUOISE
    color(7, 108, 242),    // SATURATED BLUE
    color(33, 250, 103),   // SUPER SATURATED GREEN
    color(86, 120, 244),   // LIGHT BLUE
    color(0, 19, 16),      // KIND OF BLACK
    color(68, 250, 56),     // FOSFORESCENT GREEN
    
    color(228, 242, 221, 30),   // ALPHA TRANSPARENCY LIGHT
    color(16, 225, 255, 15),   // ALPHA TRANSPARENCY LIGHT 2
  };
  
  // List of possible rates of chance vertical or horitzontal
  changeRate = new FloatList(); 
  changeRate.append(0.0);
  changeRate.append(0.1);
  changeRate.append(0.5);
  changeRate.append(0.9);
  changeRate.append(1.5);
  
  // Declaring a Random value for Z
  z = changeRate.get(int(random(0,5)));
    
  
  // Draw the initial 1 square grid bg
    drawInitGrid();
    
  // Art Piece Info
  print("The Grid is " + gridSize + " . ");
  print("The probability of vertical (0.0) or Horitzontal (1) is " + z + " . ");
  print("Enjoy the piece ! . =^_^= ");
}

void draw() {
  // Draw patterns every Xframes
  if (frameCount % 1 == 0) {
    drawRandomLine();
          }
      if (frameCount % int(random(1,5)) == 0) {
        drawRandomSquare();
      }   
        if (frameCount % int(random(1,8)) == 0) {
        drawRandomSquareLittle();
      }  
      if (frameCount % 24 == 0) {
        drawFrame();
      }   
    }



// Function to draw the initial grid, random colors/squares
void drawInitGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      fill(colors[int(random(colors.length))]);
      rect(i * gridSize, j * gridSize, gridSize, gridSize);
    }
  }
}

// Drawing a Line, with random lenght and random orientation (vertical/horitzontal)
void drawRandomLine() {
  // Choose a random color from the palette
  color c = colors[int(random(colors.length))];
  fill(c);
  
  // Randomly decide if the line is horizontal or vertical (float probability)
    
    boolean isHorizontal = random(1) < z;
  
  if (isHorizontal) {
    // Draw a horizontal line
    int y = int(random(rows)); // Random row
    int startX = int(random(cols)); // Random start column
    int length = int(random(1, cols)); // Random length for the line
    // Drawing the Line by filling each individual Grid Square
    for (int i = startX; i < min(startX + length, cols); i++) {
      rect(i * gridSize, y * gridSize, gridSize, gridSize);
    }
  } else {
    // Draw a vertical line
    int x = int(random(cols)); // Random column
    int startY = int(random(rows)); // Random start row
    int length = int(random(3, rows)); // Random length for the line
    
    for (int j = startY; j < min(startY + length, rows); j++) {
      rect(x * gridSize, j * gridSize, gridSize, gridSize);
    }
  }
}

// RANDOM SQUARES
void drawRandomSquare() {
    color c = colors[int(random(colors.length))];
  fill(c);
  
  // Random position for the top-left corner
  int x = int(random(cols));
  int y = int(random(rows));
  
  // Random width and height for the rectangle (can be 1 grid cell or larger)
  int w = int(random(1, 5)); // Random width in grid units
  int h = int(random(1, 5)); // Random height in grid units

  // Draw the rectangle fill
  rect(x * gridSize, y * gridSize, w * gridSize * 2, h * gridSize * 2);
}

// RANDOM LITTLE SQUARES
void drawRandomSquareLittle() {
    color c = colors[int(random(colors.length))];
  fill(c);
  
  // Random position for the top-left corner
  int x = int(random(cols));
  int y = int(random(rows));
  
  // Random width and height for the rectangle (can be 1 grid cell or larger)
  int w = int(random(1, 10)); // Random width in grid units
  int h = int(random(1, 10)); // Random height in grid units

  // Draw the rectangle fill
  rect(x * gridSize, y * gridSize, w * gridSize/4, h * gridSize/4);
}


// FRAME
void drawFrame() {
  
  // Selecting colour
  color FrameColour = colors[int(random(colors.length))];
  fill(FrameColour);
  
  // Top edge
  for (int i = 0; i < cols; i++) {
        rect(i * gridSize, 0, gridSize, gridSize);
  }
  
  // Bottom edge
  for (int i = 0; i < (cols + 2) ; i++) {
       rect(i * gridSize, (height - gridSize) , gridSize, gridSize);
  }
  
  // Left edge
  for (int j = 0; j < rows; j++) {
        rect(0, j * gridSize, gridSize, gridSize);
  }
  
  // Right edge
  for (int j = 0; j < (rows + 2 ); j++) {
       rect((width - gridSize), j * gridSize, gridSize, gridSize);
  }
}
