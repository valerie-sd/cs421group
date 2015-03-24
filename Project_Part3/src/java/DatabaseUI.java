//CS 421
//Group 11
//Project Part 3
//Java UI

//Main interface

import java.sql.*;

public class DatabaseUI {
	
	static boolean _quit;
	static Printer _printer;
	static int _response;
	static String _username;
	static String _password;
	static String _url;
	static Connection conneciton;
	
	public static void main(String[] args){
		
		//Tries to establish connection
		try{
			initilize();
		}
		catch(SQLException e)
		{
			e.printStackTrace();	
		}
		
		//prints greeting
		_printer.printStart();
		
		//prints options
		_printer.printOptions();
		
		while(_response != 6)
		{
		
			_response = _printer.takeOptionInput();
			
			System.out.println();
			
			performAction();
		
		}
		
	}
	
	//Initilize the class variables
	static void initilize() throws SQLException
	{
	
		_quit = false;
		_printer = Printer.getInstance();
		_response = -1;
		_username = "cs421g11";
		_password = "frymvomwyd";
		_url = "jdbc:postgresql://db2/CS421";
		
		try
		{
			Class.forName("or.postgresql.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		
		conneciton = DriverManager.getConnection(_url, _username, _password);
		
		conneciton.close();
	
	}
	
	static void performAction()
	{
		
		switch(_response){
			case 1: optionOne();
					break;
			case 2: optionTwo();
					break;
			case 3: optionThree();
					break;
			case 4: optionFour();
					break;
			case 5: optionFive();
					break;
			case 6: optionSix();
					break;
			case 7: optionSeven();
					break;
			default:
					break;
		}

	}
	
	static void optionOne(){}
	static void optionTwo(){}
	static void optionThree(){}
	static void optionFour(){}
	static void optionFive(){}
	
	//re-prints options for the user
	static void optionSix()
	{
	
		_printer.printOptions();
	
	}
	
	static void optionSeven(){}
	
}