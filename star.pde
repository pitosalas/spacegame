class Star {
  
  void draw(int time, int x, int y) {
    fill(#FFFFFF);
    int size = 7;
    if (starOn(time)) {
      ellipse(x, y, size, size);
    }  
  }
  
  boolean starOn(int time) {
    return (time % 100 <  75);
  }

}