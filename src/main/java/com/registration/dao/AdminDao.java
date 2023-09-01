package com.registration.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.registration.model.Admin;


public class AdminDao {
	
	public boolean isUsernameExists(String usernames) throws ClassNotFoundException {
	    String CHECK_USERNAME_SQL = "SELECT COUNT(*) FROM users WHERE username = ?";
	    boolean usernameExists = false;

	    Class.forName("com.mysql.jdbc.Driver");

	    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:/pady", "root", "");
	         PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USERNAME_SQL)) {
	        preparedStatement.setString(1, usernames);
	        System.out.println(preparedStatement);

	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            if (resultSet.next()) {
	                int count = resultSet.getInt(1);
	                usernameExists = count > 0;
	            }
	        }
	    } catch (SQLException e) {
	        printSQLException(e);
	    }
	    
	    return usernameExists;
	}


    public int registerEmployee(Admin user) throws ClassNotFoundException {
    	
        String INSERT_USERS_SQL = "INSERT INTO users" +
            "  (name, email, username, password, image) VALUES " +
            " (?, ?, ?, ?, ?)";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost/pady", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getUsername());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getImage());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
            

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
