class Scenes {
  
  // Slideshow variables
    // Image arrays for the slides on each scene
    PImage[] SlideScene0;
    PImage[] SlideScene1;
    PImage[] SlideScene2;
    PImage[] SlideScene3;
    PImage[] SlideScene4;
    
    // Shadow border for image and text
    PImage border;
    
    int slideAmount = 4;       // amount of images
    int slider;                // Current image
    int slideCounter;          // Counter for how long the image have been on screen
    int slideshowPosX = 260;   // Position of the slideshows left side
    int slideChangeTime = 150; // when to change to the next image
    int transparency = 255;    // transparency of the image (255 means no transparency)
    boolean fade = false;      // indicates when the image should begin to fade away and when to go back ind
    int fadeBoundary = 30;
    int fadeSpeed = 20;
    
  // Text variables
    //text as image files 
    PImage[] texts;
    
    // Text position and size
    int textPosY = 100;
    int textPosX = 1000;
    int textSizeWidth = 400;
    int textSizeHeight = 500;
    int textMargin = 10;
    
//---------------------------------------------------------------------------------------------------------------------------------------------------------------

  // Constructor for the scene class 
  Scenes() {
    
    // Determines the length of the image arrays
    texts = new PImage[sceneAmount];
    SlideScene0 = new PImage[slideAmount];
    SlideScene1 = new PImage[slideAmount];
    SlideScene2 = new PImage[slideAmount];
    SlideScene3 = new PImage[slideAmount];
    SlideScene4 = new PImage[slideAmount];
    
    // Loads the border image
    border = loadImage("slideShow/border.png");
    
    // Load in the text as images into the array
    for (int i = 0; i < sceneAmount; i++) {
      texts[i] = loadImage("text/text" + i + ".png");
    }
    
    // load the slideshow images into the array
    for (int i = 0; i < slideAmount; i++) {
      SlideScene0[i] = loadImage("slideShow/scene0/slide" + i + ".png");
      SlideScene1[i] = loadImage("slideShow/scene1/slide" + i + ".png");
      SlideScene2[i] = loadImage("slideShow/scene2/slide" + i + ".png");
      SlideScene3[i] = loadImage("slideShow/scene3/slide" + i + ".png");
      SlideScene4[i] = loadImage("slideShow/scene4/slide" + i + ".png");
    }
  }

  // Function to draw the text on screen
  void displayText() {
    
    // Draws the border on the slideshow aswell as the text
    image(border, slideshowPosX - 20, textPosY - textMargin - 18);
    
    // color of text background
    fill(121,157,156);
    
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
    fill(230);
    
    // draws background for slideshow so when it fades it seems more normal
    rect(slideshowPosX, textPosY - textMargin, 730, textSizeHeight + textMargin * 2);
    push();
    
    // make the image transparent ( fade effect )
    tint(255, transparency);
    
    // switch/case to determine what images to use, out from the scene variable
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

  // function to create the fade effect
  void fade() {
    
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
      slider = (slider + 1) % slideAmount;
    }
  }
}
