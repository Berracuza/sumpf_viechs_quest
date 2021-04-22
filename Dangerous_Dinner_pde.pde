import processing.sound.*;

//Fly 0
PImage fly;
float flyVY;
float flyX ;
float flyY ;

//Fly 1
float fly1VY;
float fly1X ;
float fly1Y ;

//Fly 2
float fly2VY;
float fly2X ;
float fly2Y ;

//Pilz
PImage Pilz;
float PilzVY;
float PilzX ;
float PilzY ;

//Background
PImage sumpf;
PImage rose;
PImage blood;

//hearts
PImage heart;


//Tongue 
int tongue= 0;

float BauchW = 100, BauchH = 80;
int Score=0;
int ScoreH=0;
int ScoreM= 1;
int n = 0;
int lives=5;
int end=2;
SoundFile Slurp;
SoundFile GameOver;
SoundFile music;
SoundFile dmg;
PFont title;

void setup()
{
  size(1024,700);  
  //size(1920,960);
  
  //images
  fly = loadImage("Fly.png");
  Pilz = loadImage("Pilz.png");
  heart=  loadImage("pixel_heart.png");
  sumpf = loadImage("sumpf.jpg");
  rose=  loadImage("Lilypad1.png");
  blood=loadImage("blood.png");
  
    //Sounds  
  Slurp=new SoundFile (this,"Slurp.wav");
  GameOver=new SoundFile (this,"Gameover.wav");
  music=new SoundFile (this,"nosleep.mp3");
  dmg=new SoundFile (this,"dmg.wav");
  
  initGame();   
  //BG Music
  music.loop();
}
void draw()
{ if(end==0){
   //Testversion
  //translate(500,200);
  
  //TheSumpfViech
  stroke(0);
  fill(255);
  image (sumpf, 0, 0);
  image(rose,440,625);
  //hearts
  heart.resize(30,45);
  if(lives==5){
  image(heart, 950, 30);
  image(heart, 915, 30);
  image(heart, 880, 30);
  image(heart, 845, 30);
  image(heart, 810, 30);}
  if(lives==4){
  image(heart, 950, 30);
  image(heart, 915, 30);
  image(heart, 880, 30);
  image(heart, 845, 30);}
  if(lives==3){
  image(heart, 950, 30);
  image(heart, 915, 30);
  image(heart, 880, 30);}
  if(lives==2){
  image(heart, 950, 30);
  image(heart, 915, 30);}
  if(lives==1){
  image(heart, 950, 30);}
  
  //Fuesse
  fill(255,0,0);
  ellipse(490,660,25,17);
  ellipse(534,660,25,17);
  //Bauch
  fill(0,100,0);
  ellipse(512,618,BauchW,BauchH);
  //Kopf
  fill(0,160,0);
  ellipse(512,550,85,85);
  //Augen
  fill(255);
  ellipse(494,545,20,20);
  ellipse(530,545,20,20);
  //Pupillen
  fill(0); 
  ellipse(499,548,7,7);
  ellipse(527,542,6,6);
  //Mund
  fill(255,0,0);
  ellipse(512,570,30,30);
  fill(0);
  ellipse(512,570,20,20);
  //Ohren
  fill(90,200,90);
  ellipse(490,510,17,25);
  ellipse(534,510,17,25);
  //Viech Ende
  
  
  //Title
  textAlign(CENTER,TOP);
  fill(0);
  textFont(title);
  text("Dangerous Dinner \n Score:",512,30);
  textSize(25);
  fill(255,0,0);
  text("Press Backspace to restart",880,669);
  //Score
  textSize(40);
  fill(255,0,0);
  text(Score,512,150);
  //Multiplikator
  text(ScoreM,60,30);
  text("x",40,30);
  
  //Pilz
  image (Pilz, PilzX, PilzY);
  PilzY = PilzY + PilzVY/frameRate;
  if (PilzY>800)
  {
  PilzY=PilzY - 1000;
  PilzX = random(0, 1024 - Pilz.width);
  }
   //Fly 0
  image (fly, flyX, flyY);
  flyY = flyY + flyVY/frameRate;
  if (flyY>800)
  {
  flyY=flyY - 1000;
  flyX = random(0+fly.width, 1024 - fly.width);
  }
  if (flyY>700 && flyY<799){
    lives=lives-1; 
    dmg.play();
    flyY=800;
     }
   //Fly 1
  if (flyY>-50||fly1Y>flyY){
  image (fly, fly1X, fly1Y);
  fly1Y = fly1Y + fly1VY/frameRate;
    if (fly1Y>800)
    {
    fly1Y=fly1Y - 1000;
    fly1X = random(0+fly.width, 1024 - fly.width);
    }
   if (fly1Y>700 && fly1Y<799)
   {lives=lives-1;
   dmg.play();
   fly1Y=800;
  } 
}
  //Fly 2
  if (flyY>0||fly2Y>flyY){
  image (fly, fly2X, fly2Y);
  fly2Y = fly2Y + fly2VY/frameRate;
    if (fly2Y>800)
    {
    fly2Y=fly2Y - 1000;
    fly2X = random(0+fly.width, 1024 - fly.width);
    }
    if(fly2Y>700 && fly2Y<799)
    { 
      lives = lives-1;
      dmg.play();
      fly2Y=800;
    }
}  
  //Zunge
  if(tongue > 0) 
  {
   tongue = tongue -1;
   noFill();
   stroke(255,0,0);
   strokeWeight(10);
   bezier(512,570,mouseX*random(0.9,1.2),mouseY*random(0.9,1.2),mouseX*random(0.9,1.2),mouseY*random(0.9,1.2),mouseX,mouseY);
   strokeWeight(1);
    }
    //LVL Design
  
  if (n==15)
  {
    ScoreM=2;
    flyVY = flyVY + 2500/frameRate;
    fly1VY = fly1VY + 2500/frameRate;
    fly2VY = fly2VY +2500 /frameRate;
    PilzVY = PilzVY + 2500/frameRate;
    n=16;
  }
  if (n==30)
  {
    ScoreM=3;
    flyVY = flyVY + 2500/frameRate;
    fly1VY = fly1VY + 2500/frameRate;
    fly2VY = fly2VY + 2500/frameRate;
    PilzVY = PilzVY + 2500/frameRate;
  n=31;
  } 
  if (n==45)
  {
    ScoreM=4;
    flyVY = flyVY + 2000/frameRate;
    fly1VY = fly1VY + 2000/frameRate;
    fly2VY = fly2VY + 2000/frameRate;
    PilzVY = PilzVY + 2000/frameRate;
   n=46;
  }
  if (n==60)  
  {
    ScoreM=5;
    flyVY = flyVY + 2000/frameRate;
    fly1VY = fly1VY + 2000/frameRate;
    fly2VY = fly2VY + 2000/frameRate;
    PilzVY = PilzVY + 2000/frameRate;
  n=61;
  }
  if (n==75)  
  {
    ScoreM=6;
    flyVY = flyVY + 2000/frameRate;
    fly1VY = fly1VY + 2000/frameRate;
    fly2VY = fly2VY + 2000/frameRate;
    PilzVY = PilzVY + 2000/frameRate;
    n=76;
  }
   if (n==90)  
  {
    ScoreM=7;
    flyVY = flyVY + 1500/frameRate;
    fly1VY = fly1VY + 1500/frameRate;
    fly2VY = fly2VY + 1500/frameRate;
    PilzVY = PilzVY + 1500/frameRate;
    n=91;
  }
    if (n==105)  
  {
    ScoreM=8;
    flyVY = flyVY + 1500/frameRate;
    fly1VY = fly1VY + 1500/frameRate;
    fly2VY = fly2VY + 1500/frameRate;
    PilzVY = PilzVY + 1500/frameRate;
    n=106;
  }
  //GAME OVER SCREEN
   if(lives<=0){
   end=1;
   background(0);
     //Kopf
    stroke(0);
    fill(0,160,0);
    ellipse(512,550,85,85);
      //Augen
    fill(255);
    ellipse(494,545,30,30);
    ellipse(530,545,30,30);
    //Pupillen
    fill(0); 
    ellipse(494,545,20,20);
    ellipse(530,545,20,20);
    //Mund
    fill(255,0,0);
    ellipse(512,570,30,30);
    fill(0);
    ellipse(512,570,20,20);
      //Ohren
    fill(90,200,90);
    ellipse(490,510,17,25);
    ellipse(534,510,17,25);
  
   image(blood, 700-blood.width, 420-blood.height);
   fill(255,0,0);
   text("GAME OVER",512,350);
   text("Press Backspace to restart",512,630);
   GameOver.play();
   
   //HighScore
   if(Score>ScoreH)
   {
   ScoreH = Score;
   }
   textAlign(LEFT,TOP);
   text(ScoreH,950,40);
   text("Highscore:",700,40);
}
   }
   if(end==2){
   textAlign(CENTER,TOP);
   fill(0);
   textFont(title);
   image (sumpf, 0, 0);
   text("Dangerous Dinner",512,30);
   textAlign(LEFT,TOP);
   text("Fange alle Fliegen (Cursor)!\nMeide die Pilze!\nDu hast fünf Leben!",100,200);
   image (fly, 653, 188);
   image (Pilz, 640, 250);
   heart.resize(45,70);
   image(heart, 662, 327);
   textAlign(CENTER,TOP);
   textSize(65);
   fill(255,0,0);
   text("Press Enter to start",512,500);
    } 
    } 
   void mousePressed(){
    //Fly 0 catch
    if(flyX<=mouseX && mouseX<=flyX+fly.width && flyY<=mouseY&& mouseY<=flyY+fly.height)
    {
     flyY=810; Score=Score+1*ScoreM;
     n = n+1;BauchW=BauchW+(n/20);
    BauchH=BauchH+(n/25);
    Slurp.play();
    }
       //Fly 1 catch
    if(fly1X<=mouseX && mouseX<=fly1X+fly.width && fly1Y<=mouseY&& mouseY<=fly1Y+fly.height)
    {
     fly1Y=810; Score=Score+1*ScoreM;
    n = n+1;BauchW=BauchW+(n/20);
    BauchH=BauchH+(n/25);
    Slurp.play();
    }
    //Fly 2 catch
    if(fly2X<=mouseX && mouseX<=fly2X+fly.width && fly2Y<=mouseY&& mouseY<=fly2Y+fly.height)
    {
     fly2Y=810; Score=Score+1*ScoreM;
     n = n+1;  BauchW=BauchW+(n/20);
    BauchH=BauchH+(n/25);
    Slurp.play();
    }
    //Pilz catch
    if(PilzX<=mouseX && mouseX<=PilzX+Pilz.width && PilzY<=mouseY&& mouseY<=PilzY+Pilz.height)
    {
     PilzY=810;
     lives = lives-1;
     dmg.play();
    }
    
  tongue = 8;
  }
  void keyPressed() { 
  if (keyCode==BACKSPACE)
  {
  lives=5;
  Score=0;
  ScoreM=1;
  n=0;
  BauchW = 100;
  BauchH = 80;
  initGame();
  end=0;
  }
  if (keyCode==ENTER) {
  end=0;
  }
  }
  
  void initGame(){
  
  //title
  title = createFont("mrsmonster.ttf",46);
  
  //Fly 0
  flyVY = random(8000, 10000)/frameRate;
  flyX = random(0, 1024 - fly.width);
  flyY = random(-450,-200 - fly.height);
  
  //Fly 1
  fly1VY = random(8000, 10000)/frameRate;
  fly1X = random(0, 1024 - fly.width);
  fly1Y = random(-450,-200 - fly.height);
  
  //Fly 2
  fly2VY = random(8000, 10000)/frameRate;
  fly2X = random(0, 1024 - fly.width);
  fly2Y = random(-450,-200 - fly.height);
  
   //Pilz
  Pilz.resize(80,70);
  PilzVY = random(8000, 10000)/frameRate;
  PilzX = random(0, 1024 - Pilz.width);
  PilzY = random(-4500,-4000 - Pilz.height);
  
  //Hintergrund
  sumpf.resize(1024,700);
  rose.resize(180,70);
  blood.resize(420,300);}
