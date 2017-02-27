class ArriveState<E extends Entity> extends State<E> {

  E target;
  float maxSpeed;

  ArriveState(E theTarget, E owner) {
    super(owner);
    target = theTarget;
    maxSpeed = 3.0;
  }

  void update(E ship) {
    if (ship != owner) throw new RuntimeException();
    Vec2 desired = target.getWposition().sub(ship.getWposition());

    float desiredMag = desired.length();
    if (desiredMag > 0.5) {
      ship.arriveAt(target.getWposition(), maxSpeed);
    } else {
      State newState = new OnPlanetState(target, owner);
      ((Ship) ship).stateMachine.setCurrentState(newState);
    }
  }
  String toString() { 
    return "ArriveState";
  }

  float distanceToTarget() {
    return (target.getWposition().sub(owner.getWposition())).length();
  }

  String getStateInfo() { 
    return String.format("%3.1f", distanceToTarget());
  }
}