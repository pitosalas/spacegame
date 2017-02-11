import java.util.Random;

class Space {
  int time;
  int spaceMaxX;
  int spaceMaxY;
  PImage shipImage;
  ArrayList<Entity> entities;
  HashMap<String, Planet> planets;
  
  Space(int w, int h, int nstars, int nplanets, int nships) {
    spaceMaxX = w; //<>//
    spaceMaxY = h;
    entities = new ArrayList<Entity>();
    planets = new HashMap<String, Planet>();

    shipImage = loadImage("spaceship.png");
    shipImage.resize(20,20);
    createStars(nstars);
    createPlanets(nplanets);
//    createShips(ships);
  }
  
  void update() {
    time += 1;
    for (Entity e: entities) {
      e.update(time);
    }
  }
  
  void draw() {
    drawStatusPanel();
    drawEntities();
  }
  
  void drawStatusPanel() {
    fill(#FFFFFF);
    textSize(16);
    text("time: " + time + " hours ", 20, 20);
  }
    
  void drawEntities() {
    for (Entity q: entities) {
      q.draw(time);
    }
  }
    
  void createStars(int count) {
    for (int i = 0; i < count; i++) {
      Body newBody = new Body().setRandomLoc();
      if (!tooClose(newBody)) {
        entities.add(new Star(newBody));
      }
    }
  }
  
  void createPlanets(int count) {
    for (int i=0; i < count; i++) {
      createAPlanet(null);
    }
  }
  
  void createAPlanet(String name) {
    Planet planet = new Planet(name, null);
    if (name == null) planet.setRandomName();
    Body planetBody;
    do {
       planetBody = new Body().setRandomLoc();
    } while (tooClose(planetBody));
    planet.body = planetBody;
    println(planet);
    planets.put(name, planet);
    entities.add(planet);
  }
    

  void createShips(int count) {
    for (int i = 0; i < count; i++) {
      Body newBody = new Body(new Random().nextInt(spaceMaxX), new Random().nextInt(spaceMaxY));
      if (!tooClose(newBody)) {
        entities.add(new Ship(shipImage, newBody));
      }
    }
  }

// This is very inefficient but the number of entities we have will be less than 100 so it's acceptable.
  boolean tooClose(Body newBody) {
    boolean tooClose = false;
    for (Entity e: entities) {
      if (e.body.distanceTo(newBody) < 25) {
        tooClose = true;
        break;
      }
    }
    return tooClose;
  }
}