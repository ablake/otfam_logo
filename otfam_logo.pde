// 8.5 x 11
// 0.772727

PImage images[] = new PImage[50];
ImageGenerator ig = new ImageGenerator();
Synth pc = new Synth();
TextPainter tp;

void setup()
{
  size(800, 1000);
  
  for (int i = 0; i < 50; i++)
  {
    images[i] = ig.generateBackground();
  }
  
  tp = new TextPainter(ig);
  tp.setup();
}

boolean saved = false;
int idx = 0;
int t = 0;
void draw()
{ 
  float factor = (float)millis() / 200f;
  
  image(images[idx], 0, 0);
  translate(width/2, height/2 + height/5);
  pc.powerChord(factor);
  //pc.randomPowerChord();

  resetMatrix();
  translate(0, height - height/7);
  
  int inc = 10;
  
  for (int dy = 20; dy < 200; dy += inc)
  {
    pc.minorTriad(width, 0.25, factor);
    translate(0, dy);
    inc += 10;
  }
    
  int r = 220;
  int g = 12;
  int b = 90;
  
  resetMatrix();
  //tp.paintBands(5, -4, 0, r, g, b);
  //tp.paintBands(5, 4, -4, r, g, b);
  tp.paintBands(4, 6, 6, r, g, b);
  //tp.paintBands();
  //tp.paintBandsBoring();
  //tp.paintShadow();
  //tp.paintBandsMasked();
  //tp.paintBandsDull();
  tp.paintVenue();
  
  if (millis() >= t)
  {
    //saveFrame("renders/anim/img-##.png");
    
    t += 60;
    //idx++;
    if (idx >= 42)
    {
      idx = 0;
      //exit();
    }
  }
  
  if (!saved)
  { 
    save("renders/poster.png");
    saved = true;
  }
  
  //if (frameCount > 2)
  //  delay(10000);
}
