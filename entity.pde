abstract class Entity {
  protected Body body;
  abstract void draw();
  
  int distanceTo(Vec2 other) {
    return 100;
  }
  
  void setBody(Body bod) {
    body = bod;
  }
}