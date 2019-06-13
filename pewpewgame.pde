//pew pew game

//color palette
color purple = #490A3D;
color pink   = #BD1550;
color orange = #E97F02;
color yellow = #F8CA00;
color green  = #8A9B0F;

//keyboard
boolean akey, dkey, skey, wkey;

ArrayList<Bullet> bulletList;
ArrayList<Zombie> zombieList;
Hero myHero;

void setup() {
  size (800, 800);

  myHero = new Hero();
  bulletList = new ArrayList<Bullet>();
  zombieList = new ArrayList<Zombie>();
}

void draw() {
  fill(purple, 100);
  rect(0, 0, width, height);


  int i = 0;
  while (i < bulletList.size()) {
    Bullet b = bulletList.get(i);
    if (b.alive == true) {
      b.show();
      b.act();
      i++;
    } else {
      bulletList.remove(i);
    }
  }

  int z = 0;
  while (z < zombieList.size()) {
    Zombie currentZombie = zombieList.get(z);
    if (currentZombie.alive == true) {
      currentZombie.show();
      currentZombie.act();
      z++;
    } else {
      zombieList.remove(z); 
    }
  }

  myHero.show();
  myHero.act();

  if (frameCount % 30 == 0) {
    zombieList.add(new Zombie());
  }

  if (mousePressed) {
    
  }
}

void keyPressed() {
  if (key == 'a') akey = true;
  if (key == 'd') dkey = true;
  if (key == 's') skey = true;
  if (key == 'w') wkey = true;
}

void keyReleased() {
  if (key == 'a') akey = false;
  if (key == 'd') dkey = false;
  if (key == 's') skey = false;
  if (key == 'w') wkey = false;
}

void mousePressed() {
  PVector direction = new PVector(mouseX-myHero.x, mouseY-myHero.y);
    direction.setMag(10);
    float k = 0;
    while (k <= 2*PI) {
      direction.rotate(k);
      bulletList.add(new Bullet(direction.x, direction.y));
      k += PI/2;
    }
}