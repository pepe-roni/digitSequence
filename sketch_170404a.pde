PFont slim;
int userDefined = 1;

void setup()
{
  slim = createFont("/fonts/Roboto-MediumItalic.ttf",14);
  size(500,2550);
  noStroke();
  background(0);
  rectMode(CENTER);
}

void draw()
{  
  fill(25,200,255);
  textFont(slim);
  textSize(15);
  //prints the first term in the sequence
  //userDefined is the chosen first term
  text(" || First Term: " +userDefined+ " || Index: 1", 0,y);
  //calls for the first term used to create a sequence and list
  sequenceNum(userDefined); 
}

void mousePressed()
{
  background(0);
  //increases the first term and resets values for sequencing and displaying
  //set 45 as limit due to JS num data storage limit, resets to 0 after
  if(userDefined<45)
  {
    userDefined=userDefined+1;
    y = 20;
    sequence = 0;
  }
  else
    userDefined = 1;
}



//all algorthims are created from scratch.

int requestSequence = 1000; //the amount of recursive calls, controls index amount
int sequence = 0; //current cycle of recursion
int y = 20;

//sequenceNum takes an arguement num, in this case it is userDefined
//sequenceNum is a recursive function that runs the sequencing until the amount of cycles requested is met 
//the actual sequencing is preformed within the for loop, 
//loading the array with the count of each digit in num by calling the function numCount
//if the count of the digit, starting with 9 does not return zero, multiple variables are set
//for parsing, displaying, and calling recursion
//sequence and requestSequence are used as controls to prevent an infinite loop'
//abstraction as the recursive function eliminates many lines of code and makes for a more efficient program


//Overall the sequence takes the number and returns the count of each digit read 
//if 1 is the first term, the second is 11 because there is a single digit of 1
//the next term is 21 because there are two counts of 1
//the term following is 1211 because there is one count of two, and one count of one.
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
    fill(25,200,255);
    textFont(slim);
    y=y+20;
    //displays the output, y increases to grow the list
    text(" || Input: " +num+ " || Output: "+ recursiveInput + " || Index: " + int(sequence+2),0,y);
  if(sequence != requestSequence)
  {
    sequence++;
    sequenceNum(recursiveOutput);
  }
}

//numCount returns the count of a specific digit num in a string args
//numCount("15121", 1); would return 3
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
    
