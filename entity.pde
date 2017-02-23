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

  void draw() {
  }
  void preUpdate() {
  }
  void postUpdate() {
  }
}