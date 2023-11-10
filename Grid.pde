class Grid{
  int rowNum, colNum, tileSize;
  int x, y;
  
  Grid(int rowNum, int colNum, int tileSize){
    this.rowNum = rowNum;  // number of rows
    this.colNum = colNum;  // number of columns
    this.tileSize = tileSize;  // size of single square
  }
  
  void display(){
    // displays the grid
    for (int row=0; row < this.rowNum; row++){
      for (int col=0; col < this.colNum; col++){
        rect(col*this.tileSize, row*this.tileSize, this.tileSize, this.tileSize);
      }
    }
  }
  
  void setGrid(int rows, int cols, int newSize){
    // changes grid parameters
    this.rowNum = rows;
    this.colNum = cols;
    this.tileSize = newSize;
  }
  
  int getMouseRow(){
    // returns the row mouse cursor is hovering over 
    int r=-1;  // returns -1 if cursor is outside the grid rows
    if (mouseY > 0 & mouseY < this.rowNum*this.tileSize){  // check if mouse is within available rows
      r = mouseY / this.tileSize;  // calculates row cursor is over
    }
    return r;
  }
  
  int getMouseCol(){
    // returns the column mouse cursor is hovering over 
    int c = -1; // returns -1 if cursor is outside the grid columns
     if (mouseX > this.colNum & mouseX < this.colNum*this.tileSize){  // check if mouse if wihtin available columns
      c = mouseX / this.tileSize;
     }
     return c;
  }
  
}
