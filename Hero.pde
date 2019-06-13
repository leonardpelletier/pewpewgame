class Hero {
  
  float x, y, d, speed;
  
 Hero() {
   x = width/2;
   y = height/2;
   d = 30;
   speed = 5;
 }
 
 void show() {
   fill(pink);
   stroke(pink);
   ellipse(x, y, d, d);
   strokeWeight(3);
   line(x,y,mouseX,mouseY);
 }
 
 void act() {
   if (wkey) y = y - speed;
   if (skey) y = y + speed;
   if (akey) x = x - speed;
   if (dkey) x = x + speed;
 }
  
}