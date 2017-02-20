class Ship extends Entity {
  PImage image;
  Ship(PImage img, Vec2 loc) {
    this.image = img;
    phys.createShip(loc, this);
  }

  void draw() {
    fill(#FEE00F);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x, pos.y, 10, 10);
  }
}