/Makayla Zacarias
//Homework 8



import java.util.Arrays;

public class Cracker 
{
	int []holes = new int[15]; // the 15 holes in board
	int [][]move = new int[14][3];
	boolean open = false;
	
	int [][]moves = {
	        {0,1,3},
        {0,2,5},
        {1,3,6},
        {1,4,8},
        {2,4,7},
        {2,5,9},
        {3,6,10},
        {3,7,12},
        {4,7,11},
        {4,8,13},
        {5,8,12},
        {5,9,14},
        {3,4,5},
        {6,7,8},
        {7,8,9},
        {10,11,12},
        {11,12,13},
        {12,13,14} // all possible move like in provided python program
	};

void move(int parent, int middle, int newSpot)
{
	for (int i = 0; i <moves.length; i++)
	{
			if (parent == moves[i][0] && newSpot == moves[i][2]) 
            {
                open = true;
            }
            else if (parent == moves[i][2] && newSpot == moves[i][0] && open == false)
			{
            	open = true;
            }
	} //marks if spot is open or not
	if (holes[parent] == 1 && holes[middle] == 1 && holes[newSpot] == 0)
	{
		holes[parent]= 0;
		holes[middle]= 0;
		holes[newSpot]= 1;
	} 
	else if(holes[parent] == 0 && holes[middle] == 1 && holes[newSpot] == 0)
	{
		holes[parent] = 1;
		holes[middle] = 0;
		holes[newSpot] = 0;//adjust pegs
	}  
	printSolution();
		
}


   void printSolution() {
        System.out.print("       " + holes[0] + "    \n");
        System.out.print("      " + holes[1] + " " + holes[2] + "   \n");
        System.out.print("     " + holes[3] + " " + holes[4] + " " + holes[5] + "  \n");
        System.out.print("    " + holes[6] + " " + holes[7] + " " + holes[8] + " " + holes[9] + " \n");
        System.out.print("   " + holes[10] + " " + holes[11] + " " + holes[12] + " " + holes[13] + " " + holes[14] + "\n");
		System.out.print("\n");
	} //prints out solution

public static void main(String[] args)
{
	Cracker solution = new Cracker();
	
	int emptyHole = 0;
	System.out.print("******" + emptyHole + "******\n");
	Arrays.fill(solution.holes,1);
	solution.holes[emptyHole] = 0;
	solution.printSolution();
	
	emptyHole = 1;
	System.out.print("******" + emptyHole + "******\n");
	Arrays.fill(solution.holes,1);
	solution.holes[emptyHole] = 0;
	solution.printSolution();
	
	emptyHole = 2;
	System.out.print("******" + emptyHole + "******\n");
	Arrays.fill(solution.holes,1);
	solution.holes[emptyHole] = 0;
	solution.printSolution();
	
	emptyHole = 3;
	System.out.print("******" + emptyHole + "******\n");
	Arrays.fill(solution.holes,1);
	solution.holes[emptyHole] = 0;
	solution.printSolution();
	
	emptyHole = 4;
	System.out.print("******" + emptyHole + "******\n");
	Arrays.fill(solution.holes,1);
	solution.holes[emptyHole] = 0;
	solution.printSolution(); //prints solutions
	
	
	
}
}
