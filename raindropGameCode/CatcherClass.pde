class Catcher {  //initializing class
  int diam;  //declaring variables
  PVector loc;
  PImage Pi;

  Catcher(int tDiam) {  //creates constructor that has an input of the diameter of the circle
    diam = tDiam;  //the diameter declared in the class above is equal to that of the input
    loc = new PVector(mouseX, mouseY);  //the catcher is initally at a random location
    Pi = loadImage("PiCircle.png");  //retrieving image file from the data folder
  }

  void display() {  //method called display that, well, displays the catcher
    Pi.resize(100,100);  //scales the image down to the size of the catcher
    image(Pi, mouseX - diam/2, mouseY - diam/2);  //displays the image at the location of the mouse as its center
  }
}