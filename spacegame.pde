// Space Game by Pito Salas

static Space space;
static Physics phys;
static Box2DProcessing box2d;

void setup() {
  size(500, 500);
  box2d = new Box2DProcessing(this);
  phys = new Physics().setup();
  space = new Space(500, 500, 5, 0, 1);
} 

void draw () {
  background(0);
  phys.step();
  
  space.draw();
}