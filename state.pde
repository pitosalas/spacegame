abstract class State<E extends Entity> {
  abstract void enter(E entity);
  abstract void execute(E entity);
  abstract void exit(E entity);
}