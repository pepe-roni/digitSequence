PFont slim;
void setup()
{
 slim = createFont("/fonts/Roboto-LightItalic.ttf",14);
  size(500,2100);
  background(#056f68);
  noStroke();
  rectMode(CENTER);
  sequenceNum(1);
}
int y =40;

void draw()
{  
  textSize(15);
  textAlign(CENTER, CENTER);
  sequenceNum(1); 
}

int requestSequence = 100;
int sequence = 0;
String exportString = "";

public void sequenceNum(int num)
{
  int[] numInput = new int[100];
  String nextInput = "";
  String recursiveInput = "";
  int recursiveOutput = 0;
 // text(" || Input: " +num+ " || Output: ", 0,y);
  for(int i=15; i>0; i--)
  {
   numInput[i] = numCount(str(num), i);
   if(numInput[i] != 0){
     nextInput = str(numInput[i]) + str(i);
     recursiveInput = recursiveInput + nextInput;
    recursiveOutput = int(recursiveInput);
   }
  }
  exportString = " || Input: " +num+ " || Output: "+ recursiveInput + " || Index: " + int(sequence+1);
   fill(255);
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
    
