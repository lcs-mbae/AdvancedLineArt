// reserve space in memory for an object of type PImage, t o store the source image //<>//
PImage source;  

// setup() function runs once only
void setup() {

  // create the canvas
  // WIDTH  HEIGHT
  size(272, 185); 

  // make the backgound white
  background(255);

  // load "download-1.jpg" from the "data" folder into source object 
  source = loadImage("download-1.jpg");

  // we want to manipulate the pixels of this image directly
  // creates an array named "source.pixels"
  // array will have 424,000 values (width * height = 800 * 530 = 424,000)
  // the array will start at position 0
  // and with 424,000 values
  // the final position will then be at 423,999
  source.loadPixels();

  // loop from first pixel, at position 0, to final pixel, at position 423,999
  for (int position = 0; position <= 50319; position += 1) {

    // get brightness of current pixel
    float b = 255-brightness(source.pixels[position]);

    // change brightness value (range of 0 to 255) into a diameter of range 1 to 10 
    float diameter = map(b, 0, 255, 1, 10);

    // get the pixel's current position using integer arithmetic, see: http://russellgordon.ca/lcs/ics3u/integer_arithmetic.jpg
    int x = position % width;  // remainder after integer division e.g.: 13 % 5 = 3 
    int y = position / width;  // integer division e.g.: 13 / 5 = 2

    //only draw an ellipse for some pixels (every 10th pixel)
    //BOOLEAN OPERATORS
    // && Let's us check TWO conditions 
    // only run what's in the code block when BOTH conditions are true
    //     CONDITION1 AND CONDITION2
    if ((x > 0) && (y > 0) && (y % 3 == 0) && (x % 3 == 0)) {
      
      // draw an ellipse at position of current pixel
      ellipse (x, y, diameter, diameter);
      
  }
  
  }
  save("output");
}

// draw() runs repeatedly until we tell it to stop
void draw() {

  // we don't need to animate, so stop the automatic loop
  noLoop();
}
