class Ship {
  PImage image;
  Ship(PImage img) {
    this.image = img;
  }

  void draw(int x, int y) {
    image(image, x, y);
  }
}