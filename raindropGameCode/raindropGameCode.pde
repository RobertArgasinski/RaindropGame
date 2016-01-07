PVector mouse;  //initializes variables, including objects made using classes.  Check out the "CatcherClass" and "RaindropClass" tabs to find out more about their properties and methods
int score = 0;
int state = 1;
Catcher bucket;
ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();  //creates an ArrayList from the Raindrop class

void setup() {
  size(1200, 800);  //canvas size of 1200px x 800px
  mouse = new PVector();  //creates an empty PVector to be used to find the mouse's position
  bucket = new Catcher(100);  //creates a Catcher object called bucket with a diameter of 60
  raindrops.add(new Raindrop(random(width), 0));  //creates one raindrop to start out
}

void draw() {
  if (state == 1) {  //first screen to be displayed is the title screen
    background(0, 200, 255);  //beautiful (Skype-looking) blue background
    fill(255);  //white text
    textAlign(CENTER);  //centered text
    textSize(100);  //100px text
    text("RAINDROP GAME", width/2, height/2);  //Title of the game centered on the screen
    textSize(50);  //50px text
    text("PRESS ANY KEY", width/2, 700);  //instructs the player to press any key so that we can move onto the ACTUAL game.
    strokeWeight(4);  //4px lines
    stroke(255);  //white lines
    line(200, 450, 1000, 450);  //line
    backgroundBubbles();  //see function way, way, way below :)
  }
  if (state == 2) {  //finally, we're getting somewhere: the instructions!
    fill(255);  //white text
    background(0, 200, 255);  //same gorgeous background
    backgroundBubbles();  //same function that creates a nice border
    textSize(100);  //100px text
    text("CONTROLS", width/2, 300);  //heading for the screen; just in case you were wondering if indeed these were controls
    textSize(25);  //30px text
    text("Using your mouse, catch the right raindrops to get points. \nWhite raindrops are worth 1 point. \nGold raindrops are worth 20 points. \nRed raindrops deduct 10 points. \nBlack raindrops deduct ALL points. \nIf you let a raindrop fall, you lose a point.", width/2, 440);  //simple instructions on the objective of the game; notice the '\n' which starts following text on a new line
    textSize(50);  //50px text
    text("PRESS ANY KEY", width/2, 700);  //if think you have understood the mechanics of the game, please press any key
    line(300, 350, 900, 350);  //another stylistic line
    fill(255);  //white color
    stroke(0);  //black outline...
    strokeWeight(1);  //of 1px
    ellipse(300, 473, 20, 20);  //white raindrop
    fill(255, 215, 0);  //gold color
    ellipse(300, 508, 20, 20);  //gold raindrop
    fill(255, 0, 0);  //red color
    ellipse(300, 545, 20, 20);  //red raindrop
    fill(0, 0, 0);  //black color
    ellipse(300, 581, 20, 20);  //black raindrop
    fill(255);  //white color
    ellipse(900, 473, 20, 20);  //white raindrop
    fill(255, 215, 0);  //gold color
    ellipse(900, 508, 20, 20);  //gold raindrop
    fill(255, 0, 0);  //red color
    ellipse(900, 545, 20, 20);  //red raindrop
    fill(0, 0, 0);  //black color
    ellipse(900, 581, 20, 20);  //black raindrop
    score = 0;  //the reason why this is initialized twice is because if the player decides to play again (without refreshing game), we want them to start from zero
  }
  if (state == 3) {  //the RAINDROP game is upon us
    if (score <= -1) {  //this is checked at the start to prevent crashing
      state += 1;  //if so, redirect to Game Over screen
    }
    background(0, 200, 255);  //you have to love this background color!
    mouse.set(mouseX, mouseY);  //sets the mouse as the mouse's position (keep in mind, it's a vector)
    bucket.display();  //display the bucket (otherwise known as the pi symbol)
    fill(255);  //white text
    textSize(50);  //50px text
    textAlign(CENTER);  //centered text
    text(score, width/2, 200);  //display the score
    text("RAINDROP GAME", width/2, 100);  //just making sure you know that this is the Raindrop Game
    strokeWeight(4);  //4px line
    stroke(255);  //white line
    line(370, 110, 830, 110);  //line
    for (int i = raindrops.size()-1; i >= 0; i--) {  //for each object in the raindrops ArrayList... (starting from the back to prevent flickering)
      Raindrop r = raindrops.get(i);  //isolate the raindrop
      r.fall();  //make it fall
      r.display();  //display it
      if (r.isInContactWith(bucket)) {  //if the bucket is touching the raindrop...
        r.reset();  //spawn the same raindrop from the top
        score += r.points;  //score changes based on color (white, gold, red)
        if (raindrops.size() < 50) {  //limits the amount of raindrops on the screen to 50 to prevent crashing
          raindrops.add(new Raindrop(random(width), 0));
        }
      }
      if (r.loc.y > height + r.diam/2) {  //if the raindrop reaches the bottom of the screen...
        raindrops.remove(r);  //it is removed
        if (raindrops.size() < 50) {  //once again, if there is less than 50 raindrops...
          raindrops.add(new Raindrop(random(width), 0));  //add a random one
        }
        score -= 1;  //in the end, dropping a raindrop (no matter the color) is worth the same
      }
    }
  }
  if (state == 4) {  //Game Over screen
    resetArrayList();  //function defined below; gets rid of all stored entries in the ArrayList
    background(0, 200, 255);  //this background never gets old, does it?
    fill(255);  //white text
    textSize(100);  //100px text
    textAlign(CENTER);  //centered text
    text("GAME OVER", width/2, height/2);  //the infamous Game Over text smack dab in the center of your computer screen
    textSize(50);  //50px text
    text("PRESS ANY KEY TO PLAY AGAIN", width/2, 700);  //you'll never escape this game unless you close your window!  :D
    backgroundBubbles();  //once again, wonderful border
  }
}

void keyPressed() {  //this explains the 'press any key' mechanism; CAN WE FIGURE OUT HOW TO NOT BE ABLE TO SKIP DURING GAMEPLAY UNLESS YOU LOSE? ************
  state += 1;  //self-explanatory
  if (state == 5) {  //this is how the loop functions: if you reach a 5th state (non-existent), you are redirected to the title screen
    state = 1;  //title screen
    raindrops.add(new Raindrop(random(width), 0));  //starts out the game with a single raindrop (since this is normally created in void setup())
  }
}

void backgroundBubbles() {  //beautiful detailed background
  noStroke();  //by not having a stroke, it is clear to see which balls are meant to be caught
  ellipse(20, 20, 10, 10);  //ellipse #1
  ellipse(1180, 20, 10, 10);  //ellipse #2
  ellipse(1180, 780, 10, 10);  //ellipse #3
  ellipse(20, 780, 10, 10);  //ellipse #4
  ellipse(30, 40, 20, 20);  //ellipse #5
  ellipse(1170, 40, 20, 20);  //ellipse #6
  ellipse(1170, 760, 20, 20);  //ellipse #7
  ellipse(30, 760, 20, 20);  //ellipse #8
  ellipse(60, 60, 30, 30);  //ellipse #9
  ellipse(1140, 60, 30, 30);  //ellipse #10
  ellipse(1140, 740, 30, 30);  //ellipse #11
  ellipse(60, 740, 30, 30);  //ellipse #12
  strokeWeight(4);  //4px line
  stroke(255);  //white line
  line(100, 10, 1100, 10);  //line #1
  line(100, 790, 1100, 790);  //line #2
  line(10, 100, 10, 700);  //line #3
  line(1190, 100, 1190, 700);  //line #4
}

void resetArrayList() {  //function used during Game Over screen
  for (int i = raindrops.size()-1; i >= 0; i--) {  //deletes all arrays starting from the end working back to zero
    raindrops.remove(i);
  }
}