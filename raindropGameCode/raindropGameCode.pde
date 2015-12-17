PVector mouse;   
Raindrop /*[]*/ r;      
int score = 0;
int count = 5;
int state = 1;
Catcher bucket;

void setup() {
  size(1200, 800);
  mouse = new PVector();
  /*for (int i = 0; i < count; i++) {*/
  r/*[i]*/ = new Raindrop(random(width), 0);
  /*}*/
  bucket = new Catcher(60);
}

void draw() {
  if (state == 1) {
    background(0, 200, 255);
    fill(255);
    textAlign(CENTER);
    textSize(100);
    text("RAINDROP GAME", width/2, height/2);
    textSize(50);
    text("PRESS SPACE", width/2, 700);
    strokeWeight(4);
    stroke(255);
    line(200, 450, 1000, 450);
    backgroundBubbles();
  }
  if (state == 2) {
    background(0, 200, 255);
    textSize(100);
    text("CONTROLS", width/2, 300);
    textSize(50);
    text("Catch the raindrops to get points. \nIf you let a raindrop fall, you lose a point.", width/2, 450);
    text("PRESS SPACE", width/2, 700);
    line(300, 350, 900, 350);
    backgroundBubbles();
  }
  if (state == 3) {
    mouse.set(mouseX, mouseY);           
    background(0, 200, 255);
    bucket.display();
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text(score, width/2, 300);
    text("RAINDROP GAME", width/2, 100);
    strokeWeight(4);
    stroke(255);
    line(370, 110, 830, 110);
    /*for (int i = 0; i < count; i++) {*/
    r/*[i]*/.fall();         
    r/*[i]*/.display();
    if (r/*[i]*/.isInContactWith(bucket)) {      
      r/*[i]*/.reset();                         
      score += 1;
    }
    if (r/*[i]*/.loc.y > height + r/*[i]*/.diam/2) {     
      r/*[i]*/.reset();              
      score -= 1;
    }
    /*}*/
  }
}

void keyPressed() {
  state += 1;
  if (state == 4) {
    state = 3;
  }
}

void backgroundBubbles() {
  ellipse(20, 20, 10, 10);
  ellipse(1180, 20, 10, 10);
  ellipse(1180, 780, 10, 10);
  ellipse(20, 780, 10, 10);
  ellipse(30, 40, 20, 20);
  ellipse(1170, 40, 20, 20);
  ellipse(1170, 760, 20, 20);
  ellipse(30, 760, 20, 20);
  ellipse(60, 60, 30, 30);
  ellipse(1140, 60, 30, 30);
  ellipse(1140, 740, 30, 30);
  ellipse(60, 740, 30, 30);
  strokeWeight(4);
  stroke(255);
  line(100, 10, 1100, 10);
  line(100, 790, 1100, 790);
  line(10, 100, 10, 700);
  line(1190, 100, 1190, 700);
}