//your variable declarations here
Stars[] theSky = new Stars[500];
SpaceShip wilsonian = new SpaceShip();

public void setup() 
{
size(700,700);
background(125);
for(int i = 0; i < theSky.length; i++) {
  theSky[i] = new Stars();
}
wilsonian.setX(350);
wilsonian.setY(350);
}
public void draw() 
{
  background(125);
  
  for(int i = 0; i < theSky.length; i++) {
  theSky[i].show();
}
  wilsonian.move();
  wilsonian.show();
}
public void keyPressed() {
    if(keyCode == LEFT) { // left key
      wilsonian.rotate(-15);
    }
    if(keyCode == RIGHT) { //right key
      wilsonian.rotate(15);
    }
    if(keyCode == 38) { //up key
      wilsonian.accelerate(.2);
    }
    if(keyCode == DOWN) { // down key
      wilsonian.accelerate(-.2);
    }
//hyperspace
  if(keyCode == 79) //o key 
  {
    //direction
    wilsonian.setDirectionX(0);
    wilsonian.setDirectionY(0);
    //position
    wilsonian.setX((int)(Math.random()*700));
    wilsonian.setY((int)(Math.random()*700));
    wilsonian.setPointDirection((int)(Math.random()*360));
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip() {
  corners = 5;
  //xCorners = new int[corners];
  //yCorners = new int[corners];
 /* xCorners[0] = -10;
  yCorners[0] = -10;
  xCorners[1] = 14;
  yCorners[1] = 0;
  xCorners[2] = -10;
  yCorners[2] = 10;
  xCorners[3] = -3;
  yCorners[3] = 3;
  xCorners[4] = -3;
  yCorners[4] = -3; */
  int []xS = {-10, 14, -10, -3, -3};
  int []yS = {-10, 0, 10, 3, -3};
  xCorners= xS;
  yCorners= yS;  
}
public void setX(int x) {myCenterX = x;}
public int getX() {return (int)myCenterX;}  
public void setY(int y) {myCenterY = y;}   
public int getY() {return (int)myCenterY;}  
public void setDirectionX(double x) {myDirectionX = x;} 
public double getDirectionX() {return myDirectionX;}  
public void setDirectionY(double y) {myDirectionY = y;}  
public double getDirectionY() {return myDirectionY;}  
public void setPointDirection(int degrees) {myPointDirection = degrees;}   
public double getPointDirection() {return myPointDirection;} 
}

class Asteroid extends Floater {
  int speed;
  public Asteroid() {
    speed = ((int)((Math.random()*2)-4));
    int []xS2 = {-3, -1, 2, 1, -2, -4};
    int []yS2 = {-3, -4, -2, 1, 2, 0};
    xCorners = xS2;
    yCorners = yS2;
  }
public void setX(int x) {myCenterX = x;}
public int getX() {return (int)myCenterX;}  
public void setY(int y) {myCenterY = y;}   
public int getY() {return (int)myCenterY;}  
public void setDirectionX(double x) {myDirectionX = x;} 
public double getDirectionX() {return myDirectionX;}  
public void setDirectionY(double y) {myDirectionY = y;}  
public double getDirectionY() {return myDirectionY;}  
public void setPointDirection(int degrees) {myPointDirection = degrees;}   
public double getPointDirection() {return myPointDirection;} 
}

class Stars {
  private int myX, myY;
  public Stars() {
  myX = (int)(Math.random()*700);
  myY = (int)(Math.random()*700);
  }
  public void show() {
    fill(0,255,0);
    ellipse(myX, myY, 5, 5);
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor; 
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX > width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX < 0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY > height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

