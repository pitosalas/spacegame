class Star extends Entity {

  Star(Vec2 loc) {
    phys.createStar(loc, this);
  }

  void draw() {
    fill(#FFFFFF);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x, pos.y, 20, 20);
  }
}