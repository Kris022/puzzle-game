Button startBtn = new Button(width/2-200, 200, "New Puzzle");
Button helpBtn = new Button(width/2-200, 350, "Help");
Button quitBtn = new Button(width/2-200, 500, "Quit");
String title = "Digital Puzzles"; // title text

void startScreen(){
  textSize(60);  // sets font size to 60
  fill(0);  // sets title colour to black
  text(title, (width/2)-textWidth(title)/2, height-(height-120));  // displays title text
  
  // checks for buttons being pressed
  if (startBtn.isPressed() == true){
    currentScreen = "select";  // changes current screen
  }
  if(helpBtn.isPressed() == true){
    currentScreen = "help";
  }
  if(quitBtn.isPressed() == true){
    exit();  // quits the program
  }
  
  // display buttons
  startBtn.display(width/2-startBtn.w/2, 200);
  helpBtn.display(width/2-helpBtn.w/2, 350);
  quitBtn.display(width/2-quitBtn.w/2, 500);
}
