package com.registration.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.registration.dao.UserDao;
import com.registration.model.User;

@MultipartConfig
@WebServlet("/register")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDao userDao = new UserDao();
       
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        
        jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("SignUp.jsp");
        dispatcher.forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    String cpassword = request.getParameter("cpassword");
	    Part file=request.getPart("image");
	    String image = file.getSubmittedFileName();
	    
	    String path="C:/Users/Bienvenu/eclipse-workspace/Pady/src/main/webapp/images/"+image;
	    
	    
	    try {
	    
	    FileOutputStream fos=new FileOutputStream(path);
	    InputStream is =file.getInputStream();
	    
	    byte[] data=new byte[is.available()];
	    is.read(data);
	    fos.write(data);
	    fos.close();
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    // Check if the username already exists in the database
	    try {
	        if (userDao.isUsernameExists(username)) {
	            // Set an error message in the request attribute
	            request.setAttribute("errorMessage", "Username already exists. Please choose a different username.");
	            request.setAttribute("status", "exists");
	            System.out.print("exists");
	            // Forward the request and response back to the SignUp.jsp page
	            jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("SignUp.jsp");
	            dispatcher.forward(request, response);
	            return;
	        }
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        // Handle the exception if necessary
	    }

	    // Check if cpassword is equal to password
	    if (!password.equals(cpassword)) {
	        // Set an error message in the request attribute
	        request.setAttribute("errorMessage", "Please enter the same password.");
	        request.setAttribute("status", "password");
	        System.out.print("password");
	        // Forward the request and response back to the SignUp.jsp page
	        jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("Id.jsp");
	        dispatcher.forward(request, response);
	        return;
	    }

	    // If the cpassword is equal to password and password does not start with "admin", continue with registration
	    User user = new User();
	    user.setName(name);
	    user.setEmail(email);
	    user.setUsername(username);
	    user.setImage(image);
	    user.setPassword(password);
	    user.setCpassword(cpassword);

	    try {
	        userDao.registerEmployee(user);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    // Forward the request and response to the id.jsp page
	    request.setAttribute("status", "success");
	    jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("SignUp.jsp");
        dispatcher.forward(request, response);
        System.out.print("success");
	}


}
