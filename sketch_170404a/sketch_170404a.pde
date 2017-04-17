PFont slim;
int userDefined = 1;

void setup()
{
  slim = createFont("/fonts/Roboto-MediumItalic.ttf",14);
  size(500,500);
  noStroke();
  background(0);
  rectMode(CENTER);
}

void draw()
{  
  fill(25,200,255);
  textFont(slim);
  textSize(15);
  text(" || First Term: " +userDefined+ " || Index: 1", 0,y);
  sequenceNum(userDefined); 
}

void mousePressed()
{
  background(0);
  userDefined=userDefined+1;
  y = 20;
  sequence = 0;
}

int requestSequence = 1000;
int sequence = 0;
String exportString = "";
int y = 20;

public void sequenceNum(int num)
{
  
  int[] numInput = new int[1000];
  String nextInput = "";
  String recursiveInput = "";
  int recursiveOutput = 0;
 
  for(int i=9; i>0; i--)
  {
   numInput[i] = numCount(str(num), i);
   if(numInput[i] != 0 || (numInput[i-1] !=0 && numInput[i+1] !=0))
   {
     nextInput = str(numInput[i]) + str(i);
     recursiveInput = recursiveInput + nextInput;
    recursiveOutput = int(recursiveInput);
   }
  }
    exportString = " || Input: " +num+ " || Output: "+ recursiveInput + " || Index: " + int(sequence+1);
  
    fill(25,200,255);
    textFont(slim);
    y=y+20;
    text(" || Input: " +num+ " || Output: "+ recursiveInput + " || Index: " + int(sequence+2),0,y);
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
    