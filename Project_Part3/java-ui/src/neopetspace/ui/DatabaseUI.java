package neopetspace.ui;

//CS 421
//Group 11
//Project Part 3
//Java UI

//Main interface

import java.sql.*;
import java.io.*;

public class DatabaseUI {

	static boolean _quit;
	static Printer _printer;
	private static BufferedReader _input = new BufferedReader(new InputStreamReader(System.in));
	static int _response;
	static String _username;
	static String _password;
	static String _url;
	static Connection connection;

	public static void main(String[] args) {
		// Tries to establish connection
		try {
			initilize();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// prints greeting
		_printer.printStart();
		// prints options
		_printer.printOptions();

		while (_response != 7) {
			_response = _printer.takeOptionInput();

			System.out.println();

			performAction();
		}
	}

	// Initilize the class variables
	static void initilize() throws SQLException {
		_quit = false;
		_printer = Printer.getInstance();
		_response = -1;
		_username = "cs421g11";
		_password = "frymvomwyd";
		_url = "jdbc:postgresql://db2.cs.mcgill.ca/CS421";

		connection = DriverManager.getConnection(_url, _username, _password);
		// connection.close();
	}

	static void performAction() {
		switch (_response) {
		case 1:
			try {
				optionOne();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case 2:
			optionTwo();
			break;
		case 3:
			optionThree();
			break;
		case 4:
			try {
				optionFour();
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case 5:
			try{
				optionFive();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		case 6:
			optionSix();
			break;
		case 7:
			try {
				optionSeven();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
	}

	static void optionOne() throws SQLException {
		Statement stmt = null;
		String query = "SELECT * FROM pet_pages pp ORDER BY pp.page_id";
		try {
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.println("page_id\tspecies\tgender\tage\tbirthday");
			System.out.println("---------------------------------------------------------------");
			while (rs.next()) {
				int page_id = rs.getInt("page_id");
				String species = rs.getString("species");
				String gender = rs.getString("gender");
				int age = rs.getInt("age");
				Date birthday = rs.getDate("birthday");
				System.out.println(page_id + "\t" + species + "\t" + gender
						+ "\t" + age + "\t" + birthday);
			}
			System.out.println("---------------------------------------------------------------\n");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				stmt.close();
			}
		}
	}

	static void optionTwo() {
		//Add a new pet to the database
		Statement stmt = null;
		//get highest page ID used so far
		int pageID = 0;
		int page_num = 0;
		String query = "SELECT MAX(page_id) FROM pages";
		try {
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
				page_num = rs.getInt(1);
				//System.out.println(page_num+" is the highest used page_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		pageID = page_num + 1;
		stmt = null;
		//take data from user
		String petName = null;
		String picPath = null;
		String description = null;
		int userID = 0;
		String species = null;
		char gender = 'f';
		int age = -1;
		String birthday = null;
		boolean done = false;
		System.out.println("Enter the data for the pet you're adding:");
		System.out.println("PetName (required):");
		
		while(!done){
			try {
				petName = _input.readLine();
				if(petName.matches("[a-zA-Z0-9]+")){
					done = true;
				}else{
					System.out.println("Input a valid name.");
				}
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		done = false;
		while(!done){
			System.out.println("Your user ID (required)(int):");
			try{
				userID = Integer.parseInt(_input.readLine());
				done = true;
			}catch (NumberFormatException e) {
				System.out.println("\nEnter valid input\n");
			}catch (IOException e) {
				System.out.println("\nEnter valid input\n");
			}
		}
		done = false;
		while(!done){
			System.out.println("Species:");
			try {
				species = _input.readLine();
				if(species.length() > 0){
					done = true;
				}else{
					System.out.println("Input a valid name.");
				}
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		done = false;
		while(!done){
			System.out.println("Gender (char, m or f):");
			try {
				gender = _input.readLine().charAt(0);
				if(!(gender=='m' || gender=='f' || gender == 'M' || gender == 'F')){
					System.out.println("invalid input.");
				}else{
					if(gender == 'm'){
						gender = 'M';
					}
					else if(gender == 'f'){
						gender = 'F';
					}
					done = true;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
		//optional inputs
		while(!done){
			System.out.println("Description (not required):");
			try {
				description = _input.readLine();
				done = true;
				if(description.length()==0){
					description = null;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		done = false;
		while(!done){
			System.out.println("File path for picture (not required):");
			try {
				picPath = _input.readLine();
				done = true;
				if(picPath.length()==0){
					picPath = "DEFAULT";
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		done = false;
		while(!done){
			System.out.println("Age (optional)(int):");
			String temp = null;
			try{
				temp = _input.readLine();
			}catch (IOException e) {
				System.out.println("\nEnter valid age input\n");
			}
			done = true;
			//System.out.println("here is what is stored in temp: "+ temp+ " and age: "+age);
			if(temp.length() == 0){
				//System.out.println("skipping");
			}else{
				try{
					age = Integer.parseInt(temp);
				}catch (NumberFormatException e) {
					System.out.println("\nEnter valid age input\n");
					done = false;
				}					
			}
		}
		done = false;
		while(!done){
			System.out.println("Birthday (yyyy-mm-dd)(optional):");			
			try {
				birthday = _input.readLine();
				if(birthday.length()==0){
					birthday = "NULL";
					done = true;
				}else{
					//if(!birthday.matches("([1-3][0-9]|[0-9])[-/](0[1-9]|[1-9]|1[0-2])[-/][(19|20)][0-9][0-9]")){//save me based regex god
					if(!birthday.matches("[0-9][0-9][0-9][0-9][-/][0-9][0-9][-/][0-9][0-9]")){
						System.out.println("Input a birthday of the proper form yyyy-mm-dd");
					}else{
						done = true;
						birthday = "'"+birthday+"'";
					}
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String insertAge = "NULL";
		if(age != -1){
			insertAge = Integer.toString(age);
		}
		//insert into pages, pet_pages
		String insertPage = "INSERT INTO pages (page_id, pname, pic_path, description, manager_user_id) VALUES"
				+"	("+pageID+", '"+petName+"', "+picPath+", '"+description+"', "+userID+")";
		String insertPet = "INSERT INTO pet_pages (page_id, species, gender, age, birthday) VALUES"
				+"	("+pageID+", '"+species+"', '"+gender+"', "+insertAge+", "+birthday+")";
		try {
			stmt = connection.createStatement();
			int rs = stmt.executeUpdate(insertPage);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		stmt = null;
		try {
			stmt = connection.createStatement();
			int rs = stmt.executeUpdate(insertPet);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	static void optionThree() {

	}

	static void optionFour() throws Exception {
		Statement stmt = null;
		int petId = -1;
		
		System.out.print("\nEnter a pet id: ");
		try {
			petId = Integer.parseInt(_input.readLine());
		} catch (IOException e) {
			throw new Exception("Input could not be read");
		}
		String query = "SELECT p.pname AS pname"
				+ "       FROM pages p "
				+ "      WHERE p.page_id IN ("
				+ "            SELECT * "
				+ "              FROM update_suggested_interests(" + petId + ")"
						+ "    )";
//		String query = "SELECT * "
//         + "              FROM update_suggested_interests(" + petId + ")";
		
		try {
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.println("\nsuggested interest page names");
			System.out.println("-----------------------------");
			while (rs.next()) {
				String pname = rs.getString("pname");
				System.out.println(pname);
			}
			System.out.println("-----------------------------\n");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				stmt.close();
			}
		}
	}

	static void optionFive() throws Exception{
		Statement stmt = null;
		int choice = -1;
		String query = "";
		String createIndexQ = "";
		
		System.out.println("To test the index on popular poll responses, press 1.");
		System.out.println("To test the index on posts created by a given page, press 2");
		System.out.println("To return to the main menu, press 3");
		
		try {
			choice = Integer.parseInt(_input.readLine());
		} catch (IOException e) {
			throw new Exception("Input could not be read");
		}
		
		if(choice == 1){
			query = "SELECT TEMP.question_text, TEMP.response_text, TEMP.num_votes " +
					"FROM ( SELECT * " + "FROM polls " + "JOIN responses " + "ON polls.poll_id = responses.poll_id )  AS TEMP "+ 
					"WHERE TEMP.num_votes >= 10";
			
			createIndexQ = "CREATE INDEX respInd ON responses(num_votes)";
			String cluster = "CLUSTER responses USING respInd";
			String drop = "DROP INDEX IF EXISTS respInd";
			try{
				long woBefore = System.currentTimeMillis();
				stmt = connection.createStatement();
				
				ResultSet rs = stmt.executeQuery(query);
				long woAfter = System.currentTimeMillis();
				System.out.println("\nPopular response: ");
				System.out.println("-----------------------------");
				
				while(rs.next()){
					String question = rs.getString("question_text");
					String response = rs.getString("response_text");
					int votes = rs.getInt("num_votes");
					
					System.out.println(question + "\t" + response + "\t" + "\t" + votes);	
				}
				
				System.out.println("-----------------------------\n");
				
				long dt = woAfter - woBefore;
				
				System.out.println("Time taken without index: " + dt);
				
				stmt.execute(createIndexQ);
				stmt.execute(cluster);
				long wBefore = System.currentTimeMillis();
				stmt = connection.createStatement();
				stmt.executeQuery(query);
				long wAfter = System.currentTimeMillis();
				dt = wAfter - wBefore;
				stmt.execute(drop);
				System.out.println("Time taken with index: "+ dt);
				
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		else if (choice == 2){
			int pid = -1;
			
			createIndexQ = "CREATE INDEX creatorInd ON posts(creator)";
			String drop = "DROP INDEX IF EXISTS creatorInd";
			System.out.println("Enter a page id number to retrieve their posts.");
			
			try {
				pid = Integer.parseInt(_input.readLine());
			} catch (IOException e) {
				throw new Exception("Input could not be read");
			}
			query = "SELECT posts.post_id, posts.creator, pages.pname, pages.description, pages.manager_user_id " +
					"FROM posts, pages WHERE posts.creator = pages.page_id AND posts.creator = " + pid;
			
			try{
				long woBefore = System.currentTimeMillis();
				stmt = connection.createStatement();
				
				ResultSet rs = stmt.executeQuery(query);
				long woAfter = System.currentTimeMillis();
				System.out.println("\nPosts made by given page id: ");
				System.out.println("-----------------------------");
				
				while(rs.next()){
					int postid = rs.getInt("post_id");
					int creator = rs.getInt("creator");
					String pname = rs.getString("pname");
					String desc = rs.getString("description");
					int uid = rs.getInt("manager_user_id");
					System.out.println(postid +"\t" + creator + "\t" + pname + "\t" + desc + "\t" + uid);	
				}
				
				System.out.println("-----------------------------\n");
				
				long dt = woAfter - woBefore;
				
				System.out.println("Time taken without index: " + dt);
				
				stmt.execute(createIndexQ);
				long wBefore = System.currentTimeMillis();
				stmt = connection.createStatement();
				stmt.executeQuery(query);
				long wAfter = System.currentTimeMillis();
				dt = wAfter - wBefore;
				stmt.execute(drop);
				System.out.println("Time taken with index: "+ dt);
				
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		else if(choice == 3){
			_printer.printOptions();
		}
	}


	// re-prints options for the user
	static void optionSix() {
		_printer.printOptions();
	}

	static void optionSeven() throws SQLException {
		connection.close();
	}

}