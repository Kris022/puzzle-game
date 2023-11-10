public class Piece {
  // class attributes
  int x, y, originRow, originCol, w, h;
  PImage sprite;
  boolean isDragged;
  
  // constructor
  public Piece(int x, int y, int col, int row, PImage img, int size){
    this.x = x;
    this.y = y;
    this.w = size;  // width of the piece
    this.h = size;  // height of the piece
    this.originRow = row;  // stores piece row before it is shuffled
    this.originCol = col;  // stores piece column before it is shuffled
    this.sprite = img;  // part of the image
    this.isDragged = false;  // indicates whether the piece is being dragged
  }
  
  void display(){
    image(this.sprite, this.x, this.y);  // displays the piece
  }
  
  void move(int newX, int newY){
    if (newX+this.w >= width){
      newX = width-this.w;  // checks if piece is not being moved outside of screen bounds
    }
    if(newY+this.h >= height){
      newY = height-this.h;
    }
    if (newX < 0){
      newX = 0;
    }
    if (newY < 0){
      newY = 0;
    }
    
    // sets the piece position to the new position
    this.x = newX;
    this.y = newY;
  }
  
  boolean checkPiecePos(){
    // checks if piece has been placed in its original position
    if (this.x/this.w == this.originCol && this.y/this.h == originRow){
    return true;
  }
    return false;
  }
  
}
