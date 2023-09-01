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


@WebServlet("/Appointments")
public class Appointments extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final static String query = "select * from appointment";
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
            pw.println("<div  id= 'frm' style='margin:auto;width:900px;' >" );
            pw.println("<h1>All Appointments</h1>");
            pw.println("<h1></h1>");
            pw.println("<table class='table table-hover table-striped'>");
            pw.println("<tr>");
            pw.println("<th>ID</th>");
            pw.println("<th>Name</th>");
            pw.println("<th>Medical ID</th>");
            pw.println("<th>Hospital</th>");
            pw.println("<th>date</th>");
            pw.println("<th>Appointement</th>");
            pw.println("</tr>");
            while(rs.next()) {
                pw.println("<tr>");
                pw.println("<td>"+rs.getInt(1)+"</td>");
                pw.println("<td>"+rs.getString(2)+"</td>");
                pw.println("<td>"+rs.getString(3)+"</td>");
                pw.println("<td>"+rs.getString(4)+"</td>");
                pw.println("<td>"+rs.getString(5)+"</td>");
                pw.println("<td>"+rs.getString(6)+"</td>");
                pw.println("</tr>");
            }
            pw.println("</table>");
        }catch(SQLException se) {
            pw.println("<h2 class='bg-danger text-light text-center'>"+se.getMessage()+"</h2>");
            se.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }
        pw.println("<button class='btn btn-outline-success my-2'><a href='Doctors.jsp'>	Home</a></button>");
        pw.println("</div>");
        //close the stream
        pw.close();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req,res);
    }
}

