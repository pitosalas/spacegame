class Planet extends Entity {
  String name;
  ArrayList<Ship> ships = new ArrayList<Ship>();

  Planet(String name, Vec2 loc) {
    this.name = name;
    phys.createPlanet(loc, this);
  }

  void draw() {
    fill(#227E48);
    Vec2 pos = box2d.getBodyPixelCoord(body);

    ellipse(pos.x, pos.y, 15, 15);
    textSize(10);
    text(name, pos.x-20, pos.y+20);
  }

  String toString() {
    return ("Planet " + name + " " + body.toString());
  }
  
  String getName() { return name; } 

  void addShip(Ship aShip) {
    ships.add(aShip);
    aShip.setOnPlanet(this);
  }
}