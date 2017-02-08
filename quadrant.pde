class Quadrant {
  private int x, y;
  private Star star;
  private Planet planet;
  private Ship ship;
  
  Quadrant(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void add(Star aStar) {
    if (isFree()) {
      star = aStar;
    } else {
      throw new RuntimeException();
    }
  }
  
  void add(Planet aPlanet) {
    if (isFree()) {
      planet = aPlanet;
    } else {
      throw new RuntimeException();
    }
  }

  void add(Ship aShip) {
    if (isFree()) {
      ship = aShip;
    } else {
      throw new RuntimeException();
    }
  }


 
 int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
  void draw(int time) {
    if (star != null) {
      star.draw(time, x, y);
    } else if (planet != null) {
      planet.draw(x, y);
    } else if (ship != null) {
      ship.draw(x,y);
    }
  }
  
  boolean isFree() {
    return (star == null && planet == null && ship == null);
  }
}
  