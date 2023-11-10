void helpScreen(){
  textSize(60);
  fill(0);
  text("Help", (width/2)-textWidth("Help")/2, 100);
  textSize(25);
  text("1. Press select new puzzle button to start a new puzzle.", 50, 150);
  text("2. Choose one of the images on the select screen, the currently selected image will be highlighted.", 50, 200);
  text("3. Choose one of the puzzle sizes on the select screen, for example 3x4.", 50, 250);
  text("4. Press continue button on the select screen to begin the puzzle.", 50, 300);
  text("5. Select one of the pieces on the screen by hovering over the piece and holding a mouse button.", 50, 350);
  text("6. While holding the mouse button move the piece across the screen onto one of the", 50, 400);
  text("   squares of the grid to the left of the screen.", 50, 450);
  text("7. Release the held mouse button to place the piece.", 50, 500);
  text("8. If you are stuck and need help press REFERENCE button to bring up the original image.", 50, 550);
  text("9. Alternatively, if you need further help press the HINT button,", 50, 600);
  text("   and one of the pieces Will be automatically placed in the right position for you.", 50, 650); 
  
  if(continueBtn.isPressed()){
    currentScreen="start";
  }
  continueBtn.display(width/2-150, height-(height-680) );
  
}
