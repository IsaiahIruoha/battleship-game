
void keyPressed () { //if space is pressed

  if (keyCode == ' ') {
    if (state == 1) {
      placeEnemyShips(3); //places enemy ships using the function
      state = 2;
    }
  }
  if (keyCode == 9) { //tab is pressed
    tab = true;
  }
}

void keyReleased () { 

  if (keyCode == 9) { //tab is released
    tab = false;
  }
}
