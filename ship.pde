
class Ship extends Entity {
  PImage image;
  float maxSpeed;
  Vec2 pTarget, wTarget;

  Ship(PImage img, Vec2 loc) {
    this.image = img;
    phys.createShip(loc, this);
    maxSpeed = 5.0;
  }

  void preUpdate() {
    Vec2 desired = wTarget.sub(getWposition());
    float desiredMag = desired.length();
    if (desiredMag > 10) {
      
    debugOut("Target pix: " + pTarget + " world: " + wTarget);    
    debugOut("Current Pos" + getWposition());
    debugOut("Velocity: " + getVelocity());    
    debugOut("Desired Prenorm: " + desired);
    desired.normalize();
    debugOut("Desired Normalized: " + desired);
    desired.mulLocal(maxSpeed);
    debugOut("Desired mapped to max speed: " + desired);
    Vec2 steer = desired.sub(getVelocity()); 
    debugOut("Steer: " + steer);
    applyForce(steer);
    debugOut("-----------------");
  }
  
  
  “float d = desired.mag();                             The distance is the magnitude of the vector
desired.normalize();                                 pointing from location to target.
  if (d < 100) {                                     If we are closer than 100 pixels...

    float m = map(d,0,100,0,maxspeed);               ...set the magnitude according to how close
    desired.mult(m);                                 we are.

  } else {
    desired.mult(maxspeed);                          Otherwise, proceed at maximum speed.

  }

  PVector steer = PVector.sub(desired,velocity);     The usual steering = desired - velocity

  steer.limit(maxforce);
  applyForce(steer);
}”

Excerpt From: Daniel Shiffman. “The Nature of Code.” iBooks. 
  
  
  

  void draw() {
    fill(#FEE00F);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x, pos.y, 10, 10);
    drawState();
  }

  void postUpdate() {
    //applyForce(-1.0);
  }


  void applyForce(Vec2 force) {
    debugOut("Apply Force: " + force);
    body.applyForceToCenter(force);
  }

  void drawState() {
    textSize(10);
    Vec2 vel = body.getLinearVelocity();
    String s = String.format("v: %2.1f, %2.1f", vel.x, vel.y);
    Vec2 loc = getPposition();
    text(s, loc.x+10, loc.y);
  }

  void setTarget(Vec2 target) {
    this.pTarget = target;
    wTarget = box2d.coordPixelsToWorld(target);
  }

  void debugOut(String label) {
    if (frameCount == 1 || frameCount % 15 == 0) {
      println(frameCount + ": " + label);
    }
  }
}