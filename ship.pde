
class Ship extends Entity {
  PImage image;
  float maxSpeed;
  Vec2 pTarget, wTarget;
  Entity target;
  Planet planet;

  Ship(PImage img, Vec2 loc) {
    this.image = img;
    phys.createShip(loc, this);
    maxSpeed = 10.0;
  }
  
  Ship(PImage img, Planet loc) {
    this(img, loc.getPposition());
  }

  void preUpdate() {
    steerTo(target.getWposition(), maxSpeed);
  }

  void draw() {
    fill(#FEE00F);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x, pos.y, 10, 10);
    drawState();
  }

  void postUpdate() {
    //applyForce(-1.0);
  }

  void drawState() {
    textSize(12);
    Vec2 vel = body.getLinearVelocity();
    String s = String.format("v: %2.1f, %2.1f", vel.x, vel.y);
    if (target != null) 
      s += " -> " + target.getName();
    Vec2 loc = getPposition();
    text(s, loc.x+10, loc.y);
  }

  void setTarget(Vec2 target) {
    this.pTarget = target;
    wTarget = box2d.coordPixelsToWorld(target);
  }

  void setTarget(Planet p) {
    target = p;
  }

  void setOnPlanet(Planet planet) {
    this.planet = planet;
  }


  void debugOut(String label) {
    if (frameCount == 1 || frameCount % 15 == 0) {
      println(frameCount + ": " + label);
    }
  }
}