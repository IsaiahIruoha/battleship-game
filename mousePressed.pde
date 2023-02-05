
void mousePressed () { //if mouse pressed then do the following

  int gridx = int(mouseX/50); //find the grid square
  int gridy = int(mouseY/50);

  if (state == 0) { //places enemy ships until 3
    if (playerShips < 3) {
      if (grid[gridx][gridy] == 0) {
        if (grid[gridx][gridy] != 3) {
          grid[gridx][gridy] = 3;
          playerShips++;
        }
      }
    } else {
      state = 1;
    }
  }

  if (state == 2) { //allows the player to choose squares to explode
    if (grid[gridx][gridy] == 0) {
      grid[gridx][gridy] = 1;
      state = 3;
      if (state == 3) { //enemy shoots immediately after
        shootRandomely();
        state = 2;
      }
    }

    if (grid[gridx][gridy] == 2) { //enemy ship has been hit
      scoreAI--;
      grid[gridx][gridy] = 4;
      state = 3;
      if (state == 3) { //enemy shoots randomely
        shootRandomely();
        state = 2;
      }
    }
  }
  if (state == 5) {
    if (retry1.clicking()) { //retry button (win screen)
      reset();
    }
  }
  if (state == 4) {
    if (retry1.clicking()) {  //retry button (lose screen)
      reset();
    }
  }
  if (state == 6) {
    if (start.clicking()) {  //start button (start screen)
      state = 0;
    }
    if (exit.clicking()) {  //exit button (start screen)
      exit();
    }
  }
}
