package com.info;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet3
 */
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class InsertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// getting request value from form page -3
		String uusername = request.getParameter ("username");
		String upassword = request.getParameter ("password");
		String ufirstname = request.getParameter ("firstname");
		String ulastname = request.getParameter ("lastname");
		String uemail = request.getParameter ("email");
		String uaddress = request.getParameter ("address");
		String uphone = request.getParameter ("phone");
		String utype = "user";
		
		
		try {
			Connection con = DBConn.initializeDatabase();
			PreparedStatement st = con.prepareStatement ("insert into users (username, password, firstname, lastname, email, address, phone, type)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?)");

			
			st.setString(1, uusername);
			st.setString(2, upassword);
			st.setString(3, ufirstname);
			st.setString(4, ulastname);
			st.setString(5, uemail);
			st.setString(6, uaddress);
			st.setString(7, uphone);
			st.setString(8, utype);
			// Execute the insert command using executeUpdate ()
			// to make changes in database
			st.executeUpdate () ;
			// Close all the connections
			st.close();
			con.close();
			// Get a writer pointer
			// to display the successful result
			PrintWriter out = response.getWriter();
			out.println ("<html><body><b>Successfully Inserted"	+ "</b></body></html>") ;
			response.sendRedirect("http://localhost:8080/Experiment-3P/");
		}
		catch (Exception e) {
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			out.println ("<html><body><b>something error"	+ "</b></body></html>") ;
		}
		
	}

}