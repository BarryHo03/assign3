PImage bg1, bg2, enemy, fighter, hp, treasure;
float b,e,g,h,n1,n2,n3,x,y,z,w;
float speedF=5;
final int nbrEnemy=5;
float enemyX,enemyY,enemyY2;
int spacingX =70;
int spacingY =60;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup () {
  size(640, 480) ;
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  e=random(0,430);
  z=random(0,600);
  w=random(20,440);
  b=640;
  n1=1980;
  n2=990;
  n3=0;
  g=0;
  h=195;
  x=600;
  y=200;

}

void draw() { 
  //bg
  image(bg1,b-640,0);
  b++;
  b%=1280;
    
  image(bg2,g-640,0);
  g++;
  g%=1280;
  
  //hp 
  noStroke();
  fill(255,0,0);
  rect(10,0,h,20);
  image(hp,0,0);
  
  //enemy & its movement  
  for(int i=0; i<nbrEnemy;i++){  
    enemyX=n1-2330+i*spacingX;
    enemyY=e;
    image(enemy,enemyX,enemyY);
  }
  n1+=4;
  n1%=2970;
  if(n1==0||n1==2){
  e=random(240,425);
  } 
  for(int i=0;i<nbrEnemy;i++){
    enemyX=n2-2330+i*spacingX;
    enemyY=e-i*spacingY;
    image(enemy,enemyX,enemyY);
  }
  n2+=4;
  n2%=2970;
  if(n2==0||n2==2){
  e=random(120,310);
  } 
  for(int i=0;i<nbrEnemy;i++){
    enemyX=n3-2330+i*spacingX;
      if(i<=2){
        enemyY=e-i*spacingY;
      }else{
        enemyY=e-2*spacingY+(i-2)*spacingY;
      }
    image(enemy,enemyX,enemyY);
  }
  for(int i=0;i<nbrEnemy;i++){
    enemyX=n3-2330+i*spacingX;
      if(i<=2){
        enemyY2=e+i*spacingY;   
      }else{
        enemyY2=e+2*spacingY-(i-2)*spacingY;
      }
    image(enemy,enemyX,enemyY2);
  }  
  n3+=4;
  n3%=2970;
  if(n3==0||n3==2){
  e=random(0,425);
  }
    
  //fighter
  image(fighter,x,y);
  
  //treasure
  image(treasure,z,w); 
  
  //refill hp
  if(x<=z+40 && x>=z-50 && y>=w-50 && y<=w+40){
  h+=19.5;
  z=random(0,600);
  w=random(20,440);
  }
  if(h>195){
  h=195;
  }
    
  //fighter control
  if(upPressed){
    y-=speedF;
  }
  if(downPressed){
    y+=speedF;
  }
  if(rightPressed){
    x+=speedF;
  }
  if(leftPressed){
    x-=speedF;
  }
  if(x>width-50){
  x=width-50;
  }
  if(x<0){
  x=0;
  }
  if(y>height-50){
  y=height-50;
  }
  if(y<0){
  y=0;
  } 
  if(h<=0){
  }  
}
void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }      
  }
}
void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
