// Space Game by Pito Salas
import shiffman.box2d.*;

Space space;

void setup() {
    size(500, 500);
    space = new Space(500, 500, 10, 10, 5);
} 

void draw () {
  background(0);
  
  space.update();
  space.draw();
}