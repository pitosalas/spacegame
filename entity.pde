abstract class Entity {
  protected Body body;

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

  void steerTo(Vec2 wTarget, float maxSpeed) {
    Vec2 desired = wTarget.sub(getWposition());
    float desiredMag = desired.length();
    desired.normalize();

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

  void cruiseTo(Vec2 wTarget, float maxSpeed) {
    Vec2 desired = wTarget.sub(getWposition());
    desired.normalize();
    desired.mulLocal(maxSpeed);
    Vec2 steer = desired.sub(getVelocity()); 
    applyForce(steer);
  }

  void approach(Vec2 wTarget, float maxSpeed) {
    Vec2 desired = wTarget.sub(getWposition());
    float desiredMag = desired.length();
    float mapSpeed = map(desiredMag, 0, 100, 0, maxSpeed);
    desired.mulLocal(mapSpeed);
    Vec2 steer = desired.sub(getVelocity()); 
    applyForce(steer);
  }


  void applyForce(Vec2 force) {
    debugOut("Apply Force: " + force);
    body.applyForceToCenter(force);
  }

  void debugOut(String label) {
    //if (frameCount == 1 || frameCount % 100 == 0) {
    //  println(frameCount + ": " + label);
    //}
  }

  void printState() {
    debugOut("Current Pos" + getWposition());
    debugOut("Velocity: " + getVelocity());    
  }
}