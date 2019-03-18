// Logo size: 500x500 

PImage images[] = new PImage[50];
ImageGenerator ig = new ImageGenerator();
Synth pc = new Synth();
TextPainter tp;

void setup()
{
  size(500, 500);
  
  for (int i = 0; i < 50; i++)
  {
    images[i] = ig.generateBackground();
  }
  
  tp = new TextPainter(ig);
  tp.setup();
}

boolean saved = false;
int idx = 0;
int frame = 0;
int t = 60;
void draw()
{ 
  //float factor = (float)millis() / 200f;
  
  float factor = (float)(frame * 40) / 200f;
  
  // Paint the background.
  image(images[idx], 0, 0);
  
  // Draw the waves.
  translate(0, 450);
  int inc = 10;
  for (int dy = 10; dy < 100; dy += inc)
  {
    pc.minorTriad(width, 0.25, factor);
    translate(0, -dy);
    inc += 5;
  }
  
  resetMatrix();
  
  // Draw the shape.
  translate(width/2, height/2 + 20);
  pc.powerChord(factor);
  
  resetMatrix();

  tp.paintShadowed("OTFAM", 5, -6, 0, 220, 12, 90);
  
  //tp.paintBands(5, -4, 0, r, g, b);
  //tp.paintBands(5, 4, -4, r, g, b);
  //tp.paintBands(4, 6, 6, r, g, b);
  
  saveFrame("renders/anim/img-##.png");
  //if (millis() >= t)
  {
    saveFrame("renders/anim/img-##.png");
    
    //t += 20;
    idx++;
    frame++;
    if (idx >= 50)
      idx = 0;
    
    if (frame >= 63)
      exit();
  }
  
  if (!saved)
  { 
    save("renders/poster.png");
    saved = true;
  }
  
  //if (frameCount > 2)
  //  delay(10000);
}
