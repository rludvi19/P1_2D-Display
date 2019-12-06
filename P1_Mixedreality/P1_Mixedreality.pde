// main file

int scene = 0;
int sceneAmount = 5;
int scrolled = 0;
int scrollSpeed = 10;

Sidebars sidebar;
Scenes scenes;


void setup() {
  noStroke();
  size(1500, 690);
  sidebar = new Sidebars();
  scenes = new Scenes();
}


void draw() {
  background(100);
  switch(scene) {
    case 0:
      sidebar.display();
      sidebar.clicked();
      scenes.displayText();
      scenes.displaySlide();
      break;
    case 1:
      sidebar.display();
      sidebar.clicked();
      break;
    case 2:
      sidebar.display();
      sidebar.clicked();
      break;
    case 3:
      sidebar.display();
      sidebar.clicked();
      break;
    case 4:
      sidebar.display();
      sidebar.clicked();
      break;
    case 5:
      sidebar.display();
      sidebar.clicked();
      break;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scrolled +=  e * scrollSpeed;
}

  
