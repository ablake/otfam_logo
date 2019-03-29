class TextPainter
{
  PFont yu = createFont("Yu Gothic Light", 32);
  
  private final ImageGenerator ig;
  
  TextPainter(ImageGenerator ig)
  {
    this.ig = ig;
  }
  
  int w = 300;
  int h = 180;
  
  final int leftX = 55;
  final int topY = 110;
  
  void setup()
  {
    textFont(yu);
    textSize(width/4);
    textAlign(LEFT);
  }
  
  void paintShadowed(String text, int numShadows, int dx, int dy, float r, float g, float b)
  {
    final int rightX = leftX + (dx * numShadows);
    final int bottomY = topY + (dy * numShadows);
    
    for (int i = 1; i <= numShadows; i++)
    {
      int red = ((int)r / numShadows) * i;
      int green = ((int)g / numShadows) * i;
      int blue = ((int)b / numShadows) * i;
      
      fill(red, green, blue);
      
      text(text, rightX - dx*i, bottomY - dy*i);
    }
  }
}
