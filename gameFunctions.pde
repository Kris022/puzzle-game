int xOffset, yOffset;

// Mouse actions
boolean mouseOver(int objx, int objy, int w, int h){
  // checks if mouse is over specifed piece object
  if (mouseX >= objx && mouseX <= objx+w){
    if (mouseY >= objy && mouseY <= objy+h){
      return true;
    }
  }
  return false; 
}

void mousePressed(){
  for (int i = pieces.size()-1; i >= 0; i--) {
    selectedPiece = pieces.get(i);  // current piece in the array
    if (mouseOver(selectedPiece.x, selectedPiece.y, selectedPiece.w, selectedPiece.h)){ // checks if mouse hovers over the piece
        if (dragCounter < 1){  // checks if a piece is not dragged already
          selectedPiece.isDragged = true;  // marks the current piece as being dragged
          dragCounter++;  // increments the drag counter
          
          xOffset = pieces.get(i).x - mouseX;  // get x offset
          yOffset = pieces.get(i).y - mouseY;  // get y offset
         
          pieces.remove(i);
          pieces.add(selectedPiece);  // moves the piece to the top of the array
        }
          drag = true;
      }
    }
}

void mouseReleased(){
  drag=false;
  for (int i = 0; i < pieces.size(); i++) {
    selectedPiece = pieces.get(i);
    
    if(selectedPiece.isDragged == true){
      placePiece(selectedPiece);
      selectedPiece.isDragged=false;
      }
      
    dragCounter = 0;
  }
}

// Piece handling
void selectPiece(){
  if (drag==true){
    for (int i=0; i < pieces.size(); i++){
      selectedPiece = pieces.get(i);
      if(selectedPiece.isDragged == true){
      selectedPiece.move(mouseX+xOffset, mouseY+yOffset); // moves the piece with the mouse
    }
  }}
}

void splitImage(){
  // splits the provided image into puzzle pices
  for (int row=0; row < numOfRows; row++){
    for (int col=0; col < numOfCols; col++){
      pieces.add(new Piece(col*pieceSize, row*pieceSize, 
      col, row, 
      img.get(col*pieceSize, row*pieceSize, pieceSize, pieceSize), 
      pieceSize));
    }
  }
}

void displayPieces(){
  // displays placed pieces 
  for (int i=0; i < finalPieces.size(); i++){
      if(!finalPieces.isEmpty()){
      finalPieces.get(i).display();}    
    }
  // displays each puzzle piece on the screen
  for (int i=0; i < pieces.size(); i++){
      pieces.get(i).display();      
    }
   
}

void shufflePieces(){
  // shuffles the puzzle pieces
  for (int i=0; i < pieces.size(); i++){
    int randomX = int(random(850, width-pieceSize-10)); // random x position
    int randomY = int(random(50, height-pieceSize-10)); // random y position
    pieces.get(i).move(randomX, randomY);  // moves piece to a random position 
  }
}

void placePiece(Piece p){
  // places a piece on the grid
  int r = grid.getMouseRow();  // current mouse row
  int c = grid.getMouseCol();  // current mouse column
  
  if (r != -1 & c != -1){  // checks if mouse is within the grid
    p.move(c*grid.tileSize, r*grid.tileSize);  // if so current piece is moved there
  }
  
  // Find index of the object p
  for (int i=0; i < pieces.size(); i++){
    if(pieces.get(i).checkPiecePos() && grid.getMouseRow() != -1 && grid.getMouseCol() != -1){
     finalPieces.add(pieces.get(i)); 
     pieces.remove(i);
    }
  }
  
  checkWin();
}

void checkWin(){
  if (finalPieces.size() == numOfPieces){  // checks if all pieces have been placed
    currentScreen = "win";  // switches screen to win screen 
  }
}

void getHint(){
  // automatically moves a piece into its correct position
  if(pieces.size() != 0){
    int pieceIndex = int(random(0, pieces.size()-1)); // get random piece index
    Piece randomPiece = pieces.get(pieceIndex); // get random piece
    randomPiece.move(randomPiece.originCol*grid.tileSize, randomPiece.originRow*grid.tileSize);// place piece in correct position
    finalPieces.add(randomPiece);// place piece on the grid
    pieces.remove(pieceIndex); // mark piece as placed correctly
  }
  checkWin();
}

void resetBoard(){
  println(finalPieces);
  // resets the board for new image
  if(!pieces.isEmpty()){
   for (int i=pieces.size()-1; i >= 0; i--){
     pieces.remove(i);  // removes pieces from the array list
     }
    }
    
   if(!finalPieces.isEmpty()){
   for (int i=finalPieces.size()-1; i >= 0; i--){
     finalPieces.remove(i); // removes pieces from the array list
     }
    }
    println(finalPieces);
}
