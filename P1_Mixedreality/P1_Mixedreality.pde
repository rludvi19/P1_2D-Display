// main file

int scene = 0;
int sceneAmount = 5;
int scrolled = 0;
int scrollSpeed = 10;
color chosenColor = color(60, 219, 248);
PImage background;

Sidebars sidebar;
Scenes scenes;


void setup() {
  noStroke();
  size(1500, 690);
  sidebar = new Sidebars();
  scenes = new Scenes();
  background = loadImage("background.png");
}


void draw() {
  image(background, sidebar.sidebarWidth, 0);
  sidebar.display();
  sidebar.clicked();
  scenes.displayText();
  scenes.displaySlide();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scrolled +=  e * scrollSpeed;
}
