//VARIABLE ET CONSTANTE
ArrayList<Ball> balls;

float distance;
int PROX = 80;
int PROXB = 10;

Table table;

//CLASSE
class Ball {
  float x, y; 
  float speed, directionx, directiony; 
  color ballColor;
  boolean mouse; 
  
  Ball(){
    x = random(0, 640); 
    y = random(0, 360);
    speed = random(1, 3);
    directionx = directiony = 1; 
    ballColor = color(0, random(0,255), random(0,255));
  }

  void move(){
    if (mouse == false){
      x = x + speed * directionx; 
      y = y + speed * directiony;
    }
    else{
      x = mouseX; 
      y = mouseY; 
    }

  }
  
  void rebondir(){
    if (x > width) {
     directionx = -directionx; 
   }
   if (x < 0) {
     directionx = -directionx; 
   }   
   if (y > height) {
     directiony = -directiony; 
   }
   if (y < 0) {
     directiony = -directiony; 
   }
  }
  
  void followMouse(){
    float distance = sqrt(pow(x-mouseX,2) + pow(y-mouseY,2));
    if (mousePressed && PROXB >= distance){
      mouse = true; 
    }
    else{
      mouse = false;
    }
  }

    
} 

//FONCTIONS
void nettoyer() {  
  background(0);
}


//SETUP
void setup() {
  size(640,360);
  background(0);
  balls = new ArrayList<Ball>();
  
  for (int i = 1; i <= 30; i++){
    balls.add(new Ball());
  }
  
  //table = loadTable("GDP.csv", "header");
  //println(table.getRowCount() + " total rows in table");
}

//DRAW
void draw() {
  //efface la fenêtre
  nettoyer();
  //redessine dans la fenêtre 
  for (Ball ball:balls){
    fill(ball.ballColor);
    ellipse(ball.x, ball.y, 20, 20);
    ball.move();
    ball.rebondir();
    for (Ball ball2:balls){
      distance = sqrt(pow(ball2.x-ball.x,2) + pow(ball2.y-ball.y,2));
      if (distance <= PROX){
        strokeWeight(1);
        stroke(0, 100, 200);
        line(ball.x, ball.y, ball2.x, ball2.y);
      }
    }
    ball.followMouse();
  }  
}
