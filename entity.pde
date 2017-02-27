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
  
  void setVelocityZero() {
    body.setLinearVelocity(new Vec2());
  }
  
  void setLocation(Entity target) {
    body.setTransform(target.body.getPosition(),0);
  }

  

  String getName() { 
    return "";
  }

  void draw() {
  }

  void cruiseTo(Vec2 wTarget, float maxSpeed) {
    Vec2 desired = wTarget.sub(getWposition());
    desired.normalize();
    desired.mulLocal(maxSpeed);
    Vec2 steer = desired.sub(getVelocity()); 
    applyForce(steer);
  }

  void arriveAt(Vec2 wTarget, float maxSpeed) {
    Vec2 desired = wTarget.sub(getWposition());
    float desiredMag = desired.length();
    float mapSpeed = map(desiredMag, 0, 100, 0, maxSpeed);
    desired.mulLocal(mapSpeed);
    Vec2 steer = desired.sub(getVelocity()); 
    applyForce(steer);
  }


  void applyForce(Vec2 force) {
    //debugOut("Apply Force: " + force);
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