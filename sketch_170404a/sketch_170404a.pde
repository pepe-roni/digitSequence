PFont slim;

int y =40;
HScrollbar bar;
int userDefined = 1;

void setup()
{
  bar = new HScrollbar(0, height/2-8, width, 16, 16);
  slim = createFont("/fonts/Roboto-ThinItalic.ttf",14);
  size(500,500);
  background(255,255,255);
  noStroke();
  rectMode(CENTER);
  sequenceNum(userDefined);
  //textFont(slim);
}


void draw()
{  
  textSize(15);
  textAlign(CENTER, CENTER);
  sequenceNum(userDefined); 
  bar.update();
  bar.display();
}



int requestSequence = 100;
int sequence = 0;
String exportString = "";

public void sequenceNum(int num)
{
  int[] numInput = new int[1000];
  String nextInput = "";
  String recursiveInput = "";
  int recursiveOutput = 0;
 // text(" || Input: " +num+ " || Output: ", 0,y);
  for(int i=50; i>0; i--)
  {
   numInput[i] = numCount(str(num), i);
   if(numInput[i] != 0){
     nextInput = str(numInput[i]) + str(i);
     recursiveInput = recursiveInput + nextInput;
    recursiveOutput = int(recursiveInput);
   }
  }
    exportString = " || Input: " +num+ " || Output: "+ recursiveInput + " || Index: " + int(sequence+1);
    fill(0);
    textFont(slim);
    text(" || Input: " +num+ " || Output: "+ recursiveInput + " || Index: " + int(sequence+1), 0,y);
    y=y+20;
  if(sequence != requestSequence)
  {
    sequence++;
    sequenceNum(recursiveOutput);
  }
}

public int numCount(String agrs, int num)
{
  int count = 0;
  for(int i = 0;i<agrs.length();i++)
  {
    if(parseInt(agrs.substring(i,i+1)) == num)
      count = count+1;
  }
  return count;
}
    
class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}