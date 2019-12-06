class Scenes {
  PImage[] texts;
  PImage[] SlideScene1;
  int slideAmount1 = 4;
  int slider;
  int slideTimer;
  int slideshowPosX = 260;
  int textPosY = 100;
  int textPosX = 1000;
  int textSizeWidth = 400;
  int textSizeHeight = 500;
  int textMargin = 10;

  Scenes(){
    texts = new PImage[sceneAmount];
    SlideScene1 = new PImage[slideAmount1];
      for(int i = 0; i < sceneAmount; i++) {
        texts[i] = loadImage("text/text" + i + ".png");
      }
      for(int i = 0; i < slideAmount1; i++) {
        SlideScene1[i] = loadImage("slideShow/slide" + i + ".png");
      }
  
  }
  
  void displayText() {
      fill(200);
      rect(textPosX - textMargin, textPosY - textMargin, textSizeWidth + textMargin * 2, textSizeHeight + textMargin * 2);
      image(texts[scene],textPosX, textPosY, textSizeWidth, textSizeHeight, 0, 0 + scrolled, texts[scene].width, textSizeHeight + scrolled);
  }
   void displaySlide() {
       image(SlideScene1[slider],slideshowPosX, textPosY - textMargin, 730 , textSizeHeight + textMargin * 2);
       slideTimer++;
       if(slideTimer % 100 == 99) {
         slider = (slider + 1) % slideAmount1;
       }
   
   }
  
 
}
