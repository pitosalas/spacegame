class OnPlanetState<E extends Entity> extends State<E> {

  E target;
  float maxSpeed;

  OnPlanetState(E theTarget, E owner) {
    super(owner);
    target = theTarget;
    maxSpeed = 10.0;
  }

  void update(E ship) {
    owner.setVelocityZero();
    owner.setLocation(target);
  }

  float distanceToTarget() {
    return (target.getWposition().sub(owner.getWposition())).length();
  }


  String getStateInfo() { 
    return String.format("%3.1f", distanceToTarget());
  }


  String toString() { 
    return "OnPlanetState";
  }
}