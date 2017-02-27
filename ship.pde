
class Ship extends Entity {
  PImage image;
  StateMachine stateMachine;
  Planet planet;
  String name;

  Ship(String name, PImage img, Planet startingPoint) {
    this.image = img;
    this.name = name;
    phys.createShip(startingPoint.getPposition(), this);
    stateMachine = new StateMachine(this);
  }

  void draw() {
    //if (frameCount == 1) {
    //  println("drawing ship at: p" + getPposition() + " w" + getWposition());
    //}
    stateMachine.update();
    drawShip();
    drawState();
  }

  void drawShip() {
    fill(#FEFF03);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x, pos.y, 10, 10);
  }

  void drawState() {
    textSize(12);
    Vec2 vel = body.getLinearVelocity();
    String s = String.format("v: %2.1f, %2.1f %s", vel.x, vel.y, stateInfo());
    Vec2 loc = getPposition();
    text(s, loc.x+10, loc.y);
  }

  void setOnPlanet(Planet planet) {
    this.planet = planet;
  }

  String toString() { 
    return "Ship: " + getName();
  }
  
  String stateInfo() {
    return (stateMachine.getCurStateInfo());
  }
}