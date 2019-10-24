
class Object {

  // Variables
  float speed; //Der blev lavet en speed variable så man kunne flytte på blomsten og sætte den til forskellig hastighed
  float ballX;
  float ballY;


  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals
  int circleColor; //hexadecimal number for the color of the circle

  //the name in the contructor is irrelevant. It could just as well be called _petals like in the main class. 
  //The local variables in the constructor is on the other hand very important.
  //no void and a big first letter for the constructor. Return type of constructor is itself. 
  //flower object
  Object(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, float temp_speed) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    speed = temp_speed;
  }
  
  //Circle object
  Object(float temp_r, float temp_x, float temp_y, int temp_circleColor, float temp_speed){
  r=temp_r;
  x=temp_x;
  y=temp_y;
  speed=temp_speed;
  circleColor=temp_circleColor;
}

  void displayFlower () {
    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }
  
  void displayCircle(){
    fill(circleColor);
    ellipse(x,y,r,r);
  }
    
  void move() {
    x = x + speed; //forøger x-værdien med varablen speed.
  }
  
  //jeg har indsat variablen i, så man kan justere om hvor langt fra skærmkanterne objektet skal bounce. 
  //Blomster objekterne skal fx deles med 1, da de har blade og derfor skal bounce før centercirklen rammer skærmen. 
  //Cirklen derimod skal deles med sin 2 for at bounce på kanten.
  float bounce(int i) {
    if (x > width-r/i || x < r/i || y > height || y < 0) {
      speed = speed * (-1);
    }
    return speed;
  }

  boolean overlaps(Object someOtherObject) {
    if (dist(x, y, someOtherObject.x, someOtherObject.y)<(r+someOtherObject.r))
    {
      return true;
    } 
    else
    {
      return false;
    }
  }
  
//credit to Atle for mousePressed floats, which makes an object follow the mouseX and mouseY positions, as long as mouse is pressed. 
float mousePx () {
  if (mousePressed) {
  x = mouseX;
}
  return x; //returns the initial x-value
}

float mousePy () {
  if (mousePressed) {
  y = mouseY;
}
  return y; //returns the initial x-value
}
}
