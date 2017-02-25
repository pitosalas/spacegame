// Space Game by Pito Salas

static Space space;
static Physics phys;
static Box2DProcessing box2d;
ArrayList<Boundary> boundaries;


void setup() {
  size(500, 500);
  box2d = new Box2DProcessing(this);
  phys = new Physics().setup();
  space = new Space(500, 500);
  space.createInitialUniverse();
  createBoundaries();
} 

void draw () {
  background(0);
  phys.step();  
  space.draw();
  drawBoundaries();
}

void createBoundaries() {
  boundaries = new ArrayList<Boundary>();
  int thickness = 5;

  boundaries.add(new Boundary(0, 0, width, thickness)); // top
  boundaries.add(new Boundary(0, thickness, thickness, height-thickness*2)); // left
  boundaries.add(new Boundary(0, height-thickness, width, thickness)); // bottom
  boundaries.add(new Boundary(width-thickness, thickness, thickness, height-thickness*2)); // right
}

void drawBoundaries() {
  for (Boundary wall : boundaries) {
    wall.display();
  }
}