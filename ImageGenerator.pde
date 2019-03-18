class ImageGenerator
{
  PImage generateBackground()
  {
    final int imgWidth = 500;
    final int imgHeight = 500;
    
    PImage img = createImage(imgWidth, imgHeight, ARGB);
    
    float angle = 0.0;
    float inc = (TWO_PI/(imgWidth*2));
    
    for(int i = 0; i < img.pixels.length; i++)
    {
      float asc = map(i, 0, img.pixels.length, 0, 255);
      float desc = map(i, 0, img.pixels.length, 255, 128);
      
      float r = asc * 0.45;
      float g = desc * sin(angle) * random(0.666);
      float b = desc * random(1);
      
      img.pixels[i] = color(r, g, b, 255);
      
      angle = angle + inc;
    }
    
    img.resize(width, height);
    
    return img;
  }
  
  PGraphics generateMask(int w, int h)
  {
    PGraphics mask = createGraphics(w, h);
    mask.beginDraw();
    mask.background(255, 255, 255);
    for(int i=0;i<100;i++)
    {
      mask.stroke(0, 0, 0);
      mask.line(random(mask.width),random(mask.height),random(mask.width),random(mask.height));
    }
    mask.endDraw();
    
    return mask;
  }
  
  PImage generateMaskImage(int w, int h)
  {
    PImage img = createImage(w, h, ARGB);
    
    float angle = 0.0;
    float inc = (TWO_PI/(w*8));
    
    for(int i = 0; i < img.pixels.length; i++)
    {
      float desc = map(i, 0, img.pixels.length, 256, 64);
      
      float r = desc - random(64);
      float g = abs(sin(angle)) * random(192) + 64;
      float b = random(255);
      
      img.pixels[i] = color(r, g, b, 255);
      
      angle = angle + inc;
    }
    
    return img;
  }
  
  PImage snowy(int w, int h)
  {
    PImage img = createImage(w, h, ARGB);
    
    for(int i = 0; i < img.pixels.length; i++)
    {
      float c = 255 - random(128);
      
      img.pixels[i] = color(c, c, c, 255);
    }
    
    return img;
  }
  
  PImage bloody(int w, int h)
  {
    PImage img = createImage(w, h, ARGB);
    
    float hAngle = 0.0;
    float hInc = (TWO_PI/w);
    float yAngle = 0.0;
    float yInc = (TWO_PI/h);
    
    int len = img.pixels.length;
    for(int i = 0; i < len; i++)
    {
      //int numRows = len / w;
      int x = i % w;
      int y = (int)(((float)i / (float)len) * h);
      
      float descX = map(x, 0, w, 256, 64);
      float descY = map(y, 0, h, 256, 128);
      
      float ascX = map(x, 0, w, 32, 92);
      float ascY = map(y, 0, h, 0, 128);
      
      //float r = (sin(hAngle) + 1) / 2 * 128;
      //float r = descX;
      //float g = ascX;
      //float b = ascY;
      
      float r = descY - random(64);
      float b = ascX + random(64);
      float g = random(128) - ascY;
      
      if (x % 15 < 10)
        g = sin(hAngle) / 2 * 128;
     
      
      img.pixels[i] = color(r, g, b, 255);
      
      hAngle += hInc;
    }
    
    return img;
  }
}
