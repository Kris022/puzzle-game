Button refBtn = new Button(400, 650, "Reference");

Button hintBtn = new Button(50, 650, "Hint");

void gameScreen(){
  selectPiece();  // check for piece selection
  displayPieces();  // displayes pieces
  noFill();  // makes the grid transparent
  grid.display();  // displays the grid
  
  if (refBtn.isPressed() == true){
    image(img, 0, 0);
  }
  
  if (hintBtn.isPressed() == true && hintBtn.pressedAlready == false){
    hintBtn.pressedAlready = true;
    getHint();
  }
  else if (!hintBtn.isPressed()){
    hintBtn.pressedAlready=false;
  }
  
  refBtn.display(400, 650);  // displays the reference button
  hintBtn.display(50, 650); // displays the hint button
}
