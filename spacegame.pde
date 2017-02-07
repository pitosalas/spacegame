// Space Game by Pito Salas

Space space;

void setup() {
    size(500, 800); //<>//
    space = new Space(500, 800, 20, 10, 5);
} 

void draw () {
  background(0);
  
  space.update(); //<>//
  space.draw();
}