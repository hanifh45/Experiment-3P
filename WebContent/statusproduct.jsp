<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.info.EditUser,com.info.EditProduct,com.info.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello</title>
    
    <link
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	  rel="stylesheet"
	/>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  </head>
  <body> 
  
   	<%
      		String uid = (String)session.getAttribute("username");
      	      	String type = (String)session.getAttribute("type");
      			if (uid == null || session.getAttribute("type").equals("admin"))
      			{
      	%><!-- NOT A VALID USER, IF THE USER TRIES TO EXECUTE LOGGED IN PAGE DIRECTLY, ACCESS IS RESTRICTED -->
				<jsp:forward page="logout.jsp"/>
			<%
				}
			%>
  
    <div class="text-center p-3" style="background-color: orange;">
	    
<h1 align=center>H45</h1>
    </div>

    <nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Navbar</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      
	      <ul class="navbar-nav">
	       
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="user.jsp">Home</a>	       
	        </li>
	        
	       	<li class="nav-item">
	          <a class="nav-link" aria-current="page" href="#">About Us</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="#">Contact</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="#">Detail</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="#">Service</a>
	        </li>
	      
	      </ul>
	    
	    </div>
	    
	    <!-- Right elements -->
    <div class="d-flex align-items-center">
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="logout.jsp">Logout</a>
				</li>
			</ul>
		</div>
    </div>
    <!-- Right elements -->
	  </div>
	</nav>
	<br><br><br>
	
		<%
			String id=request.getParameter("id");
			String product=request.getParameter("product");
			Data d=EditProduct.getRecordById(Integer.parseInt(id), product);
		%>
	
	<h2 align="center">Status Data</h2>
		<div class="container">
		
			<input type=hidden name="id" value="<%=d.getId() %>">
		
		<center><img src="getimage.jsp?id=<%=d.getId() %>&product=<%= product %>" width="100px"></center>
		
		<table class="table table-striped w-50" align="center">
            <tr>
                <td>ID</td>
                <td>: <%=d.getId() %></td>
            </tr>
            <tr>
                <td>Name</td>
                <td>: <%=d.getName() %></td>
            </tr>
            <tr>
                <td>Cost</td>
                <td>: <%=d.getCost() %></td>
            </tr>         
        </table>
        </div>

        
    <footer class="bg-light text-center text-lg-start bottom">
	  <!-- Grid container -->
	  <div class="container p-4">
	    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
	        <p> 
	          <a href='http://www.facebook.com/' target='_blank'><i class="fa-brands fa-facebook-f"></i> Facebook</a> <br>
	          <a href='http://www.twitter.com/' target='_blank'><i class="fa-brands fa-twitter"></i> Twitter</a> <br>
	          <a href='http://www.instagram.com/' target='_blank'><i class="fa-brands fa-instagram"></i> Instagram</a> <br>
	          
	        </p>
	      </div>
	      <!--Grid column-->
	    </div>
	    <!--Grid row-->
	  </div>
	  <!-- Grid container -->
	
	  <!-- Copyright -->
	  <div class="text-center p-3" style="background-color: orange;">
	    SHOFE
	  </div>
	  <!-- Copyright -->
	</footer>

</body>
</html>