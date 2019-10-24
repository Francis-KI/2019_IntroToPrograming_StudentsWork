Object myFlower1;  // the first instance of the Object class. Global objects. 
Object myFlower2;  // the second instance of the Object class
Object myCircle1; // the third instance of the Object Class.

  
void setup() {
  size(1600, 1200);

  int _r1= 160; //radius of flower one's ellipses
  int _r2 = 100; //^^ flower 2
  int _r3 = 120; //radius of Circle1
   float _x=width/2; //starting point for x-value
 float _y=height/2; //starting point for y-value
  int _petals=7; //number of petals
  int _pc=#FFA000; //petals color in hexadecimal
  int _circleColor= #FA67E2; // 
  int offset = 350; //en konstant der bruges til at give afstand mellem blomsterne.
  float _speed1=2;
  float _speed2=5;
  float _speed3=6;


  myFlower1 = new Object(_r1, _petals, _x, _y, _pc, _speed1); 
  myFlower2 = new Object(_r2, _petals, _x+random(-500, 500), _y+offset, _pc, _speed2);
  myCircle1 = new Object(_r3, _x, _y-offset, _circleColor, _speed3);
}

void draw() {
  background(#43AF76);
   if (myFlower1.overlaps(myCircle1)){
  background (0, 0, 255);
   }

myCircle1.displayCircle();
myCircle1.move();
myCircle1.bounce(2);
myCircle1.mousePx();
myCircle1.mousePy();
myFlower1.displayFlower();
myFlower1.move();  
myFlower1.bounce(1);
myFlower2.displayFlower();
myFlower2.move();  
myFlower2.bounce(1);

}
