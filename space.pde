import java.util.Random;

class Space {
  int time;
  int spaceMaxX;
  int spaceMaxY;
  PImage shipImage;
  ArrayList<Entity> entities;
  
  Space(int w, int h, int stars, int planets, int ships) {
    spaceMaxX = w; //<>//
    spaceMaxY = h;
    entities = new ArrayList<Entity>();
    
    shipImage = loadImage("spaceship.png");
    shipImage.resize(20,20);
    createStars(stars);
    //createPlanets(planets);
    //createShips(ships, shipImage);
  } //<>//
  
  void update() {
    time += 1; //<>//
  }
  
  void draw() {
    drawStatusPanel();
    drawEntities();
  } //<>//
  
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
     //<>//
  void createStars(int count) {
    for (int i = 0; i < count; i++) {
      Body newBody = new Body(new Random().nextInt(spaceMaxX), new Random().nextInt(spaceMaxY));
      if (!tooClose(newBody)) {
        entities.add(new Star(newBody));
      }
    }
  }
  
  boolean tooClose(Body newBody) {
    boolean tooClose = false;
    for (Entity e: entities) {
      if (e.body.distanceTo(newBody) < 12) {
        tooClose = true;
        break;
      }
    }
    return tooClose;
  }
  
    //void createPlanets(int count) {
    //for (int i = 0; i < count; i++) {
    //  int x = new Random().nextInt(spaceMaxX);
    //  int y = new Random().nextInt(spaceMaxY);
    //  println("planet " + x + "," + y);
    //  if (homeq.isFree()) {
    //    homeq.add(new Planet());
    //   }  
    // }
//  }
//  //
 //id createShips(int count, PImage img) {
    //for (int i = 0; i < count; i++) {
    //  int x = new Random().nextInt(spaceMaxX);
    //  int y = new Random().nextInt(spaceMaxY);
    //  Quadrant homeq = findAt(x, y);
    //  if (homeq.isFree()) {
    //    homeq.add(new Ship(img));
    //   }  
    // }
  //}
}