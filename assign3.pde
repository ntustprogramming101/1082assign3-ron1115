final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
//
float  x=100,y=100;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24, soil0, soil1, soil2, soil3, soil4, soil5, stone1, stone2;
PImage ghd,gh,ghl,ghr,life;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

//size
int asize = 80;
//life
int lifepoint=2;
int lifex=10;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
  soil0= loadImage("img/soil0.png");
  soil1= loadImage("img/soil1.png");
  soil2= loadImage("img/soil2.png");
  soil3= loadImage("img/soil3.png");
  soil4= loadImage("img/soil4.png");
  soil5= loadImage("img/soil5.png");
  life = loadImage("img/life.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
}


void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.
 
    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */
     
    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);
    

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		
    for(int i =0;i<8;i++){
      for(int y =0;y<4;y++){
      image(soil0,i*80,80*2+y*80,80,80);
    }
    }
     for(int i =0;i<8;i++){
      for(int y =0;y<4;y++){
      image(soil1,i*80,80*6+y*80,80,80);
    }
    }
     for(int i =0;i<8;i++){
      for(int y =0;y<4;y++){
      image(soil2,i*80,80*10+y*80,80,80);
    }
    }
      for(int i =0;i<8;i++){
      for(int y =0;y<4;y++){
      image(soil3,i*80,80*14+y*80,80,80);
    }
    }
      for(int i =0;i<8;i++){
      for(int y =0;y<4;y++){
      image(soil4,i*80,80*18+y*80,80,80);
    }
    }
      for(int i =0;i<8;i++){
      for(int y =0;y<4;y++){
      image(soil5,i*80,80*22+y*80,80,80);
    }
    }
//rock1
    for(int i =0;i<8;i++){
      image(stone1,i*asize,80*2+i*asize);
      
    }
//rock2
    for(int i =0;i<8;i++){
    for(int y =0;y<8;y++){
      if(i %4==2||i %4==1){
        if(y%4==0||y%4==3){
      image(stone1,i*asize,80*10+y*asize);
    } 
   }  
  }
 }
      for(int i =0;i<8;i++){
      for(int y =0;y<8;y++){
      if(i %4==0||i %4==3){
        if(y%4==1||y%4==2){
      image(stone1,i*asize,80*10+y*asize);
    } 
   }  
  }
 }
 //rock3
     for(int i =0;i<8;i++){
       for(int y =0;y<8;y++){
      if(y%3==0){
       if(i%3==1){
           
      image(stone1,i*asize,80*18+y*asize);} 
       else if(i%3==2){
        image(stone1,i*asize,80*18+y*asize);
        image(stone2,i*asize,80*18+y*asize);
     }
    }  
   }
  }
       for(int i =0;i<8;i++){
       for(int y =0;y<8;y++){
      if(y%3==1){
       if(i%3==0){
           
      image(stone1,i*asize,80*18+y*asize);} 
       else if(i%3==1){
        image(stone1,i*asize,80*18+y*asize);
        image(stone2,i*asize,80*18+y*asize);
     }
    }  
   }
  }
       for(int i =0;i<8;i++){
       for(int y =0;y<8;y++){
       if(y%3==2){
       if(i%3==2){
           
      image(stone1,i*asize,80*18+y*asize);} 
       else if(i%3==0){
        image(stone1,i*asize,80*18+y*asize);
        image(stone2,i*asize,80*18+y*asize);
     }
    }  
   }
  }
		// Player

		// Health UI
    for(int lx1=0; lx1 < playerHealth ;lx1++){
   image(life,10+70*lx1,10,50,50);
   }
     
		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}

		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 160;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 160;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
