class Button{
  int x, y;  // x and y position of the button
  int w = 300;  // width of the button
  int h = 100;  // width of the button
  String buttonText;  // text to display on the button
  color c = color(130, 217, 175);  // fill colour of the button
  color textColor = color(0);  // text fill colour
  boolean pressedAlready=false; // inidicates if button is already pressed
                                // so that the button can only be pressed once per frame
  
  Button(int x, int y, String buttonText){
    this.x = x;
    this.y = y;
    this.buttonText = buttonText;
  }
  
  void display(int newx, int newy){
    this.x = newx;
    this.y = newy;
    fill(c);  // sets fill colour
    rect(this.x, this.y, this.w, this.h);  // draws a rectangle
    
    textSize(40);  // sets text size
    fill(textColor);
    textColor = (0);  // resets text colour for when the mouse is not over button
    text(this.buttonText, this.x+this.w/2-(textWidth(this.buttonText)/2), this.y+60); // writes text on the button
  }
  
  // checks if button has been pressed
  boolean isPressed(){
    if (mouseX > this.x && mouseY > this.y && mouseX < this.x+this.w && mouseY < this.y+this.h){
      c = color(99, 166, 134);  // changes button colour if cursor hovers over button
      if(mousePressed == true){
        textColor = (255);  // changes text colour if the button has been pressed
        return true; // returns true if the button is pressed
      }
      else{
        textColor = (0); // changes text colour if mouse hovers over but does not press button
        return false; // returns false if the button is not pressed
      }
    }
    else{
      c = color(130, 217, 175); // changes button colour back to original if not pressed
      return false; // returns false if mouse does not hover over button
    }
  } 
  
}

class ImageButton{
  int x, y, w, h;
  PImage img;  // image to be displayed
  int alpha = 128;  // opacity of the button
  
  ImageButton(PImage img, int x, int y, int w, int h){
    this.x = x;  // x position 
    this.y = y;  // y position 
    this.w = w;  // width 
    this.h = h;  // height
    this.img = img;
    
  }
  
  void display(){
    tint(255, alpha);  // sets image button opacity 
    image(this.img, this.x, this.y, this.w, this.h);  // displays the image
  }
  
  boolean isPressed(){
    if (mouseX > this.x && mouseY > this.y && mouseX < this.x+this.w && mouseY < this.y+this.h){
      if(mousePressed == true){
        return true; // return true if mouse hovers over the button and is pressed
      }
      else{
        return false;  // return false if mouse is not pressed
      }
    }
    else{
      return false;  // return false if mouse is not hovering over the button 
    }
  } 
  
}
