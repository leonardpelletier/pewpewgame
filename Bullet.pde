class Bullet {

  float x, y, d, vx, vy;
  boolean alive;

  Bullet(float _vx, float _vy) {
    x = myHero.x;
    y = myHero.y;
    d = 10;
    alive = true;
    vx = _vx;
    vy = _vy;
    
  }

  void show() {
    fill(yellow);
    stroke(yellow);
    ellipse(x, y, d, d);
  }

  void act() {
    x = x + vx;
    y = y + vy;
    
    if (x < 0 || x > width || y < 0 || y > height) alive = false;
  }
}