class Scenes {
  PImage[] texts;
  PImage[] SlideScene0;
  PImage[] SlideScene1;
  PImage[] SlideScene2;
  PImage[] SlideScene3;
  PImage[] SlideScene4;
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
    SlideScene0 = new PImage[slideAmount];
    SlideScene1 = new PImage[slideAmount];
    SlideScene2 = new PImage[slideAmount];
    SlideScene3 = new PImage[slideAmount];
    SlideScene4 = new PImage[slideAmount];
    border = loadImage("slideShow/border.png");
    for (int i = 0; i < sceneAmount; i++) {
      texts[i] = loadImage("text/text" + i + ".png");
    }
    for (int i = 0; i < slideAmount; i++) {
      SlideScene0[i] = loadImage("slideShow/scene0/slide" + i + ".png");
      SlideScene1[i] = loadImage("slideShow/scene1/slide" + i + ".png");
      SlideScene2[i] = loadImage("slideShow/scene2/slide" + i + ".png");
      SlideScene3[i] = loadImage("slideShow/scene3/slide" + i + ".png");
      SlideScene4[i] = loadImage("slideShow/scene4/slide" + i + ".png");
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
    switch(scene) {
    case 0:
      image(SlideScene0[slider], slideshowPosX, textPosY - textMargin, 730, textSizeHeight + textMargin * 2);
      break;
    case 1:
      image(SlideScene1[slider], slideshowPosX, textPosY - textMargin, 730, textSizeHeight + textMargin * 2);
      break;
    case 2:
      image(SlideScene2[slider], slideshowPosX, textPosY - textMargin, 730, textSizeHeight + textMargin * 2);
      break;
    case 3:
      image(SlideScene3[slider], slideshowPosX, textPosY - textMargin, 730, textSizeHeight + textMargin * 2);
      break;
    case 4:
      image(SlideScene4[slider], slideshowPosX, textPosY - textMargin, 730, textSizeHeight + textMargin * 2);
      break;
    }
    pop();
  }

  void fade() {
    if (fade == true) {
      transparency -= 20;
    } else if (transparency < 255) {
      transparency += 20;
    }
    if (transparency < 30) {
      fade = false;
      slider = (slider + 1) % slideAmount;
    }
  }
}
