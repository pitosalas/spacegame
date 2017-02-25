import java.util.Random; //<>// //<>// //<>// //<>// //<>//

class Space {
  int spaceMaxX;
  int spaceMaxY;
  PImage shipImage;

  ArrayList<Entity> entities;
  ArrayList<Planet> planets;
  ArrayList<Star> stars;
  ArrayList<Ship> ships;

  Space(int w, int h) {
    spaceMaxX = w;
    spaceMaxY = h;

    entities = new ArrayList<Entity>();
    planets = new ArrayList<Planet>();
    stars = new ArrayList<Star>();
    ships = new ArrayList<Ship>();

    shipImage = loadImage("spaceship.png");
    shipImage.resize(20, 20);
  }

  void createInitialUniverse() {
    Random r = new Random();
    Star star1 = new Star(new Vec2(r.nextInt(500), r.nextInt(500)));
    Star star2 = new Star(new Vec2(r.nextInt(500), r.nextInt(500)));
    Star star3 = new Star(new Vec2(r.nextInt(500), r.nextInt(500)));

    entities.add(star1); 
    stars.add(star1);
    entities.add(star2); 
    stars.add(star2);
    entities.add(star3); 
    stars.add(star3);

    Planet earth = new Planet("Earth", new Vec2(100, 25));
    Planet jupiter = new Planet("Jupiter", new Vec2(400, 460));
    CruiseState<Ship> cruise = new CruiseState<Ship>(jupiter);
    Ship ship = new Ship(shipImage, earth, cruise);
    earth.addShip(ship);

    entities.add(ship); 
    ships.add(ship);
    entities.add(earth); 
    planets.add(earth);
    entities.add(jupiter); 
    planets.add(jupiter);
  }

  void draw() {
    for (Star s : stars) s.draw();
    for (Planet p : planets) p.draw();
    for (Ship s : ships) s.draw();
  }
}