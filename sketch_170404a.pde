
void setup()
{
  size(500,500);
  background(0,0,0);
  noStroke();
  rectMode(CENTER);
  println("The Digit Sequence || A non-mathmatical sequence from the gates of hell.");
  sequenceNum(1);
}

void draw()
{
  fill(0, 30);
  rect(0, 0, 700, 700);
  textSize(15);
  textAlign(CENTER, CENTER);
}

int requestSequence = 10000;
int sequence = 0;

public void sequenceNum(int num)
{
  int[] numInput = new int[100];
  String nextInput = "";
  String recursiveInput = "";
  int recursiveOutput = 0;
  print(" || Input: " +num+ " || Output: ");
  for(int i=15; i>0; i--)
  {
   numInput[i] = numCount(str(num), i);
   if(numInput[i] != 0){
     nextInput = str(numInput[i]) + str(i);
     recursiveInput = recursiveInput + nextInput;
    recursiveOutput = int(recursiveInput);
   }
  }
   println(recursiveInput + " || Index: " + sequence);

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
    