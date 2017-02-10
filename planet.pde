class Planet extends Entity {
  Planet(Body bod) {
    super(bod);
  }
  
  void draw(int time) {
    fill(#227E48);
    ellipse(body.loc.x, body.loc.y, 10, 10);
  }
}