abstract class State<E extends Entity> {
  E owner;

  void enter(E entity) { }
  void update(E entity) { }
  void exit(E entity) { }

  
  String getStateInfo() { 
    return "";
  }

  State(E e) {
    owner = e;
  }
}