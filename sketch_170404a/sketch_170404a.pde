int[] numInput = new int[100];
int requestSequence = 2;
int sequence = 0;
void setup()
{
  size(500,500);
  background(0,0,0);
  noStroke();
  rectMode(CENTER);
  println(numCount("1528152156111",1));
  println(11);
  sequenceNum(11);
}

void draw()
{
  fill(0, 30);
  rect(0, 0, 700, 700);
  textSize(15);
  textAlign(CENTER, CENTER);
}

public void sequenceNum(int num)
{
  int[] numInput = new int[10];
  int nextInput = 0;
  for(int i=9; i>0; i--)
  {
   numInput[i] = numCount(str(num), i);
   if(numInput[i] != 0){
     nextInput = parseInt(str(numInput[i]) + str(i));
   }
  }
  print(nextInput);
  if(sequence != requestSequence)
  {
    println();
    sequence++;
    sequenceNum(nextInput);
  }
  //for(int sequence = 0; sequence != requestSequence; sequence++)
  //{
  //  sequenceNum(nextInput);
  //}
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
    