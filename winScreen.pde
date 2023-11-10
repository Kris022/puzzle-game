Button continueBtn = new Button(width/2-150, 670, "Continue");

void winScreen(){
  image(img, width/2-img.width/2, 0);  // display the completed image
  
  if(continueBtn.isPressed()){
    resetBoard();  // rests the board
    currentScreen="start";  // sets the current screen to start screen
  }
  
  continueBtn.display(width/2-150, 670); // displays the button
}
