class Star extends Entity {

  Star(Body body) {
    super(body);
  }

  void draw(int time) {
    fill(#FFFFFF);
    int size = 7;
    if (starOn(time)) {
      ellipse(body.loc.x, body.loc.y, size, size);
    }
  }

  boolean starOn(int time) {
    return (time % 100 <  75);
  }

  void update(int time) {
  }



}
