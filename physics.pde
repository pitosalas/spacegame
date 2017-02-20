import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

//
// Physics class encloses all calls to the physics engine
//
class Physics {
  
  Physics setup() {
    box2d.createWorld();
    box2d.setGravity(0, 0);
    return this;
  }
  
  void step() {
    box2d.step();
  }
  
  BodyDef buildBodyDef(Vec2 loc) {
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(loc));
    return bd;
  }
  
  CircleShape buildCircleShape(int size) {
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(size);
    return cs;
  }
  
  FixtureDef buildFixture(Shape shape) {
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = shape;
    return fd;
  }
  
  Body buildBody(BodyDef bd, FixtureDef fd) {
    Body body;
    body = box2d.createBody(bd);
    body.createFixture(fd);
    return body;
  }
      
  void createStar(Vec2 loc, Entity ent) {
    BodyDef bd = buildBodyDef(loc);
    CircleShape cs = buildCircleShape(10);
    FixtureDef fd = buildFixture(cs);
    Body body = buildBody(bd, fd);
    ent.setBody(body);
  }
  
  void createShip(Vec2 loc, Entity ent) {
    BodyDef bd = buildBodyDef(loc);
    CircleShape cs = buildCircleShape(5);
    FixtureDef fd = buildFixture(cs);
    Body body = buildBody(bd, fd);
    ent.setBody(body);
  }
  

}