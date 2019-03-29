class Synth
{
  private final float A4 = 440.0f;

  private final float A0 = 27.5f;
  private final float AS0 = 29.1352f;
  
  private final float D0 = 18.3540f;
  private final float D1 = 36.7081f;
  
  private final float D2 = 73.4162f;
  private final float E2 = 82.4069f;
  private final float A2 = 110.000f;
  private final float B2 = 123.471f;
  private final float F2 = 87.3071f;
  private final float D3 = 146.832f;
  private final float E3 = 164.814f;
  
  private final float SCALE = 3;
  private final float HSIZE = 90;
  private final float YSIZE = 90;
   
  private final float Apery = 1.2020569;
  private final float Conway = 1.30357;
  private final float Root2 = 1.41421;

  void powerChord(float factor)
  {
    stroke(0);
    strokeWeight(Root2);
    
    for (float t = 1; t < 11011; t++)
    {
      float x = sinNote(t, E2) * sinNote(t, B2) * sinNote(t, E3);
      float y = cosNote(t, E2, factor) * cosNote(t, B2) * cosNote(t, E3);
      
      point(x, y);
    }
  }
  
  void randomPowerChord()
  {
    stroke(0);
    strokeWeight(Root2);
    
    float factor = random(2*PI);
    
    for (float t = 1; t < 11011; t++)
    {
      float x = sinNote(t, E2, factor) * sinNote(t, B2) * sinNote(t, E3);
      float y = cosNote(t, E2, factor) * cosNote(t, B2) * cosNote(t, E3);
      
      point(x, y);
    }
  }
  
  private int randomZeroOrOne()
  {
    boolean b = random(1) < 0.05f;
    return b ? 0 : 1;
  }
  
  void minorTriad(int w, float amp, float factor)
  {
    strokeWeight(2);
    
    float density = 1;
    for (float x = 0; x < w*density; x+=2)
    {
      // D, F, A
      float y = cosNote(x, D2, factor) * cosNote(x, F2, factor) * cosNote(x, A2, factor) * amp;
      float angle = x / 20*PI + factor;
      int alpha = (int) (abs(sin(angle)) * 255f);
      stroke(200, 20, 50, alpha);
      point(x/density, y);
    }
  }
  
  private float sinNote(float t, float pitch)
  {
    return sinNote(t, pitch, 0);  
  }
  
  private float sinNote(float t, float pitch, float factor)
  {
    return sin(t / pitch * SCALE + factor/2) * width/HSIZE;
  }

  private float cosNote(float t, float pitch)
  {
    return cosNote(t, pitch, 0);    
  }

  private float cosNote(float t, float pitch, float factor)
  {
    return cos(t / pitch * SCALE + factor/2) * height/YSIZE;
  }
}
