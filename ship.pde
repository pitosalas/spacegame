class Ship extends Entity {
  PImage image;
  Ship(PImage img, Body bod) {
    super(bod);
    this.image = img;
  }

  void draw(int time) {
    image(image, body.loc.x, body.loc.y);
  }
}