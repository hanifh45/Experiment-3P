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
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter ("id"));
		String uname = request.getParameter ("name");
		String ucost = request.getParameter ("cost");
		String uproduct = request.getParameter ("product");
		
		try {
			
			Connection con = DBConn.initializeDatabase();
			PreparedStatement st = con.prepareStatement("update "+ uproduct +" set name=?, cost=? where id=?");
			
			st.setString(1, uname);
			st.setString(2, ucost);
			st.setInt(3, uid);
			
			
			st.executeUpdate () ;
			
			st.close();
			con.close();
			// Get a writer pointer
			// to display the successful result
			PrintWriter out = response.getWriter();
			out.println ("<html><body><b>Successfully Updated"	+ "</b></body></html>") ;
			response.sendRedirect("http://localhost:8080/Experiment-3P/foodlist.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static Data getRecordById(int id, String product){
	    Data d=null;
	    try{  
	    	Connection con = DBConn.initializeDatabase();
	        PreparedStatement ps=con.prepareStatement("select * from "+product+" where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            d=new Data();  
	            d.setId(rs.getInt("id"));
	            d.setName(rs.getString("name"));
	            d.setCost(rs.getString("cost"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    	return d;  
	} 

}