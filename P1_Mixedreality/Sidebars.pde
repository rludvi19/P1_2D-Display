class Sidebars {
  int sidebarWidth = 170;
  PImage[] sidebarLogos;
  PImage glow;
  PImage shadow;
  color backgroundColor  = color(200);
  




  Sidebars() {
    sidebarLogos = new PImage[sceneAmount];
    glow = loadImage("sidebar/glow.png");
    shadow =loadImage("sidebar/Shadow.png");
    for(int i = 0; i < sceneAmount; i++) {
      sidebarLogos[i] = loadImage("sidebar/" + i + ".png");
    }
  }
  
  
  void display() {
    push();
    noStroke();
    fill(backgroundColor);
    rect(0, 0, sidebarWidth, height);
    for(int i = 0; i < sceneAmount; i++){
      if (i == scene) {
        push();
        fill(chosenColor);
        rect(0, (i * height / sceneAmount ), sidebarWidth, height / sceneAmount);
        pop();
      }
      fill(30,100,150);
      image(sidebarLogos[i], 0, (i * height / sceneAmount ), sidebarWidth, height / sceneAmount);
      if (i == scene) {
        image(glow,0, (i * height / sceneAmount ), sidebarWidth, height / sceneAmount);
      }
    }
    image(shadow,0, 0);
    pop();
  }
  
  void clicked() {
    for(int i = 0; i < sceneAmount; i++){
      if( mousePressed == true &&
          mouseX >= 0 &&
          mouseX <= sidebarWidth &&
          mouseY >= (i * height / sceneAmount ) &&
          mouseY <= (i * height / sceneAmount ) + height / sceneAmount) {
            push();
            noStroke();
            fill(125,100);
            rect(0, (i * height / sceneAmount ), sidebarWidth, height / sceneAmount);
            pop();
            scene = i;
            scrolled = 0;
            scenes.transparency = 255;
            scenes.slideTimer = 0;
            scenes.slider = 0;
            scenes.fade = false;
          }
    }
  }
}
