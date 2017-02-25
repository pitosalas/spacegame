class CruiseState<E extends Entity> extends State<E> {
  
  Planet target;
  float maxSpeed;
  
  CruiseState(Planet theTarget) {
    target = theTarget;
    maxSpeed = 10.0;
  }
  
  void execute(E ship) {
    ship.cruiseTo(target.getWposition(), maxSpeed);    
  }

  void enter(E ship) {
    print("Entering CruiseSate");
  }

  void exit(E ship) {
    print("Exiting CruiseSate");
  }

}