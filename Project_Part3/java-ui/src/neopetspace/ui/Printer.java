package neopetspace.ui;

//CS 421
//Group 11
//Project Part 3
//Java UI

//Helper class that does a lot of the repetitive printing required

import java.io.*;

public class Printer {

	// class variables
	private static Printer _printer = new Printer();
	private BufferedReader _input = new BufferedReader(new InputStreamReader(System.in));

	// constructor
	private Printer() {
	}

	// return instance of printer
	public static Printer getInstance() {
		return _printer;
	}

	// Prints out starting dialog
	public void printStart() {
		System.out.println("\n~*Welcome to the Neo Pet Space DataBase*~\n");
	}

	// Prints out options to user
	public void printOptions() {
		System.out.println("-----------------------------------------");
		System.out.println("1. Display all pets info");
		System.out.println("2. Add a new pet page");
		System.out.println("3. List all donkeys born after some date");
		System.out.println("4. List suggested interest for given pet");
		System.out.println("5. View index options");
		System.out.println("6. Re-Print options");
		System.out.println("7. Quit");
		System.out.println("-----------------------------------------\n");
	}

	// Gives the response from the user regarding what option they want to
	// pursue
	public int takeOptionInput() {

		int response = 0;

		// As long as the input is invalid keep asking for a proper response
		while (true) {
			// Ask for input and if invalid throw the appropriate exception and
			// keep asking

				System.out.print("Enter a number , 1 -> 7, corresponding to the options listed: ");

				try {
					response = Integer.parseInt(_input.readLine());
				} catch (NumberFormatException e) {
					System.out.println("\nEnter valid input\n");
				} catch (IOException e) {
					System.out.println("\nEnter valid input\n");
				}

				if (response < 0 || response > 7) {
					System.out.println("\nEnter valid input\n");
					continue;
				}
			break;
		}
		return response;
	}
}