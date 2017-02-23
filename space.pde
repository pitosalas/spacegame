import java.util.Random; //<>// //<>// //<>//

class Space {
  int spaceMaxX;
  int spaceMaxY;
  PImage shipImage;
  ArrayList<Entity> entities;
  HashMap<String, Planet> planets;

  Space(int w, int h) {
    spaceMaxX = w;
    spaceMaxY = h;

    entities = new ArrayList<Entity>();
    planets = new HashMap<String, Planet>();

    shipImage = loadImage("spaceship.png");
    shipImage.resize(20, 20);
  }
  
  void createInitialUniverse() {
    entities.add(new Star(new Vec2(200, 200)));
    entities.add(new Star(new Vec2(400, 400)));
    Ship ship = new Ship(shipImage, new Vec2(240,240));
    ship.setTarget(new Vec2(50, 50));
    entities.add(ship);
    Planet planet = new Planet("Jupiter", new Vec2(250, 250));
    entities.add(planet);
    planet.addShip(ship);
  }
  
  void createStars(int count) {
    for (int i = 0; i < count; i++) {
      Random r = new Random();
      Vec2 loc = new Vec2(r.nextFloat() * width, r.nextFloat() * height);
      if (!tooClose(loc)) {
        entities.add(new Star(loc));
      }
    }
  }

 void createShips(int count) {
    for (int i = 0; i < count; i++) {
      Random r = new Random();
      Vec2 loc = new Vec2(r.nextFloat() * width, r.nextFloat() * height);
      if (!tooClose(loc)) {
        entities.add(new Ship(shipImage, loc));
      }
    }
  }

  void draw() {
    for (Entity q : entities) {
      q.draw();
    }
  }
  
  void preUpdate() {
    for (Entity q : entities) {
      q.preUpdate();
    }
  }
  
  void postUpdate() {
    for (Entity q : entities) {
      q.postUpdate();
    }
  }
  

  //void createPlanets(int count) {
  //  for (int i=0; i < count; i++) {
  //    createAPlanet(null);
  //  }
  //}

  //void createAPlanet(String name) {
  //  Planet planet = new Planet(name, null);
  //  if (name == null) planet.setRandomName();
  //  Body planetBody;
  //  do {
  //     planetBody = new Body().setRandomLoc();
  //  } while (tooClose(planetBody));
  //  planet.body = planetBody;
  //  println(planet);
  //  planets.put(name, planet);
  //  entities.add(planet);
  //}


   // This is very inefficient but the number of entities we have will be less than 100 so it's acceptable.
  boolean tooClose(Vec2 newloc) {
    boolean tooClose = false;
    for (Entity e : entities) {
      if (e.distanceTo(newloc) < 25) {
        tooClose = true;
        break;
      }
    }
    return tooClose;
  }
}