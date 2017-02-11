class Entity {
  Body body;

  Entity(Body given) {
    this.body = given;
  }
  
  void draw(int time) {
    print("not calling draw in entity");
  }
  
  void update(int time) {
    throw new RuntimeException();
  }
}