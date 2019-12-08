class Sidebars {
  int sidebarWidth = 170;
  PImage[] sidebarLogos;
  PImage glow;
  PImage shadow;
  color backgroundColor  = color(200);
  
//---------------------------------------------------------------------------------------------------------------------------------------------------------------


  // Constructor for the sidebar class
  Sidebars() {
    
    // Determins length of array
    sidebarLogos = new PImage[sceneAmount];
    
    // loads images into variables and array
    glow = loadImage("sidebar/glow.png");
    shadow =loadImage("sidebar/Shadow.png");
    for(int i = 0; i < sceneAmount; i++) {
      sidebarLogos[i] = loadImage("sidebar/" + i + ".png");
    }
  }
  
  // Function to display the sidebars
  void display() {
    push();
    noStroke();
    
    // creates the Box around the menus
    fill(backgroundColor);  // light grey
    rect(0, 0, sidebarWidth, height);
    
    // for loops that draws each scenes icon
    for(int i = 0; i < sceneAmount; i++){
      
      //checks the for loop has reach the icon for the current scene
      if (i == scene) {
        push();
        
        // Draws a rectancle in the place where the icon is gonna be
        fill(chosenColor);  // light blue color
        rect(0, (i * height / sceneAmount ), sidebarWidth, height / sceneAmount);
        pop();
      }
      
      // Draws the icons one after the others with a determined distance between them
      image(sidebarLogos[i], 0, (i * height / sceneAmount ), sidebarWidth, height / sceneAmount);
      
      // if chosen scene draws glow effect ontop
      if (i == scene) {
        image(glow,0, (i * height / sceneAmount ), sidebarWidth, height / sceneAmount);
      }
    }
    
    // draws shadow image ontop of all the icons
    image(shadow,0, 0);
    pop();
  }
  
  // functions to determined whether a scene has been clicked on
  void clicked() {
    
    // for loops that checks each icons coordinats
    for(int i = 0; i < sceneAmount; i++){
      if( mousePressed == true && // if the mouse has been pressed
          // if the mouse's X coordinates is within the icons
          mouseX >= 0 &&
          mouseX <= sidebarWidth &&
          
          // checks if the mouses Y coordinates is within the icons
          mouseY >= (i * height / sceneAmount ) &&
          mouseY <= (i * height / sceneAmount ) + height / sceneAmount) {
            
            // Draws a white rectancle ontop of the clicked icon
            push();
            noStroke();
            fill(125,100);
            rect(0, (i * height / sceneAmount ), sidebarWidth, height / sceneAmount);
            pop();
            
            //changes scene to the clicked scene
            scene = i;
            
            //resets everything to prepare for scene change
            scrolled = 0;
            scenes.transparency = 255;
            scenes.slideCounter = 0;
            scenes.slider = 0;
            scenes.fade = false;
          }
    }
  }
}
