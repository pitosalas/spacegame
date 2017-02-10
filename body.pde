class Body {
  PVector loc;
  
  Body(float x, float y) {
    loc = new PVector(x, y);
  }
  
  double distanceTo(Body other) {
    return PVector.dist(loc, other.loc); 
  }
}