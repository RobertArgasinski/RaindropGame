PVector mouse;   
Raindrop /*[]*/ r;      
int score = 0;
int count = 5;
int state = 1;

void setup() {
  size(1200, 800);
  mouse = new PVector();
  /*for (int i = 0; i < count; i++) {*/
  r/*[i]*/ = new Raindrop(random(width), 0);
  /*}*/
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
  }
  if (state == 2) {
    background(0, 200, 255);
    textSize(100);
    text("CONTROLS", width/2, 300);
    textSize(50);
    text("Catch the raindrops to get points. \nIf you let a raindrop fall, you lose a point.", width/2, 450);
    text("PRESS SPACE", width/2, 700);
    strokeWeight(4);
    stroke(255);
    line(300, 350, 900, 350);
  }
  if (state == 3) {
    mouse.set(mouseX, mouseY);           
    background(0, 200, 255);
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
    if (r/*[i]*/.isInContactWith(mouse)) {      
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

void keyPressed(){
  state += 1;
  if(state == 4){
    state = 3;
  }
}