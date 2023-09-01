package com.login.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@MultipartConfig
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
	}

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uuname = request.getParameter("username");
        String upwd = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pady", "root", "");
            PreparedStatement st = con.prepareStatement("select * from users where username = ? and password = ?");
            st.setString(1, uuname);
            st.setString(2, upwd);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                String UserName = rs.getString("username");
                String Email = rs.getString("email");
                String Image = rs.getString("image");
                session.setAttribute("username", UserName);
                session.setAttribute("email", Email);
                session.setAttribute("image", Image);
                String password = rs.getString("password");
                
                if (password.toLowerCase().startsWith("admin")) {
                    dispatcher = request.getRequestDispatcher("AdminHome.jsp");
                } else if(password.toLowerCase().startsWith("doctor")) {
                    dispatcher = request.getRequestDispatcher("Doctors.jsp");
                }else {
                    dispatcher = request.getRequestDispatcher("Index.jsp");
                }
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("Login.jsp");
            }
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
