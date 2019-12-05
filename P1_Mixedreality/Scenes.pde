class Scenes {
  PImage[] texts;
  int textPosY = 100;
  int textPosX = 1000;
  int textSizeWidth = 400;
  int textSizeHeight = 500;
  int textMargin = 10;

  Scenes(){
    texts = new PImage[sceneAmount];
      for(int i = 0; i < sceneAmount; i++) {
        texts[i] = loadImage("text/text" + i + ".png");
      }
  
  }
  
  void display() {
      fill(255);
      rect(textPosX - textMargin, textPosY - textMargin, textSizeWidth + textMargin * 2, textSizeHeight + textMargin * 2);
      image(texts[scene],textPosX, textPosY, textSizeWidth, textSizeHeight, 0, 0 + scrolled, texts[scene].width, textSizeHeight + scrolled);
  }
}
