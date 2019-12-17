import processing.video.*;

//Movie
Movie movie;
boolean playing;

// Global variabels
//scenes
int scene = 0;
int sceneAmount = 5;

//scroller
int scrolled = 0;
int scrollSpeed = 10;

//bacground image
PImage background;

//scene and sidebar class
Sidebars sidebar;
Scenes scenes;



//---------------------------------------------------------------------------------------------------------------------------------------------------------------

void setup() {
  noStroke();
  size(1500, 690);

  //Creates objects from classes
  sidebar = new Sidebars();
  scenes = new Scenes();
  
  // load movie and determin playtype
  movie = new Movie(this, "slideShow/Esper.mov");
  //movie.loop();
  
  
  //loads background image
  background = loadImage("background.png");
}


void draw() {
  image(background, sidebar.sidebarWidth, 0);

  //calls the sidebar functions
  sidebar.display();
  sidebar.clicked();

  //calls scenes function for displaying text and slideshow
  scenes.displayText();
  scenes.displaySlide();
}

//check if mousewheel is currently being scrolle
void mouseWheel(MouseEvent event) {

  // checks if scrolled is within the texts size
  if ( scrolled >= 0 && scrolled < scenes.texts[scene].height) {

    //getCount returns a positive (+1) when scrolled up, and a negative (-1) when down.
    float e = event.getCount();
    scrolled +=  e * scrollSpeed;
  }

  // checks and make sure that scrolled is never below zero or above the texts size
  if (scrolled < 0) {
    scrolled = 0;
  } else if (scrolled > scenes.texts[scene].height - (scenes.textSizeHeight / 2) ) {
    scrolled = scenes.texts[scene].height - (scenes.textSizeHeight / 2);
  }
}

//checks if the scene is where the movie is, and if clicked inside the videos x coordinates
void mouseClicked() {
  if(scene == 4 &&
     mouseX > scenes.slideshowPosX && mouseX < scenes.textPosX - scenes.slideshowPosX - scenes.textMargin ) { 
    movie.play();
    playing = true;
  }
  
}

// Reads the next frame so it an be displayed
void movieEvent(Movie m) {
  m.read();
}
