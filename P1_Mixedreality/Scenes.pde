class Scenes {

  // Slideshow variables
  // Image arrays for the slides on each scene
  PImage[] SlideScene0;
  PImage[] SlideScene1;
  PImage[] SlideScene2;
  PImage[] SlideScene3;
  PImage[] SlideScene4;

  // video Placement
  int videoCrop = 200; //crops the video to fit the space

  // Shadow border for image and text
  PImage border;
  int borderDisplace = 20;
  
  PImage videoBackground;

  int[] slideAmount;       // amount of images
  int slider;                // Current image
  int slideCounter = 100;          // Counter for how long the image have been on screen
  int slideshowPosX = 260;   // Position of the slideshows left side
  int slideChangeTime = 150; // when to change to the next image
  int transparency = 255;    // transparency of the image (255 means no transparency)
  boolean fade = false;      // indicates when the image should begin to fade away and when to go back ind
  int fadeBoundary = 30;
  int fadeSpeed = 20;
  color slideshowFadeColor = color(230);

  // Text variables
  //text as image files 
  PImage[] texts;

  // Text position and size
  int textPosY = 100;
  int textPosX = 1000;
  int textSizeWidth = 400;
  int textSizeHeight = 500;
  int textMargin = 10;
  color textBackground = color(121, 157, 156);

  //---------------------------------------------------------------------------------------------------------------------------------------------------------------

  // Constructor for the scene class 
  Scenes() {

    // Determines the length of the image arrays
    slideAmount = new int[sceneAmount];
    slideAmount[0] = 3;
    slideAmount[1] = 4;
    slideAmount[2] = 3;
    slideAmount[3] = 6;


    texts = new PImage[sceneAmount];
    SlideScene0 = new PImage[slideAmount[0]];
    SlideScene1 = new PImage[slideAmount[1]];
    SlideScene2 = new PImage[slideAmount[2]];
    SlideScene3 = new PImage[slideAmount[3]];

    //SlideScene4 = new PImage[slideAmount[4]];

    // Loads the border image
    border = loadImage("slideShow/border.png");
    videoBackground = loadImage("slideShow/scene4/Background.PNG");

    // Load in the text as images into the array
    for (int i = 0; i < sceneAmount; i++) {
      texts[i] = loadImage("text/text" + i + ".png");
    }

    // load the slideshow images into the array
    for (int d = 0; d < sceneAmount; d++) {
      for (int i = 0; i < slideAmount[d]; i++) {
        switch(d) {
        case 0:
          SlideScene0[i] = loadImage("slideShow/scene0/slide" + i + ".png");
          break;
        case 1:
          SlideScene1[i] = loadImage("slideShow/scene1/slide" + i + ".png");
          break;
        case 2:
          SlideScene2[i] = loadImage("slideShow/scene2/slide" + i + ".png");
          break;
        case 3:
          SlideScene3[i] = loadImage("slideShow/scene3/slide" + i + ".png");
          break;
        }
      }
    }
  }

  // Function to draw the text on screen
  void displayText() {

    // Draws the border on the slideshow aswell as the text
    image(border, slideshowPosX - borderDisplace, textPosY - textMargin - borderDisplace);

    // color of text background
    fill(textBackground);

    //background for text
    rect(textPosX - textMargin, textPosY - textMargin, textSizeWidth + textMargin * 2, textSizeHeight + textMargin * 2);

    //draw text
    image(texts[scene], textPosX, textPosY, textSizeWidth, textSizeHeight, 0, 0 + scrolled, texts[scene].width, textSizeHeight + scrolled);
  }

  // function for displaying slideshow
  void displaySlide() {

    //calls the function fade
    fade();

    // checks whether fade is false and if so increment the counter
    if (fade == false) {
      slideCounter++;
    }

    // checks if it is time to change the image
    if (slideCounter == slideChangeTime) {

      // resets the counter at set fade to true
      slideCounter = 0;
      fade = true;
    }
    fill(slideshowFadeColor);

    // draws background for slideshow so when it fades it seems more normal
    rect(slideshowPosX, textPosY - textMargin, textPosX - slideshowPosX - textMargin, textSizeHeight + textMargin * 2);
    push();

    // make the image transparent ( fade effect )
    if (transparency < 255) {
      tint(255, transparency);
    }


    // switch/case to determine what images to use, out from the scene variable
    switch(scene) {
    case 0:
      image(SlideScene0[slider], slideshowPosX, textPosY - textMargin, textPosX - slideshowPosX - textMargin, textSizeHeight + textMargin * 2);
      break;
    case 1:
      image(SlideScene1[slider], slideshowPosX, textPosY - textMargin, textPosX - slideshowPosX - textMargin, textSizeHeight + textMargin * 2);
      break;
    case 2:
      image(SlideScene2[slider], slideshowPosX, textPosY - textMargin, textPosX - slideshowPosX - textMargin, textSizeHeight + textMargin * 2);
      break;
    case 3:
      image(SlideScene3[slider], slideshowPosX, textPosY - textMargin, textPosX - slideshowPosX - textMargin, textSizeHeight + textMargin * 2);
      break;
    case 4:
    
      // display a video using the video library
       image(videoBackground, slideshowPosX, textPosY - textMargin, textPosX - slideshowPosX - textMargin, textSizeHeight + textMargin * 2);
      if (playing == true) {
        image(movie, slideshowPosX, textPosY - textMargin, textPosX - slideshowPosX - textMargin, textSizeHeight + textMargin * 2, videoCrop, 0, movie.width, movie.height);
      }
      break;
    }
    pop();
  }

  // function to create the fade effect
  void fade() {
    if (scene != 4) {
      // checks whether fade is true
      if (fade == true) {

        //begins to degrees the transparency variable by 20
        transparency -= fadeSpeed;

        // increment the transparency variable back to normal if fade equeals false
      } else if (transparency < 255) {
        transparency += fadeSpeed;
      }

      //determines when to change picture and begin to fade it back in
      if (transparency < fadeBoundary) {
        fade = false;

        // changes to next image in the slideshow
        slider = (slider + 1) % slideAmount[scene];
      }
    }
  }
}
