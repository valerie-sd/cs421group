package neopetspace.ui;
//CS 421
//Group 11
//Project Part 3
//Java UI

//Helper class that does a lot of the repetitive printing required

import java.util.Scanner;

public class Printer {
	
	//class variables
	private static Printer _printer = new Printer();
	private Scanner _input;
	
	//constructor
	private Printer()
	{
	
		_input = new Scanner(System.in);
	
	}
	
	//return instance of printer
	public static Printer getInstance()
	{
	
		return _printer;
		
	}
	
	//Prints out starting dialog
	public void printStart()
	{
	
		System.out.println();
		System.out.println("Welcome to the Neo Pet Space DataBase");
		System.out.println();
	
	}
	
	//Prints out options to user
	public void printOptions()
	{
	
		System.out.println("-----------------------------------------");
	
		System.out.println("1. Display all pets info");
		System.out.println("2. Add a new pet page");
		System.out.println("3. List all donkeys born after some date");
		System.out.println("4. Option 4");
		System.out.println("5. Option 5");
		System.out.println("6. Re-Print options");
		System.out.println("7. Quit");
		
		System.out.println("-----------------------------------------");
		
		System.out.println();
		
	}
	
	//Gives the response from the user regarding what option they want to pursue
	public int takeOptionInput()
	{
		
		int response;
		
		//As long as the input is invalid keep asking for a proper response
		while(true)
		{
			//Ask for input and if invalid throw the appropriate exception and keep asking
			try
			{
			
				System.out.print("Enter a number , 1 -> 7, corresponding to the options listed: ");
				
				response = _input.nextInt();

				if(response < 0 || response > 7)
				{
					throw new Exception();
				}
				
			}
			catch(Exception e)
			{
				System.out.println();
				System.out.println("Enter valid input");
				System.out.println();

				continue;
			}
			
			break;
			
		}
		
		return response;
	
	}
	
}