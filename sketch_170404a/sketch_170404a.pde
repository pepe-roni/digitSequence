void setup()
{
  println(sequenceNum(90));
  //for(int n=0; n<100; n++;)
  //{
     
  //}
}

void draw()
{
  
}

public int sequenceNum(int num)
{
   int nextNum = 0;
   int max = Math.max(num,num);
  return max;
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
    