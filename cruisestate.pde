class CruiseState<E extends Entity> extends State<E> { //<>//

  E target;
  float maxSpeed;

  CruiseState(E theTarget, E owner) {
    super(owner);
    target = theTarget;
    maxSpeed = 15.0;
  }

  void update(E ship) {
    if (distanceToTarget() > 10) {
      ship.cruiseTo(target.getWposition(), maxSpeed);
    } else {
      State newState = new ArriveState(target, owner);
      ((Ship)owner).stateMachine.setCurrentState(newState);
    }
  }

  float distanceToTarget() {
    return (target.getWposition().sub(owner.getWposition())).length();
  }
  
  void enter(E ship) {
  }

  void exit(E ship) {
  }

  String toString() { 
    return "CruiseState";
  }

  String getStateInfo() { 
    return String.format("%3.1f", distanceToTarget());
  }
}