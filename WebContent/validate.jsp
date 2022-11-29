<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 

<%@page import="com.info.*"%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection con = DBConn.initializeDatabase();    
        PreparedStatement ps = con.prepareStatement("Select id,username,password,type from users where username=? and password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();                        
        if(rs.next())
        	if(rs.getString("type").equals("admin")){
		        session.setAttribute("username", username);//THIS IS HOW WE DECLARE THE USER IN A SESSION
		        session.setAttribute("id", rs.getString("id"));
		        session.setAttribute("type", rs.getString("type"));
				response.sendRedirect("admin.jsp");
        	}
        	if(rs.getString("type").equals("user")){
        		session.setAttribute("username", username);//THIS IS HOW WE DECLARE THE USER IN A SESSION
        		session.setAttribute("type", rs.getString("type"));
        		session.setAttribute("id", rs.getString("id"));
				response.sendRedirect("user.jsp");
        	}
        		
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Your Username or Password wrong !! Please try again");       
   }      
%>