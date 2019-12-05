// main file

void setup() {
  size(1500, 690);
  sidebar = new Sidebars();
  scenes = new Scenes();
}


void draw() {
  background(36, 110, 169);
  switch(scene) {
    case 0:
      sidebar.display();
      sidebar.clicked();
      scenes.display();
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



/*
//Drawing Background
void draw() {
  fill(36, 110, 169);
  rect(0, 0, 1000, 700);
  
  
// Drawing Sidemenu
  fill(30,100,150);
  rect(10,10,150,110);
  
  rect(10,150,150,110);
  
  rect(10,290,150,110);
  
  rect(10,430,150,110);
  
  rect(10,570,150,110);
  
//Drawing border for photos

stroke(22,33,82);
push();
strokeWeight(5);
line(200,100,900,100);
line(200,550,900,550);
line(200,550,200,100);
line(900,100,900,550);
pop();

  
text();
 
}


// main file
*/
