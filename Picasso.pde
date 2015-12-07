String path = "/home/toto/Pictures/Picasso4.jpg";

PImage picasso = loadImage(path);

int threshold = 200;
boolean right = true;

void setup(){
  if(picasso.height * 2 > 1000){
    size(picasso.width * 2, picasso.height);
  } else {
    size(picasso.width, picasso.height * 2);
    right = false;
  } 
  
  getDrawing(picasso, threshold, right);
}

void draw(){ 
}

void keyPressed(){
  switch(key){
    case '+':
      threshold++;
      println("Threshold: " + threshold);
      
      getDrawing(picasso, threshold, right);
      
      break;
    case '-':
      threshold--;
      println("Threshold: " + threshold);
      
      getDrawing(picasso, threshold, right);
      
      break;
    default:
      break;
  }
}

void getDrawing(PImage acImage, int threshold, boolean right){            //must change return value, to return xy coordinates 
  acImage.loadPixels();
  background(0);
  
  if(right){
    image(acImage, acImage.width, 0);
  } else {
    image(acImage, 0, acImage.height);
  }
  
  for(int y = 0; y < acImage.height; y++){                                //Maybe use onlye one for loop?
    for(int x = 0; x < acImage.width; x++){
      color acColor = acImage.pixels[x + (y * acImage.width)];
      
      if(red(acColor) > threshold && green(acColor) > threshold && blue(acColor) > threshold){
        stroke(255);
        point(x, y);
      }
    }
  }
}
