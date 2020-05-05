public int seed = int(random(-400,400));

public int posX = 1920/2 + seed; // position of the image, hereafter updated every frame
public int posY = 1080/2; // ^
public int speedX = 1; // constant speed of image, flipped when edge is encountered 
public int speedY = 1; // ^

public PImage img;
public int r = 255;
public int g = 100;
public int b = 0;

public int n = 5; // the number of images in folder (if up to image3.png, this would be '4')

void setup() {
  fullScreen();
  background(0,0,0);
  img = loadImage("image1.png"); // load image1 as the starting image
}

void draw() {
  background(0,0,0); // remove image left by previous frame
  
  // update image position by adding Δposition
  posX = posX + speedX;
  posY = posY + speedY;
  
  // show the image
  image(img,posX,posY);
  
  checkBorders(); // call function that flips direction if necessary
  
}

public void checkBorders() {    
    // HORIZONTAL SPEED FLIPPER
    if (speedX > 0) {
      if ((posX+img.width) >= 1920) {
        speedX = speedX * -1;
        replaceImage();
      }
    }
    if (speedX < 0) {
      if (posX <= 0) {
        speedX = speedX * -1;
        replaceImage();
      }
    }
    
    // VERTICAL SPEED FLIPPER
    if (speedY > 0) {
      if (posY+img.height >= 1080) {
        speedY = speedY * -1;
        replaceImage();
      }
    }
    if (speedY < 0) {
      if (posY <= 0) {
        speedY = speedY * -1;
        replaceImage();
      }
    }
}

public void replaceImage() {
  img = loadImage("image" + int(random(1,n)) + ".png");
  
  // generate suitable colour and apply to image
  r = 200 + int(random(55));
  g = 200 + int(random(55));
  b = 200 + int(random(55));
  tint(r,g,b);
}
