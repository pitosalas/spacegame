
class Ship extends Entity {
  PImage image;
  StateMachine currentState;
  Planet planet;

  Ship(PImage img, Planet p, State s) {
    this.image = img;
    phys.createShip(p.getWposition(), this);
    currentState = new StateMachine();
    currentState.setCurrentState(s);
  }

  void draw() {
    fill(#FEE00F);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x, pos.y, 10, 10);
    drawState();
  }

  void drawState() {
    textSize(12);
    Vec2 vel = body.getLinearVelocity();
    String s = String.format("v: %2.1f, %2.1f", vel.x, vel.y);
    Vec2 loc = getPposition();
    text(s, loc.x+10, loc.y);
  }
  
  void setOnPlanet(Planet planet) {
    this.planet = planet;
  }
}