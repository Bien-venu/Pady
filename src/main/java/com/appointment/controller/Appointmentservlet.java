package com.appointment.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.appointment.dao.AppointmentDao;
import com.appointment.model.Appointments;


@MultipartConfig
@WebServlet("/Appointmentservlet")
public class Appointmentservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AppointmentDao userDao = new AppointmentDao();
       
    public Appointmentservlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        
        jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
        dispatcher.forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String email = request.getParameter("medicalid");
	    String username = request.getParameter("hospitals");
	    String password = request.getParameter("date");
	    String cpassword = request.getParameter("Appointement");
	    
	    
	    
	    // Check if the username already exists in the database
	    try {
	        if (userDao.isUsernameExists(username)) {
	            // Set an error message in the request attribute
	            request.setAttribute("status", "exists");
	            System.out.print("exists");
	            jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
	            dispatcher.forward(request, response);
	            return;
	        }
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        // Handle the exception if necessary
	    }

	    Appointments user = new  Appointments();
	    user.setName(name);
	    user.setMedicalid(email);
	    user.setHospitals(username);
	    user.setDate(password);
	    user.setAppointement(cpassword);

	    try {
	        userDao.registerEmployee(user);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    // Forward the request and response to the id.jsp page
	    request.setAttribute("status", "success");
	    jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
        dispatcher.forward(request, response);
        System.out.print("success");
	}


}

