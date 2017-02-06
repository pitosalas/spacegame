import java.util.Random;

class Space {
  int time;
  int spaceMaxX;
  int spaceMaxY;
  PImage shipImage;
  ArrayList<Quadrant> quadrants;
  
  Space(int w, int h, int stars, int planets, int ships) {
    spaceMaxX = w; //<>//
    spaceMaxY = h;
    quadrants = new ArrayList<Quadrant>();
    shipImage = loadImage("spaceship.jpg");
    shipImage.resize(10,10);
    createStars(stars);
    createPlanets(planets);
    createShips(ships, shipImage);
  } //<>//
  
  void update() {
    time += 1; //<>//
  }
  
  void draw() {
    drawStatusPanel();
    drawQuads();
  } //<>//
  
  void drawStatusPanel() {
    fill(#FFFFFF);
    textSize(16);
    text("time: " + time + " hours ", 20, 20);
  }
    
  void drawQuads() {
    for (Quadrant q: quadrants) {
      q.draw();
    }
  }
     //<>//
  void createStars(int count) {
    for (int i = 0; i < count; i++) {
      int x = new Random().nextInt(spaceMaxX);
      int y = new Random().nextInt(spaceMaxY);
      Quadrant homeq = findAt(x, y);
       if (homeq.isFree()) {
         homeq.add(new Star());
       }
    }
  }
  
    void createPlanets(int count) {
    for (int i = 0; i < count; i++) {
      int x = new Random().nextInt(spaceMaxX);
      int y = new Random().nextInt(spaceMaxY);
      Quadrant homeq = findAt(x, y);
      println("planet " + x + "," + y);
      if (homeq.isFree()) {
        homeq.add(new Planet());
       }  
     }
  }
  
  void createShips(int count, PImage img) {
    for (int i = 0; i < count; i++) {
      int x = new Random().nextInt(spaceMaxX);
      int y = new Random().nextInt(spaceMaxY);
      Quadrant homeq = findAt(x, y);
      if (homeq.isFree()) {
        homeq.add(new Ship(img));
       }  
     }
  }
  
  Quadrant findAt(int x, int y) {
    for (Quadrant q: quadrants) {
     if (q.getX() == x && q.getY() == y) {
        return q;
      }
    }
    Quadrant newq = new Quadrant(x, y);
    quadrants.add(newq);
    return newq;
  }
}