//You should implement your assign2 here.
PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage end1;
PImage end2;
PImage bigEnemy;
PImage bomb;
PImage start1;
PImage start2;
//image
float blood_x;
//hp
float life;
//life
float treasure_x;
float treasure_y;
//hp++
float enemy_x;
float enemy_y1;
float enemy_y2;
//enemy
float fighter_x;
float fighter_y;
//player
float bg1_x;
float bg1_y;
float bg2_x;
float bg2_y;
//background
boolean fUp;
boolean fDown;
boolean fLeft;
boolean fRight;
//player speed
boolean start;
boolean end;
boolean lifeBoolean;
int m=1;
void setup () 
{
  size(640, 480) ;
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  bigEnemy=loadImage("img/Moocs-element-enemy1.png");
  bomb=loadImage("img/Moocs-element-gainbomb.png");
  blood_x=25;
  treasure_x=random(600);
  treasure_y=random(25,440);
  enemy_y2=random(420);
  enemy_y1=enemy_y2;
  enemy_x=0;
  bg1_x=0;
  bg1_y=0;
  bg2_x=640;
  bg2_y=0;
  fighter_x=320;
  fighter_y=240;
  life=3;
}
void draw()
{
  background(255);
  if(start==false&&end==false)
  {
    if(185<mouseX&&mouseX<460&&350<mouseY&&mouseY<400)
    {
      image(start2,0,0);
      if(mousePressed)
      {
        start=true;
      }
    }else
    {
      image(start1,0,0);
    }
  }
  if(start==true&&end==false)
  {
    if(bg1_x>-640){
      image(bg2,bg1_x-640,bg2_y);
      image(bg1,bg1_x--,bg1_y);
    }else{
       bg1_x=640;
       image(bg2,bg1_x-640,bg2_y);
       image(bg1,bg1_x--,bg1_y);
    }
    image(bg2,bg1_x+640,bg2_y);
    //bakegound
    if(enemy_y1>fighter_y)
    {
      enemy_y1-=2;
      enemy_x+=1;
    }
    if(enemy_y1<fighter_y)
    {
      enemy_y1+=2;
      enemy_x+=1;
    }
    if(enemy_y2>fighter_y)
    {
      enemy_y2-=2;
      enemy_x+=1;
    }
    if(enemy_y2<fighter_y)
    {
      enemy_y2+=2;
      enemy_x+=1;
    }
    if(m%3==1)
    {
      for(int i=1;i<6;i++)
      {
        image(enemy,(enemy_x++)-i*50,enemy_y1);
        enemy_x%=890;
      }
    }
    if(m%3==2)
    {
      for(int i=1;i<6;i++)
      {
        image(enemy,(enemy_x++)-i*50,enemy_y1+i*50);
        enemy_x%=890;
      }
    }
    if(m%3==0)
    {
      for(int i=0;i<5;i++)
      {
        if(i<3)
        {
          image(enemy,(enemy_x++)-i*50,enemy_y1-i*50);
          image(enemy,(enemy_x++)-i*50,enemy_y2+i*50);
          enemy_x%=890;
        }
        if(i>2&&i<4)
        {
          image(enemy,(enemy_x++)-i*50,enemy_y1+50);
          image(enemy,(enemy_x++)-i*50,enemy_y2-50);
          enemy_x%=890;
        }
        if(i>3)
        {
          image(enemy,(enemy_x++)-i*50,enemy_y1);
          enemy_x%=890;
        }
      }
    }
    if(enemy_x>882)
    {
      m++;
    }  
    //enemy
    if(fUp)
    {
      fighter_y-=10;
    }
    if(fDown)
    {
      fighter_y+=10;
    }
    if(fLeft)
    {
      fighter_x-=10;
    }
    if(fRight)
    {
      fighter_x+=10;
    }
    if(fighter_x>640)
    {
      fighter_x=0; 
    }
    if(fighter_x<0)
    {
      fighter_x=640; 
    }
    if(fighter_y>480)
    {
      fighter_y=0; 
    }
     if(fighter_y<0)
     {
      fighter_y=480; 
    }
    image(fighter,fighter_x,fighter_y);
    //player
    fill(255,0,0);
    rect(5,0,blood_x,30,10);
    image(hp,0,0);
    //hp
    image(treasure,treasure_x,treasure_y);
    //hp++
   /* if(abs(fighter_x-enemy_x)<=60&&abs(fighter_y1-enemy_y1)<=60)
   {
      enemy_y1=random(420);
      enemy_x=0;
      blood_x-=40;
        if(blood_x<5)
        {
          life--;
          blood_x=205;
        }
        if(life==0)
        {
          end=true;
        }
    }
    if(abs(fighter_x-enemy_x)<=60&&abs(fighter_y1-enemy_y1)<=60)
    {
      enemy_y1=random(420);
      enemy_x=0;
      blood_x-=40;
        if(blood_x<5)
        {
          life--;
          blood_x=205;
        }
        if(life==0)
        {
          end=true;
        }
    }*/
    if(abs(fighter_x-treasure_x)<50&&abs(fighter_y-treasure_y)<50)
    {
      blood_x+=20;
      treasure_x=random(600);
      treasure_y=random(25,440);
        if(blood_x>205)
        {
          life++;
          blood_x=blood_x-200;
        }
        
    }
  }
  if(start==true&&end==true)
  {
    if(185<mouseX&&mouseX<460&&300<mouseY&&mouseY<350){
      image(end2,0,0);
      if(mousePressed)
      {
        blood_x=25;
        treasure_x=random(600);
        treasure_y=random(25,440);
        enemy_y2=random(420);
        enemy_y1=enemy_y2;
        enemy_x=0;
        bg1_x=0;
        bg1_y=0;
        bg2_x=640;
        bg2_y=0;
        fighter_x=320;
        fighter_y=240;
        life=3;
        end=false;
      }
    }else
    {
      image(end1,0,0);
    }
  }
}
void keyPressed()
{
  if(key==CODED)
  {
    switch(keyCode)
    {
      case UP:
        fUp=true;
        break;
        
      case DOWN:
        fDown=true;
        break;
        
      case LEFT:
        fLeft=true;
        break;
        
      case RIGHT:
        fRight=true;
        break;
    }
  }
}
void keyReleased()
{
   if(key==CODED)
   {
    switch(keyCode)
    {
      case UP:
        fUp=false;
        break;
        
      case DOWN:
        fDown=false;
        break;
        
      case LEFT:
        fLeft=false;
        break;
        
      case RIGHT:
        fRight=false;
        break;
    }
  }
}
