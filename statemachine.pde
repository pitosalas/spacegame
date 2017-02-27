class StateMachine<E extends Entity> {
  E owner;
  State<E> currentState;
  State<E> previousState;
  State<E> globalState;
  
  StateMachine(E owner) { this.owner = owner; }
 
  void setCurrentState(State<E> s) { currentState = s; println("Entering:" + s); }
  void setGloblState(State<E> s) { globalState = s; }
  void setPreviousState(State<E> s) { previousState = s; }
  
  void update() {
    if (globalState != null) globalState.update(owner);
    if (currentState != null) currentState.update(owner);
  }
  
  void changeState(State<E> newState) {
    if (newState == null) throw new RuntimeException("changeState with null newstate");
    previousState = currentState;
    currentState.exit(owner);
    currentState = newState;
    currentState.enter(owner);
  }
  
  void revertToPreviousState() {
    changeState(previousState);
  }
  
  boolean isInState(State<E> s) { return currentState == s; }
  
  String getCurStateInfo() {
    return currentState.getStateInfo();
  }
    
}