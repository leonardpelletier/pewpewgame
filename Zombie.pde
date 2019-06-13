class Zombie {

  float x, y, d, vx, vy;
  boolean alive;

  Zombie() {
    //float spawn = random(0,4);

    x = random(0, width);
    y = 0;
    d = 30;

    PVector direction = new PVector(myHero.x-x, myHero.y-y);
    direction.setMag(3);
    vx = direction.x;
    vy = direction.y;

    alive = true;
  }

  void show() {
    fill(green);
    stroke(0);
    ellipse(x, y, d, d);
  }

  void act() {
    PVector direction = new PVector(myHero.x-x, myHero.y-y);
    direction.setMag(3);
    vx = direction.x;
    vy = direction.y;

    x = x + vx;
    y = y + vy;

    int i = 0;
    while (i < bulletList.size()) {
      Bullet b = bulletList.get(i);
      if ( dist(b.x, b.y, x, y) < b.d/2 + d/2) {
        alive = false;
        b.alive = false;
      }
      i++;
    }
  }
}