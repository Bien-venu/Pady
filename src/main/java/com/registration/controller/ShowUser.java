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
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/showdata")
public class ShowUser extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final static String query = "select * from users";
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
        //load the JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(Exception e) {
            e.printStackTrace();
        }
        //generate the connection
        try(Connection con = DriverManager.getConnection("jdbc:mysql:/pady","root","");
                PreparedStatement ps = con.prepareStatement(query);){
            //resultSet
            ResultSet rs = ps.executeQuery();
            pw.println("<div  id= 'frm' style='margin:auto;width:900px;margin-top:100px;' >" );
            pw.println("<h1>All users</h1>");
            pw.println("<h1></h1>");
            pw.println("<table class='table table-hover table-striped'>");
            pw.println("<tr>");
            pw.println("<th>ID</th>");
            pw.println("<th>Name</th>");
            pw.println("<th>Email</th>");
            pw.println("<th>User Name</th>");
            pw.println("<th>Edit</th>");
            pw.println("<th>Delete</th>");
            pw.println("</tr>");
            while(rs.next()) {
                pw.println("<tr>");
                pw.println("<td>"+rs.getInt(1)+"</td>");
                pw.println("<td>"+rs.getString(2)+"</td>");
                pw.println("<td>"+rs.getString(3)+"</td>");
                pw.println("<td>"+rs.getString(4)+"</td>");
                pw.println("<td><a href='editurl?id="+rs.getInt(1)+"'>Edit</a></td>");
                pw.println("<td><a href='deleteurl?id="+rs.getInt(1)+"'>Delete</a></td>");
                pw.println("</tr>");
            }
            pw.println("</table>");
        }catch(SQLException se) {
            pw.println("<h2 class='bg-danger text-light text-center'>"+se.getMessage()+"</h2>");
            se.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }
        pw.println("<button class='btn btn-outline-success d-block'><a href='AdminHome.jsp'>Create an account</a></button>");
        
        pw.println("<button class='btn btn-outline-success my-2'><a href='Logout'>Logout</a></button>");
        pw.println("</div>");
        //close the stream
        pw.close();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req,res);
    }
}

