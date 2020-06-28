PImage cat, mouse, road, house, cheese, oil;

int grid = 80;
int oilX = 880;
int cheeseX = 880;
int roadX, roadY;
int houseX, houseY;
int mouse_X = grid*3;
int mouse_Y = grid*3-30;
int cat_X = -350; 
int cat_Y;
int gameSpeed = 8;

int cheeseTime=0;
int oilRan=int (random(2,6));
int cheeseRan;


boolean upState = false;
boolean downState = false;

boolean showCheese=true;
boolean showOil=true;
boolean move=true;

boolean ENTRY=false;
boolean WIN=false;
boolean LOSE=false;

int a=1;

void setup(){
  size(880, 560, P2D);
  cat = loadImage("img/cat.png");
  mouse = loadImage("img/mouse.png");
  road = loadImage("img/road.png");  
  house = loadImage("img/house.png");
  cheese = loadImage("img/cheese.png");
  oil = loadImage("img/oil.png");
}

void draw(){
  
    while(a == 1)
    {
    cheeseRan = int(random(2,6));
    if(oilRan != cheeseRan)
      a--;
      
    }  
    if(ENTRY == false)
    {
      /*PImage ENTRY;
      ENTRY=loadImage("img/entry.png");
      image(ENTRY,880,560);*/
    }
   else
   {
   if(WIN)
   {
     delay(5000);
   }
   else if(LOSE)
   {
     delay(5000);
   }
   
   if(WIN || LOSE)
   {
    ENTRY=false;
    oilX= 880;
    cheeseX= 880;
    mouse_X = grid*3;
    mouse_Y = grid*3-30;
    cat_X = -350; 
    gameSpeed = 6;
    cheeseTime=0;
    oilRan=int (random(2,6));

    upState = false;
    downState = false;
    showCheese=true;
    showOil=true;
    move=true;
    ENTRY=false;
    WIN=false;
    LOSE=false;
    a=1;
     setup();
     redraw();
   }
   
   
   bg();
   item();
   
   image( mouse, mouse_X, mouse_Y );
   image( cat, cat_X, cat_Y );
   
   if( mouse_X == grid * 9 )
   WIN = true;
   else if( mouse_X == grid * 1 )
   LOSE = true;
   
   
   if(mouse_Y + 30 + grid == oilRan*grid && move && (( mouse_X + 89 >= oilX - 44 && mouse_X - 89 <= oilX + 44) || (mouse_X - 89 >= oilX - 44 && mouse_X - 89 <= oilX + 44 )))
   {
     mouse_X -= grid;
     showOil = false;
     move = false;
   }
   if(mouse_Y + 30 + grid == cheeseRan*grid && move && (( mouse_X + 89 >= cheeseX - 44 && mouse_X - 89 <= cheeseX + 44 ) || ( mouse_X - 89 >= cheeseX - 44 && mouse_X - 89 <= cheeseX + 44 )))
   {
     mouse_X += grid;
     showCheese = false;
     move = false;
   }
   
   //mouse 
   if( upState == true ){
     if( mouse_Y > grid-30 )
     {
        mouse_Y -= grid;
        upState = false;
     }
   }
   if( downState == true ){
     if( mouse_Y < grid*5-30 )
     {
       mouse_Y += grid;
       downState = false;
     }
   }
  }
}

void bg(){ 
  
    //house
    for( int i = 0 ; i < width + house.width ; i += house.width ) 
    {      
      image( house, houseX+i, houseY );
    }
    
    //house speed
    houseX = houseX - gameSpeed;    
    if( houseX < -house.width ){
    houseX = 0;
    }
    
    //road    
    for( int i = 0 ; i < width + road.width ; i += road.width ) 
    {
      for (int j = 160 ; j < height ; j += road.height )
      {
        image( road, roadX+i, roadY+j );
      }
    }
    //road speed
    roadX = roadX - gameSpeed;    
    if(roadX < -road.width){
    roadX = 0;
    }
 
}

void item(){ 
  
    //oli   
    if( showOil )
    image( oil, oilX, grid * oilRan );
   
    //oil speed
    oilX = oilX - gameSpeed;
    if( oilX <= 0 ){
    showOil = true;
    move = true;
    oilRan = int (random(2,6));
    oilX = 880;
    }
  
   // cheese
   if( showCheese )
    image( cheese, cheeseX, grid*cheeseRan );
   
   //cheese speed
    cheeseX = cheeseX - gameSpeed;
   if( mouse_Y+1==cheeseRan&& ( mouse_X+89>cheeseX-44 || mouse_X-89<cheeseX+44 ))
   {
     mouse_X--;
   }
    if( cheeseX <= 0 )
    {
      while(true)
      {
         cheeseRan = int(random(2,6));
         if( cheeseRan != oilRan )
         {
           if( cheeseTime == 1 )
           {
             gameSpeed += 2;
             cheeseTime = 0;
           }
           cheeseTime ++;
           break;
         }
      }
    showCheese = true;
    move = true;
    cheeseX = 880;
    }
    
}


void keyPressed(){
  if( key == ENTER ){
     ENTRY = true;
  }
  if( key == CODED ){
    switch(keyCode){
      case UP:
      upState = true;
      break;
      
      case DOWN:
      downState = true;
      break;

    }
  }
}


void keyReleased(){
  if( key == CODED ){
    switch(keyCode){
      case UP:
      upState = false;
      break;
      case DOWN:
      downState = false;
      break;

    }
  }
}
