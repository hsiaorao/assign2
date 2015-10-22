//Image
PImage fighterImg;
PImage hpImg;
PImage treasureImg;
PImage enemyImg;
PImage bg1Img;
PImage bg2Img;
PImage start1Img;
PImage start2Img;
PImage end1Img;
PImage end2Img;

//int
int hpX,treasureX,treasureY,enemyX,enemyY,bgX;
int gameState;
final int GAME_START=1,GAME_RUN=2,GAME_END=3;

//float
float fighterX,fighterY;
float fighterSpeed=5;

//boolean
boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

void setup () {
  size(640, 480) ;
  gameState=GAME_START;
  
  //hp
  hpImg=loadImage("img/hp.png");
  hpX=floor(random(10,190)); 

  //fighter
  fighterImg=loadImage("img/fighter.png");  
  fighterX=500;
  fighterY=240;

  //enemy
  enemyImg=loadImage("img/enemy.png");
  enemyX=0;
  enemyY=floor(random(45,415));

  //background
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");  
  bgX=0;

  //treasure
  treasureImg=loadImage("img/treasure.png");
  treasureX=floor(random(20,535));
  treasureY=floor(random(45,435));

  //start window
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png"); 

  //end window
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");  
}

void draw() {
  switch(gameState){
  //game start 
    case GAME_START:
    image(start2Img,0,0);
     if(mouseX>200 && mouseX<500 && mouseY >400 && mouseY<450){
      image(start1Img,0,0);
     }
    break;
    
    case GAME_RUN:

    break;
    
    case GAME_END:

    break;
  }
  
  //background
  image(bg1Img,bgX,0);
  image(bg2Img,bgX-640,0);
  image(bg1Img,bgX-1280,0);
  bgX+=1;
  bgX%=1280;

  //fighter
  image(fighterImg,fighterX,fighterY);

  //hp
  rect(20,10,hpX,30);
  fill(255,0,0);
  image(hpImg,10,10);

  //treasure
  image(treasureImg,treasureX,treasureY);

  //enemy
  image(enemyImg,enemyX,enemyY);
  enemyX+=3;
  enemyX%=640;

  //move
  if(upPressed){
    fighterY-=fighterSpeed;
  }
  if(downPressed){
    fighterY+=fighterSpeed;
  }  
  if(leftPressed){
    fighterX-=fighterSpeed;
  }  
  if(rightPressed){
    fighterX+=fighterSpeed;
  }

  //boundary detection
  } 


void keyPressed(){
  //game start
      if(mousePressed){
        //click
        gameState=GAME_RUN;        
      }
  //move
  if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=true;
        break;
      case DOWN:
        downPressed=true;
        break;
      case LEFT:
        leftPressed=true;
        break;  
      case RIGHT:
        rightPressed=true;
        break;  
    }
  }
}

void keyReleased(){
    if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=false;
        break;
      case DOWN:
        downPressed=false;
        break;
      case LEFT:
        leftPressed=false;
        break;  
      case RIGHT:
        rightPressed=false;
        break;  
    }
  }
}
