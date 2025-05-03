package com.collegeNepal.controller.dao;

import java.sql.*;
import java.util.ArrayList;

import com.collegeNepal.controller.database.DatabaseConnection;
import com.collegeNepal.model.User;
import com.collegeNepal.utility.EncryptDecrypt;



public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public UserDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}

	//User registration
	 public boolean register(User user){
		 	boolean isUserRegistered = false;
		 	System.out.println("INSIDEREGISTERUSERDAO");
	        String query = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
	        System.out.println("quesrymade");
	        if(conn != null) {
	        	
					try {
						
						String userPassword = EncryptDecrypt.encrypt(user.getPassword());
						ps = conn.prepareStatement(query);
						 ps.setString(1, user.getName());
				            ps.setString(2, user.getEmail());
				            ps.setString(3, userPassword); 
				            ps.setString(4, "student");
				            System.out.println("querysent");
				            if(ps.executeUpdate() > 0) {
				            	isUserRegistered = true;
				            }
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	        }
	        return isUserRegistered;
	        
	    }
	
	 // get all the users from database
	public ArrayList<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<>();
		String query = "SELECT * FROM users";
		if(conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ResultSet userSet = ps.executeQuery();
				while(userSet.next()) {
					 User user = new User();
			            user.setName(userSet.getString("name"));
			            user.setEmail(userSet.getString("email"));
			            user.setPassword(userSet.getString("password"));
			            user.setRole(userSet.getString("role"));
			            users.add(user);
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return users;
	}
	
	//get user log info
	public User login(String email, String password) {
		User user = null;
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        if(conn != null) {
        	try {
            	ps = conn.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, EncryptDecrypt.encrypt(password)); // NOTE: Password should be hashed in production
                ResultSet userSet = ps.executeQuery();

                if(userSet.next()) {
                	user = new User(

                			userSet.getString("name"),
                			userSet.getString("email"),
                			userSet.getString("password"),
                			userSet.getString("role")
                        );
                }
            }catch(SQLException e) {
            	// TODO Auto-generated catch block
    			e.printStackTrace();
            }
        }
        return user;
    }
}
