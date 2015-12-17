PVector mouse;   
Raindrop r;      
int score = 0;
int count = 5;

void setup() {
  size(1200, 800);
  mouse = new PVector();
  r = new Raindrop(random(width), 0);
}

void draw() {
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
  r.fall();         
  r.display();
  if (r.isInContactWith(mouse)) {      
    r.reset();                         
    score += 1;
  }
  if (r.loc.y > height + r.diam/2) {     
    r.reset();              
    score -= 1;
  }
}