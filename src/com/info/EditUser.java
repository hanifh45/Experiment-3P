package com.info;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Edit
 */
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter ("id"));
		String uusername = request.getParameter ("username");
		String upassword = request.getParameter ("password");
		String ufirstname = request.getParameter ("firstname");
		String ulastname = request.getParameter ("lastname");
		String uemail = request.getParameter ("email");
		String uaddress = request.getParameter ("address");
		String uphone = request.getParameter ("phone");
		String utype = request.getParameter ("type");
		
		try {
			
			Connection con = DBConn.initializeDatabase();
			PreparedStatement st = con.prepareStatement("update users set firstname=?, lastname=?, username=?, password=?, email=?, address=?, phone=?, type=? where id=?");
			
			st.setString(1, ufirstname);
			st.setString(2, ulastname);
			st.setString(3, uusername);
			st.setString(4, upassword);
			st.setString(5, uemail);
			st.setString(6, uaddress);
			st.setString(7, uphone);
			st.setString(8, utype);
			st.setInt(9, uid);
			
			
			st.executeUpdate () ;
			
			st.close();
			con.close();
			// Get a writer pointer
			// to display the successful result
			PrintWriter out = response.getWriter();
			out.println ("<html><body><b>Successfully Updated"	+ "</b></body></html>") ;
			response.sendRedirect("http://localhost:8080/Experiment-3P/admin.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static Data getRecordById(int id){  
	    Data d=null;
	    try{  
	    	Connection con = DBConn.initializeDatabase(); 
	        PreparedStatement ps=con.prepareStatement("select * from users where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            d=new Data();  
	            d.setId(rs.getInt("id"));
	            d.setFirstname(rs.getString("firstname"));
	            d.setLastname(rs.getString("lastname"));
	            d.setUsername(rs.getString("username"));
	            d.setPassword(rs.getString("password"));
	            d.setEmail(rs.getString("email"));
	            d.setAddress(rs.getString("address"));
	            d.setPhone(rs.getString("phone"));
	            d.setType(rs.getString("type"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    	return d;  
	} 

}