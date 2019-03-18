// 812, 1050

class TextPainter
{
  private static final String BANDS =  "Pilcrow\nEro Guro\nParts";
  private static final String WEIRD_BANDS = (char)182+"ilcrow\nEro Guro\nPart"+(char)167;
  private static final int margin = 110;
  
  //PFont consolas = createFont("Consolas", 32);
  PFont consolasBold = createFont("Consolas Bold", 32);
  PFont blackChancery = createFont("BlackChancery", 32);
  //PFont streamster = createFont("Streamster", 32);
  //PFont alien = createFont("SF Alien Encounters", 32);
  PFont yu = createFont("Yu Gothic Light", 32);
  
  private final ImageGenerator ig;
  
  TextPainter(ImageGenerator ig)
  {
    this.ig = ig;
  }
  
  int w = 300;
  int h = 180;
  PImage mask;
  PGraphics gTxt;
  PGraphics bandTxt;
  
  //final int leftX = 70;
  //final int topY = 120;
  
  final int leftX = 55;
  final int topY = 110;
  
  void setup()
  {
    String[] fontList = PFont.list();
    printArray(fontList);
    
    gTxt = createGraphics(w, h);
    gTxt.beginDraw();
    gTxt.textFont(consolasBold);
    gTxt.background(0, 0);
    gTxt.textSize(h/3);
    gTxt.textAlign(RIGHT);
    gTxt.textLeading(h/3);
    gTxt.text("Aug 23\nCoalition\n9PM", w, h/3);
    gTxt.endDraw();
    
    bandTxt = createGraphics(width, height/2);
    bandTxt.beginDraw();
    bandTxt.textFont(consolasBold);
    bandTxt.background(0, 0);
    bandTxt.textSize(width/8);
    bandTxt.textLeading(height/8);
    bandTxt.textAlign(LEFT);
    bandTxt.text(BANDS, leftX, topY);
    bandTxt.endDraw();
    
    textFont(yu);
    textSize(width/4);
    //textLeading(height/8);
    textAlign(LEFT);
  }
  
  void paintBands()
  {
    for (int i = 0; i < 4; i++)
    {
      if (i == 0)
        fill(32, 32, 64);
      if (i == 1)
        fill(32, 64, 128);
      else if (i == 2)
        fill(128, 64, 64);
      else if (i == 3)
        fill(256, 32, 32);
        
      text(WEIRD_BANDS, 100 - 10*i, 140 - 5*i);
    } 
  }
  
  void paintShadowed(String text, int numShadows, int dx, int dy, float r, float g, float b)
  {
    final int rightX = leftX + (dx * numShadows);
    final int bottomY = topY + (dy * numShadows);
    
    //r = random(255);
    //g = random(255);
    //b = random(255);
    
    for (int i = 1; i <= numShadows; i++)
    {
      //if (i < numShadows - 3)
      //  fill(16, 32, 32);
      //else if (i < numShadows - 2)
      //  fill(32, 64, 64);
      //else if (i < numShadows - 1)
      //  fill(32, 64, 128);
      //else if (i < numShadows)
      //  fill(128, 64, 64);
      //else
      //  fill(256, 32, 32);
      
      //fill(random(255), random(255), random(255));
      
      //if (i < numShadows - 4)
      //  r = g = b = 0;
      //else if (i < numShadows - 3)
      //{
      //  r = g = 32;
      //  b = 64;
      //}
      //else if (i < numShadows - 2)
      //{
      //  fill(32, 64, 128);
      //  r = 32
      //}
      //else if (i < numShadows - 1)
      //  fill(128, 64, 64);
      //else
      //  fill(256, 32, 32);
      
      int red = ((int)r / numShadows) * i;
      int green = ((int)g / numShadows) * i;
      int blue = ((int)b / numShadows) * i;
      
      fill(red, green, blue);
      
      text(text, rightX - dx*i, bottomY - dy*i);
    }
  }
  
  // just white, or a dull / off white yellow (barely yellow)
  // I might try a single drop shadow?
  void paintBandsBoring()
  {
    fill(250, 255, 192);
    
    text("Pilcrow\nParts\nGiving Up", leftX, topY);
  }
  
  void paintBandsMasked()
  {
    //PImage mask = ig.generateMaskImage(width, height/2);
    PImage mask = ig.bloody(width, height/2);
    mask.mask(bandTxt);
    image(mask, 0, 0);
  }
  
  
  //251, 255, 206
  void paintBandsDull()
  {
    fill(128, 0, 64);
    text(BANDS, leftX + 5, topY + 5);
    
    fill(250, 255, 192);
    text(BANDS, leftX, topY);
  }
  
  void paintVenue()
  {
    PImage mask = ig.generateMaskImage(w, h);
    mask.mask(gTxt);
    image(mask, width - w - margin/2, height - h - margin/2);
  }
  
  void paintShadow()
  {
    fill(64, 0, 128);
    text(BANDS, leftX + 5, topY + 5);
  }
}
