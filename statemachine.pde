class StateMachine<E extends Entity> {
  E owner;
  State<E> currentState;
  State<E> previousState;
  State<E> globalState;
  
  void setCurrentState(State<E> s) { currentState = s; }
  void setGloblState(State<E> s) { globalState = s; }
  void setPreviousState(State<E> s) { previousState = s; }
  
  void update() {
    if (globalState != null) globalState.execute(owner);
    if (currentState != null) currentState.execute(owner);
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
  
}