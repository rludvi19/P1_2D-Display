class Sidebars {
  int sidebarMargin = 10;
  int sidebarWidth = 150;
  PImage[] sidebarLogos;
  color sidebarColor = color(50,50,209);



  Sidebars() {
    sidebarLogos = new PImage[sceneAmount];
    for(int i = 0; i < sceneAmount; i++) {
      sidebarLogos[i] = loadImage("sidebar/" + i + ".png");
    }
  }
  
  
  void display() {
    fill(sidebarColor);
    rect(0,0,sidebarWidth + sidebarMargin * 2, height);
    for(int i = 0; i < sceneAmount; i++){
      fill(30,100,150);
      image(sidebarLogos[i], sidebarMargin, sidebarMargin + (i * height / sceneAmount ), sidebarWidth, height / sceneAmount - sidebarMargin*2);
      if (i == scene) {
        push();
        fill(255,150);
        rect(sidebarMargin, sidebarMargin + (i * height / sceneAmount ), sidebarWidth, height / sceneAmount - sidebarMargin*2);
        pop();
      }
    }
  }
  
  void clicked() {
    for(int i = 0; i < sceneAmount; i++){
      if( mousePressed == true &&
          mouseX >= sidebarMargin &&
          mouseX <= sidebarMargin + sidebarWidth &&
          mouseY >= sidebarMargin + (i * height / sceneAmount ) &&
          mouseY <= sidebarMargin + (i * height / sceneAmount ) + height / sceneAmount - sidebarMargin*2) {
            scene = i;
            scrolled = 0;
          }
    }
  }
}
