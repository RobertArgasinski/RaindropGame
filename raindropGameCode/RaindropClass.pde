class Raindrop {  //initialize class
  PVector loc;  //declare variables
  PVector vel;
  PVector acc;
  float diam;
  float r;
  float g;
  float b;
  int points;

  Raindrop(float x, float y) {  //create constructor
    loc = new PVector(x, y);  //turns input location into a vector
    vel = new PVector(0, 3);  //creates a velocity vector
    acc = new PVector(0, 0.01);  //creates an acceleration vector
    diam = 20;  //all raindrops have a diameter of 20
    if (isGold()) {  //if the raindrop "isGold" (defined below), it's gold and if you catch it, then +20
      r = 255;
      g = 215;
      b = 0;
      points = 20;
    } else if (isRed()) {  //if the raindrop "isRed" (defined below), it's red and if you catch it, then -10
      r = 255;
      g = 0;
      b = 0;
      points = -10;
    } else if (isBlack()) {
      r = 0;
      g = 0;
      b = 0;
      points = -score;
    } else {  //else, it's white and if you catch it, then +1
      r = 255;
      g = 255;
      b = 255;
      points = 1;
    }
  }

  void fall() {  //function dealing with the movement of the raindrop
    loc.add(vel);  //velocity is added to location and ...
    vel.add(acc);  //acceleration is added to velocity
  }

  void display() {  //function dealing with displaying the raindrop (pretty important :D)
    stroke(0);  //black border
    strokeWeight(1);  //default line weight
    fill(r, g, b);  //values for r, g, and b are determined above in the constructor
    ellipse(loc.x, loc.y, diam, diam);  //finally, we can create the raindrop
  }

  void reset() {  //function dealing with bringing a raindrop back to the top
    loc = new PVector(random(width), 0);  //resets location
    vel = new PVector(0, 3);  //resets velocity
    acc = new PVector(0, 0.01);  //resets acceleration
  }

  boolean isInContactWith(Catcher c) {  //boolean which checks to see if you caught a raindrop
    if (loc.dist(mouse) < diam/2 + c.diam/2) {  //two circles are touching if the distance between them is less that their combined radii
      return true;
    } else {
      return false;
    }
  }
  boolean isGold() {  //probability boolean to create gold raindrops
    float number = random(100);  //from numbers 0-100...
    number = round(number);  //round the number (we don't want any floats!)
    if (number == 5 || number == 1 || number == 10) {  //basically 3% chance of getting gold (unless previously caught a gold raindrop...)
      return true;
    } else {
      return false;
    }
  }

  boolean isRed() {  //probability boolean to create red raindrops
    float number = random(100);  //from numbers 0-100...
    number = round(number);  //round the number (once again)
    if (number == 2 || number == 4) {  //basically 2% chance of getting red (unless previously caught a red raindrop...)
      return true;
    } else {
      return false;
    }
  }

  boolean isBlack() {
    float number = random(100);  //from numbers 0-100...
    number = round(number);  //round the number (once again)
    if (number == 3) {  //basically 1% chance of getting black
      return true;
    } else {
      return false;
    }
  }
}