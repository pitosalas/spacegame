class Planet extends Entity {
  String name;
  Planet(String name, Body bod) {
    super(bod);
    this.name = name;
  }
  
  void setRandomName() {
    Random r = new Random();
    String[] names = {"Mercury", "Mars", "Earth", "Venus", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "Signma-1", "Ulf"};
    name = names[r.nextInt(names.length)];
  }
    
  void setBody(Body newBod) {
    body = newBod;
  }
  
  void draw(int time) {
    println("calling draw in planet");
    fill(#227E48);
    ellipse(body.loc.x, body.loc.y, 15, 15);
    textSize(10);
    text(name, body.loc.x-20, body.loc.y+20);
  }
  
  String toString() {
    return ("Planet " + name + " " + body.toString());
  }
  
  void update(int time) {
    print ("Planet::Update");
  }
}