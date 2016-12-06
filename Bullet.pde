public class Bullet extends Floater {
	private double dRadians;
	public Bullet() {
		myCenterX = wilsonian.getX();
		myCenterY = wilsonian.getY();
		dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + wilsonian.getDirectionX();
		myDirectionY = 5 * Math.sin(dRadians) + wilsonian.getDirectionY();
	}
	public void move() {
		myCenterX += myDirectionX;
		myCenterY += myDirectionY;
	}
	public void show() {
		ellipse(float(myCenterX), float(myCenterY), 7, 7);
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
}