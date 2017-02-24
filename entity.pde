abstract class Entity {
  protected Body body;

  int distanceTo(Vec2 other) {
    return 100;
  }

  void setBody(Body bod) {
    body = bod;
  }

  Vec2 getPposition() {
    return (box2d.coordWorldToPixels(body.getPosition()));
  }

  Vec2 getWposition() {
    return (body.getPosition());
  }

  Vec2 getVelocity() {
    return (body.getLinearVelocity());
  }

  String getName() { 
    return "";
  }

  void draw() {
  }
  void preUpdate() {
  }
  void postUpdate() {
  }

  void steerTo(Vec2 wTarget, float maxSpeed) {
    Vec2 desired = wTarget.sub(getWposition());
    float desiredMag = desired.length();
    desired.normalize();

    debugOut("Target world: " + wTarget);    
    debugOut("Current Pos" + getWposition());
    debugOut("Velocity: " + getVelocity());    
    debugOut("Desired Prenorm: " + desired);
    debugOut("Desired Normalized: " + desired);

    if (desiredMag < 10) {
      float m = map(desiredMag, 0, 100, 0, maxSpeed);
      desired.mulLocal(m);
    } else {
      desired.mulLocal(maxSpeed);
    }
    debugOut("Desired mapped to max speed: " + desired);
    Vec2 steer = desired.sub(getVelocity()); 
    debugOut("Steer: " + steer);
    applyForce(steer);
    debugOut("-----------------");
  }

  void applyForce(Vec2 force) {
    debugOut("Apply Force: " + force);
    body.applyForceToCenter(force);
  }

  void debugOut(String label) {
    if (frameCount == 1 || frameCount % 100 == 0) {
      println(frameCount + ": " + label);
    }
  }
}