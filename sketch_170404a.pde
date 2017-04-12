<<<<<<< HEAD
void setup()
{
=======
//PFont slim;
void setup()
{
 // smooth();
 // slim = createFont("/fonts/Roboto-LightItalic.ttf",14);
>>>>>>> f9161b7b00e86d37f7a20fe36e5db5d33b5c075f
  size(500,2100);
  background(#056f68);
  noStroke();
  rectMode(CENTER);
  sequenceNum(1);
<<<<<<< HEAD
=======
  //textFont(slim);
>>>>>>> f9161b7b00e86d37f7a20fe36e5db5d33b5c075f
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
<<<<<<< HEAD
   fill(255);

=======
   fill(0);
  //textFont(slim);
>>>>>>> f9161b7b00e86d37f7a20fe36e5db5d33b5c075f
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
