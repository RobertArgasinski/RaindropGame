class Raindrop {
  PVector loc;
  PVector vel;
  PVector acc;
  float diam;
  color c;
  
  Raindrop(float x, float y, color c){
    loc = new PVector(random(width), 0);
    vel = new PVector(0, 5);
    acc = new PVector(0, 0.01);
    diam = 30;
    c = 255;
  }
  
  void fall(){
    loc.add(vel);
    vel.add(acc);
  }
  
  void display(){
    stroke(0);
    strokeWeight(1);
    ellipse(loc.x, loc.y, diam, diam);
  }
  
  void reset(){
    loc = new PVector(random(width), 0);
    vel = new PVector(0, 5);
    acc = new PVector(0, 0.01);
  }
  
  boolean isInContactWith(PVector mouse){
    if(loc.dist(mouse) < diam/2){
      return true;
    }
    else {
      return false;
    }
  }
}