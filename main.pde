import java.util.Random;
import java.util.Arrays;

PImage img;    // puzzle image
Piece selectedPiece;  // currently selected piece

ArrayList<Piece> pieces = new ArrayList<Piece>();  // list of pieces
ArrayList<Piece> finalPieces = new ArrayList<Piece>();  // list of placed pieces

boolean drag = false;  // indicates piece being dragged
int dragCounter = 0;  // number of peices being dragged currently

int numOfRows = 3;  // number of rows
int numOfCols = 4;  // number of columns
int pieceSize = 200;  // size of single piece of the puzzle

int numOfPieces = numOfRows*numOfCols;  // total number of pieces

Grid grid = new Grid(numOfRows, numOfCols, pieceSize);  // add change rows, cols and piece size

String currentScreen = "start";  // current screen to be displayed

PImage[] images = new PImage[4]; // holds all images

void setup(){
  // runs at the start
  size(1400, 800);  // game window size 
  surface.setResizable(true);
  
  // loads images into images array
  images[0] = loadImage("images/car.jpg");
  images[1] = loadImage("images/mountain.jpg");
  images[2] = loadImage("images/hare.jpg");
  images[3] = loadImage("images/pyramid.jpg");
   
  // instantiates image buttons
  imgBtnOne = new ImageButton(images[0],25, 70, 400, 300);
  imgBtnTwo = new ImageButton(images[1],430, 70, 400, 300);
  imgBtnThree = new ImageButton(images[2],25, 375, 400, 300);
  imgBtnFour = new ImageButton(images[3],430, 375, 400, 300);
}

void draw(){
  // runs every frame
   background(212, 212, 212);
   
 switch(currentScreen){
   case "game":
     gameScreen();
     break;
   case "win":
     winScreen();
     break;
    case "start":
      startScreen();
      break;
    case "select":
      selectScreen();
      break;
    case "help":
     helpScreen();
     break;
   } 
}
