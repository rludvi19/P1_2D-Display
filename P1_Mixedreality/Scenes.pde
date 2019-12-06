class Scenes {
  PImage[] texts;
  PImage[] SlideScene1;
  PImage border;
  int slideAmount = 4;
  int slider;
  int slideTimer;
  int slideshowPosX = 260;
  int slideChangeTime = 150;
  int textPosY = 100;
  int textPosX = 1000;
  int textSizeWidth = 400;
  int textSizeHeight = 500;
  int textMargin = 10;
  int transparency = 255;
  boolean fade = false;

  Scenes() {
    texts = new PImage[sceneAmount];
    SlideScene1 = new PImage[slideAmount];
    border = loadImage("slideShow/border.png");
    for (int i = 0; i < sceneAmount; i++) {
      texts[i] = loadImage("text/text" + i + ".png");
    }
    for (int i = 0; i < slideAmount; i++) {
      SlideScene1[i] = loadImage("slideShow/slide" + i + ".png");
    }
  }

  void displayText() {
    image(border, slideshowPosX - 20, textPosY - textMargin - 18);
    fill(200);
    rect(textPosX - textMargin, textPosY - textMargin, textSizeWidth + textMargin * 2, textSizeHeight + textMargin * 2);
    image(texts[scene], textPosX, textPosY, textSizeWidth, textSizeHeight, 0, 0 + scrolled, texts[scene].width, textSizeHeight + scrolled);
  }


  void displaySlide() {
    fade();
    if (fade == false) {
      slideTimer++;
    }
    if (slideTimer == slideChangeTime) {
      slideTimer = 0;
      fade = true;
    }
    fill(230);
    rect(slideshowPosX, textPosY - textMargin, 730, textSizeHeight + textMargin * 2);
    push();
    tint(255, transparency);
    image(SlideScene1[slider], slideshowPosX, textPosY - textMargin, 730, textSizeHeight + textMargin * 2);
    pop();
  }

  void fade() {
    if (fade == true) {
      transparency -= 20;
    } else if (transparency < 255){
      transparency += 20;
    }
    if (transparency < 30) {
      fade = false;
      slider = (slider + 1) % slideAmount;
    }
    
  }
}
