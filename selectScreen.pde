ImageButton imgBtnOne;
ImageButton imgBtnTwo;
ImageButton imgBtnThree;
ImageButton imgBtnFour;

Button selectBtn = new Button(1000, 650, "Continue");

Button pieceBtnOne = new Button(1000, 200, "3x4");
Button pieceBtnTwo = new Button(1000, 300, "6x8");
Button pieceBtnThree = new Button(1000, 400, "12x16");

Boolean warn = false;

void selectScreen(){
  if (imgBtnOne.isPressed()){
    img = images[0];  // sets the puzzle image
    imgBtnOne.alpha = 255;  // makes the image opaque 
    imgBtnTwo.alpha = 255/2;  // sets transparency for the image
    imgBtnThree.alpha = 255/2;
    imgBtnFour.alpha = 255/2;
  }
  if (imgBtnTwo.isPressed()){
    img = images[1];
    imgBtnTwo.alpha = 255;
    imgBtnOne.alpha = 255/2;
    imgBtnThree.alpha = 255/2;
    imgBtnFour.alpha = 255/2;
  }
  if (imgBtnThree.isPressed()){
    img = images[2];
    imgBtnTwo.alpha = 255/2;
    imgBtnOne.alpha = 255/2;
    imgBtnThree.alpha = 255;
    imgBtnFour.alpha = 255/2;
  }
  if (imgBtnFour.isPressed()){
    img = images[3];
    imgBtnTwo.alpha = 255/2;
    imgBtnOne.alpha = 255/2;
    imgBtnThree.alpha = 255/2;
    imgBtnFour.alpha = 255;
  }
  
  fill(255);
  imgBtnOne.display();
  imgBtnTwo.display();
  imgBtnThree.display();
  imgBtnFour.display();
  
  textSize(40);
  fill(0);
  text("Choose number\nof pieces:", 1000, 50);
  
  textSize(40);
  fill(0);
  text("Choose a picture:", 50, 50);
  
  if(pieceBtnOne.isPressed()){
    numOfRows = 3;
    numOfCols = 4;
    pieceSize = 200;
  }
  
  if(pieceBtnTwo.isPressed()){
    numOfRows = 6;
    numOfCols = 8;
    pieceSize = 100;
  }
  
  if(pieceBtnThree.isPressed()){
    numOfRows = 12;
    numOfCols = 16;
    pieceSize = 50;
  }
  
  selectBtn.display(1000, 500);
  pieceBtnOne.display(1000, 150);
  pieceBtnTwo.display(1000, 250);
  pieceBtnThree.display(1000, 350);
  
  if(selectBtn.isPressed() && img != null){
    numOfPieces = numOfRows*numOfCols;  // sets number of pieces
    grid.setGrid(numOfRows, numOfCols, pieceSize);  // updates the grid parameters
    tint(255, 255);  // remove transparency from the image
    img.resize(800, 600); // rescale image to match the ui

    splitImage();  // splits image into puzzle pieces
    shufflePieces();  // shuffles the pieces
    currentScreen = "game";
    warn = false;
  }
  else if(selectBtn.isPressed() && img == null){warn = true;}
  if(warn){
    textSize(25);
    fill(150, 0, 0);
    text("You need to select an image first!", 910, 650);
    text("Select an image by clicking on one\nof the images (to the left of the screen).\nSelcted image will be highlighted.", 910, 690);
  }
  
}
