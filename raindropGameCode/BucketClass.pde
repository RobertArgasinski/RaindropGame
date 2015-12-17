class Catcher {
  int diam;
  PVector loc;
  
  Catcher(int tDiam){
    diam = tDiam;
    loc = new PVector(mouseX, mouseY);
  }
  
  void display(){
    fill(0);
    ellipse(mouseX, mouseY,  diam, diam);
  }
}