package com.info;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delete
 */
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;  	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter ("id"));
		
		try {
					
				Connection con = DBConn.initializeDatabase();
				PreparedStatement st = con.prepareStatement("delete from users where id=?");
				
				st.setInt(1, uid);
				
				st.executeUpdate () ;
				st.close();
				con.close();
				response.sendRedirect("admin.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
}