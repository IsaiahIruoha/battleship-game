//variables are declared
int [][] grid = new int[10][10]; //2D array created for grid
int screenWidth; //screen width
int screenHeight; //screen height
int state; //screen system
int playerShips; //amount of player ships spawned
int scorePlayer; //the players score
int scoreAI; //the AI's score
boolean tab; //allows tab pressed to be true or false
Button retry1, retry2; //button class for retry on win and lose screen
Button start, exit; //button class for start and exit
PImage backy; //background image for start screen
PImage gridBack; //grid background image
PImage ship; //ship image
PImage boom; //explosion image
PImage cursor; //cursor image for when targetting
PImage blownup; //blown up ship image

void setup () { //everything is run once
  //declared variables are assigned values if neccessary
  size(500, 500); //screen function for screen size
  state = 6;
  screenWidth = 0;
  screenHeight = 0;
  scorePlayer = 3;
  scoreAI = 3;
  tab = false;
  retry1 = new Button(width/2 - 100/2, 300, 100, 48, 20, "Retry");
  retry2 = new Button(width/2 - 100/2, 300, 100, 48, 20, "Retry");
  start = new Button(width/2 - 400/2, 10, 400, 36, 20, "Start");
  exit = new Button(width/2 - 400/2, 55, 400, 36, 20, "Exit");
  backy = loadImage("background.png");
  gridBack = loadImage("backgrid.jpg");
  ship = loadImage("battleship.png");
  boom = loadImage("boom.png");
  cursor = loadImage("cursor.png");
  blownup = loadImage("blownship.png");
}

void draw () { //run in a cycle

  if (state == 0) { //screen 1
    background(gridBack); //sets the grid background
    cursor(HAND); //sets the cursor image to hand
  }
  if (state == 1) { //screen 2
    background(gridBack);
    cursor(HAND);
  }
  if (state == 2) { //screen 3
    background(gridBack);
    cursor(cursor); //sets the cursor image to cursor image in the sketch folder
  }
  if (state == 3) { //screen 4
    background(gridBack);
    cursor(cursor);
  }

  for (int r = 0; r < 10; r++) { //for loop sets different modes for each square, depending on the number it will change the appearance
    for (int c = 0; c < 10; c++) {
      if (grid[c][r] == 0) { //ocean 
        fill(0, 0, 255, 0);
        rect(c * width/10, r * height/10, width/10, height/10);
      } else if (grid[c][r] == 1) { //blown spot
        fill(0, 0);
        rect(c * width/10, r * height/10, width/10, height/10);
        image(boom, c * 50 + 2, r * 50, 50, 50);
      } else if (grid[c][r] == 2) { //enemy spot
        fill(0, 0);
        rect(c * width/10, r * height/10, width/10, height/10);
      } else if (grid[c][r] == 3) { //player ship
        fill(0, 0);
        rect(c * width/10, r * height/10, width/10, height/10);
        image(ship, c * 50 + 2, r * 50, 50, 50);
      } else if (grid[c][r] == 4) { //blownup enemy shi[
        fill(0, 0);
        rect(c * width/10, r * height/10, width/10, height/10);
        image(blownup, c * 50 + 2, r * 50, 50, 50);
      }
    }
    textSize(25);
    fill(255);
    text(floor((mouseX)/50) + " " + floor((mouseY)/50), mouseX + 15, mouseY - 15 ); //prints the grid value the mouse is on
  }

  if (scorePlayer == 0) state = 5;
  if (scoreAI == 0) state = 4;

  if (state == 4) {//win screen
    cursor(HAND);
    background(0, 255, 0); //background
    fill(0, 180);
    rect(width/2 - 333/2, 91, 333, 307, 12); //rectangle
    fill(255);
    textSize(50);
    text("Game Over", width/2 - textWidth("Game Over")/2, 210); //game over text
    retry2.sketch(); //retry class
  }

  if (state == 5) {//lose screen
    background(255, 0, 0); //background
    cursor(HAND);
    fill(255, 180);
    rect(width/2 - 333/2, 91, 333, 307, 12); //rectangle
    fill(0);
    textSize(50);
    text("Game Over", width/2 - textWidth("Game Over")/2, 210); //game over text
    retry1.sketch(); //retry class
  }

  if (state == 6) {//start screen
    background(backy);
    start.sketch(); //start class
    exit.sketch(); //exit class
  }

  if (keyPressed) {
    if (tab == true) { //if tab is pressed the following will take place
      fill(0, 180);
      rect(50, 50, 404, 150, 12);
      fill(255);
      text("Player Ships Left" + "              " + scorePlayer, 100, 100);
      text("Enemy Ships Left" + "              " + scoreAI, 100, 150);
    }
  }
  if (state == 0)  text("'Press Tab To See Game Scores'", width/2 - textWidth("'Press Tab To See Game Scores'")/2, 480); //instructions to show tab
}


void placeEnemyShips(int n) { //function to place enemy ships
  int enemyShips = 0;
  int c = 0;
  int r = 0;

  while (enemyShips < n) {
    c = floor(random(10));
    r = floor(random(10));
    if (grid[c][r] != 3 && grid[c][r] != 2 && grid[c][r] != 4) {
      grid[c][r] = 2;
      enemyShips++;
    }
  }
}

void shootRandomely() { //function= for the AI to shoot randomely
  int c = 0;
  int r = 0;
  c = floor(random(10));
  r = floor(random(10));
  while (grid[c][r] == 2 || grid[c][r] == 1 || grid[c][r] == 4) {
    c = floor(random(10));
    r = floor(random(10));
  }
  if (grid[c][r] == 3) {
    scorePlayer--;
  }
  if (grid[c][r] != 2 || grid[c][r] != 1) {
    grid[c][r] = 1;
  }
}

void reset() { //function to reset the program

  state = 0;
  screenWidth = 0;
  screenHeight = 0;
  scorePlayer = 3;
  scoreAI = 3;
  tab = false;
  for (int r = 0; r < 10; r++) {
    for (int c = 0; c < 10; c++) {
      grid[c][r] = 0;
    }
  }
  playerShips = 0;
}
