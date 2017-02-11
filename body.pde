class Body {
  PVector loc;
  
  Body(float x, float y) {
    loc = new PVector(x, y);
  }
  
  Body() {
    loc = new PVector();
  }
  
  Body setRandomLoc() {
    Random r = new Random();
    loc.x = r.nextFloat() * width;
    loc.y = r.nextFloat() * height;
    return this;
  }
  
  double distanceTo(Body other) {
    return PVector.dist(loc, other.loc); 
  }
  
  void update(int time) {
    loc.x = map(noise(time/500.0), 0, 1, 0, width);
    loc.y = map(noise((10000 + time)/500.0), 0, 1, 0, height);
  }
  
  String toString() {
    return ("Bod: " + loc.x + "," + loc.y);
  }
}