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
<style type="text/css">
.jumbotron {
   background-color: #B01E68;
   text-align: center;
   font-size: 17px;
   color: #FFE9A0;
   margin-bottom: 0;
   font-family: Georgia, serif;
 }
.navbar {
   padding: 3px;
   background-color: #E8EAE6;
 }
.navbar a {
   font-size: 16px;
   font-weight: 400;
   text-decoration: none;
   color: #224B0C;
}
.navbar a:hover {
   font-weight: bold;
}
</style>
  </head>
  <body> 
  
   	<%
      		String uid = (String)session.getAttribute("username");
      	      	String type = (String)session.getAttribute("type");
      			if (uid == null || session.getAttribute("type").equals("user"))
      			{
      	%><!-- NOT A VALID USER, IF THE USER TRIES TO EXECUTE LOGGED IN PAGE DIRECTLY, ACCESS IS RESTRICTED -->
				<jsp:forward page="logout.jsp"/>
			<%
				}
			%>

<div class="jumbotron text-center p-4">	    
	<h1 align="center">H45 Marketplace</h1>
	<p align="center">One Stop Solution for your daily needs.</p>
</div>
    <nav class="navbar navbar-expand-lg">
	  <div class="container-fluid">
	   
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">
	       
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="admin.jsp">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="product.jsp">Products</a>
	        </li>
	        
	      </ul>
	    </div>	    
	    <!-- Right elements -->  

    <div class="d-flex align-items-center">
		
      	<%	
			out.println(" Welcome! " +uid);
		%>
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
				Data d=EditProduct.getRecordById(Integer.parseInt(id),product);
		%>
	
	<h2 align="center">Status Data</h2>
		<div class="container">
		
			<input type=hidden name="id" value="<%=d.getId() %>">
		
		<center><img src="getimage.jsp?id=<%=d.getId() %>&product=<%= product %>" width="100px"></center>
		
		<table class="table table-striped w-25" align="center">
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
            <tr>
            	<td><a class="btn btn-primary" role="button" href="editformproduct.jsp?id=<%=d.getId() %>&product=<%= product %>">Edit</a> |
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete_<%=d.getId()%>">Delete</button></td>
				<td></td>
            </tr>            
        </table>
        </div>

                <!-- Modal -->
                <div class="modal fade" id="delete_<%=d.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Record</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form action="./delete" method="post">
							<input type=text name="id" value="<%=d.getId()%>" hidden>
							<input type=text name="product" value="food" hidden>
							<p>are you sure want to delete this record?</p>
							<p>record ID : <b><%=d.getId()%></b></p>
						
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
				        <input type="submit" class="btn btn-danger" value="Yes">
				      </div>
				      </form>
				    </div>
				  </div>
				</div>
				<!-- End Modal -->

        
     <br><br><br>

   <footer class="text-center text-lg-start mt-auto" style="background-color: #FFE9A0;color: #224B0C; padding-top: 15px;">
	  <!-- Grid container -->
	  <div class="container p-3">
	    <!--Grid row-->
	    <div class="row">
	      <!--Grid column-->
	      <div class="col-lg-6 mb-4 mb-md-0">	
	        <p>
	          <i class="fa-solid fa-envelope"></i> feedback@hanif.com <br>
	          <i class="fa-solid fa-phone"></i> +62 812 5319 3473 <br>
	          <i class="fa-solid fa-location-dot"></i> Jakarta
	        </p>
	      </div>
	      <!--Grid column-->
		 <div class="col-lg-3 mb-4 mb-md-0">
		 </div>
	      <!--Grid column-->
	      <div class="col-lg-3 mb-4 mb-md-0">
	        <p>
	          <a href='http://www.facebook.com/'><i class="fa-brands fa-facebook-f"></i> Facebook</a> <br>
	          <a href='http://www.twitter.com/'><i class="fa-brands fa-twitter"></i> Twitter</a> <br>
	          <a href='http://www.instagram.com/'><i class="fa-brands fa-instagram"></i> Instagram</a> <br>
	          
	        </p>
	      </div>
	      <!--Grid column-->
	    </div>
	    <!--Grid row-->
	  </div>
	  <!-- Grid container -->
	
	</footer>

</body>
</html>