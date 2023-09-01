package com.registration.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/deleteurl")
public class DeleteServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final static String query = "delete from users where id = ?";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //get PrintWriter
        PrintWriter pw = res.getWriter();
        //set content type
        res.setContentType("text/html");
        //link the bootstrap
        pw.println("<link rel='stylesheet' href='css/bootstrap.css'></link>");
        pw.println("<link rel=\"stylesheet\" href=\"css/admin.css\" />");
        pw.println("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin />");
        pw.println("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" />");
        pw.println("<link href=\"https://fonts.googleapis.com/css2?family=Rajdhani:wght@300&display=swap\" rel=\"stylesheet\"/>");
        pw.println(" <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin />");
        pw.println("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" />");
        //get the values
        int id = Integer.parseInt(req.getParameter("id"));
        //load the JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(Exception e) {
            e.printStackTrace();
        }
        //generate the connection
        try(Connection con = DriverManager.getConnection("jdbc:mysql:/pady","root","");
                PreparedStatement ps = con.prepareStatement(query);){
            //set the values
            ps.setInt(1, id);
            //execute the query
            int count = ps.executeUpdate();
            pw.println("<div class='card' id= 'frm' style='margin:auto;width:300px;margin-top:100px'>");
            if(count==1) {
                pw.println("<h2 class='bg-danger text-light text-center'>Record Deleted Successfully</h2>");
            }else {
                pw.println("<h2 class='bg-danger text-light text-center'>Record Not Deleted</h2>");
            }
        }catch(SQLException se) {
            pw.println("<h2 class='bg-danger text-light text-center'>"+se.getMessage()+"</h2>");
            se.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }
        pw.println("<a href='showdata'><button class='btn btn-outline-success'>Show User</button></a>");
        pw.println("</div>");
        pw.close();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req,res);
    }
}

