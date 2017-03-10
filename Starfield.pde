//your code here
Particle[] myNormalParticle;
int dimx = 800, dimy = 600;
void setup()
{
  size(800,600);
  background(0,0,0,33);
  smooth();
  noStroke();
  myNormalParticle = new Particle[300];
  //myNormalParticle[0] = new OddballParticle();
  for(int i = 0; i < myNormalParticle.length; i++){
    if(i == 0)
      myNormalParticle[i] = new OddballParticle();
    else if(i == 1)
      myNormalParticle[i] = new JumboParticle();
    else if(i > 1 && i < 200)
      myNormalParticle[i] = new DustParticle();
    else
      myNormalParticle[i] = new NormalParticle();
  }
  //NormalParticle myParticle = new NormalParticle();
  //your code here
}
void draw()
{
  //your code here
  //NormalParticle myParticle = new NormalParticle();
  fill(0,0,0,33);
  rect(0,0,800,600);
  for(int i = 0; i < myNormalParticle.length; i++){
    myNormalParticle[i].move();
    myNormalParticle[i].show();
  }
}
class DustParticle extends OddballParticle{
  public DustParticle(){
    x = random(1,800);
    y = random(1,600);
    speed = random(1,3);
  }
    public void show(){
    colorR = (int)random(0,255);
    colorG = (int)random(0,255);
    colorB = (int)random(0,255);
    fill(colorR,colorG,colorB,50);
    ellipse((int)x, (int)y, 5, 5);
  }
}
class JumboParticle extends NormalParticle{
 public void show(){
   fill(#F24747);
   ellipse((int)x, (int)y, 50, 50);
 }
 public void move(){
   x += v*Math.cos(theta)*speed;
   y += v*Math.sin(theta)*speed;
   if(x > dimx){
     theta = Math.PI - theta;
   }
   if(y > dimy){
     theta *= -1;
   }
   if(x < 0){
     theta = Math.PI - theta;
   }
   if(y < 0){
     theta *= -1;
   }
 }
}
class NormalParticle implements Particle
{
  double x,y,v,speed,theta;
  int colorR,colorG,colorB;
  
  public NormalParticle(){
    x = 250;
    y = 250;
    v = Math.random()*7 + 3;
    speed = random(1,3);
    theta = random(1,50);
    theta = Math.random()*2*Math.PI;
  }
  
  public void move(){
    x += Math.cos(theta)*speed;
    y += Math.sin(theta)*speed;
    if(x > dimx || y > dimy || x < 0 || y < 0){
      x = mouseX;
      y = mouseY;
    }
  }
  
  public void show(){
    //colorR = (int)random(0,255);
    //colorG = (int)random(0,255);
    //colorB = (int)random(0,255);
    fill(#FCF340);
    ellipse((int)x,(int)y,10,10);
  }
}
class OddballParticle implements Particle//uses an interface
{
  //your code here
  double x,y,speed,theta;
  int colorR,colorG,colorB;
  
  public OddballParticle(){
    x = 250;
    y = 250;
    speed = random(1,3);
    //theta = Math.random()*2*Math.PI;
  }
  
  public void move(){
    //rotate(.001);
    theta = Math.random()*2*Math.PI;
    x += Math.cos(theta)*speed;
    y += Math.sin(theta)*speed;
    if(x > dimx || y > dimy || x < 0 || y < 0){
      x = mouseX;
      y = mouseY;
    }
  }
  
  public void show(){
    colorR = 23;
    colorG = 28;
    colorB = (int)random(200,255);
    fill(colorR, colorG, colorB, random(95,100));
    rect((int)x,(int)y,50,50);
  }
}
interface Particle
{
  //your code here
  public void show();
  public void move();
}
