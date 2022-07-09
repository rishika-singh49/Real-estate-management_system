<%@ page errorPage="error.jsp" %> 
<%@ page session = "true" %>  
<%@ page import="java.sql.*" %>
<%
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			String buyerUserName = (String)session.getAttribute("buyerUsreName");
			

			if(buyerUserName!=null)
			{
				response.sendRedirect("BuyerHome.jsp");
			}
			

			

			

 %>

<html>
<head>
	<link rel="stylesheet" href="./common.css" >


	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	  <!-- <a class="navbar-brand" href=""><i class="glyphicon glyphicon-home"></i>  Real-Estate</a> -->
 <style>
 h3,p{
	 color:white;
 }
 </style>
</head>  
<body>  


		

		
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <!-- <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script> -->
	  <a class="navbar-brand" href="index.jsp"><i class="glyphicon glyphicon-home"></i>  Real-Estate</a>

		    </div>
		    <ul class="nav navbar-nav">


		      <li ><a href="index.jsp">Home</a></li>
		      <li class="active"><a href="BuyerLR.jsp">Buyer</a></li>
		      <li><a href="SellerLR.jsp">Seller</a></li>
		      

		      
		    </ul>
		  </div>
		</nav>
		<br><br>
		<br><br>
		<div class="buyerLogin-big-image">

		<div class="container">

	    	<div class="d-flex justify-content-center align-items-center ">
	    		<div class="row">
	    			<div class="col-sm-4">
	    				<h3><b>BUYER LOGIN</b></h3>
	    			    <hr>
	    			</div>
	    		</div>
	    		<div class="row">
	    		
	    			<div class="col-sm-4">
	    				<%
	    				if(session.getAttribute("error")!=null)
	    				{
	    					out.print("<h5 style=\"color:red;\">"+session.getAttribute("error")+"</h5>");

	    					session.removeAttribute("error");
	    				}

	    				%>
	    				<form action="ValidateBuyerLogin.jsp" method="post">
						<p>	User Name  : </p> <input autocomplete="off" class="form-control" type="text" name="buyerUserName" required="">
							<br><br>

						<p>	Password  : </p> <input autocomplete="off" class="form-control" type="password" name="buyerPassword" required="">
							<br><br>
							
							<button class="btn btn-primary"><span class="glyphicon glyphicon-log-in"></span> Login</button>
				        </form>
	    			</div>
	    		
	    	    </div>
	    		</div>
	    	</div>
    	
        </div>

		<section class="footer">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
				  <div class="wrapper">
					<div class="button">
					   <div class="icon">
						  <i class="fab fa-facebook-f"></i>
					   </div>
					   <span>Facebook</span>
					</div>
					<div class="button">
					   <div class="icon">
						  <i class="fab fa-twitter"></i>
					   </div>
					   <span>Twitter</span>
					</div>
					<div class="button">
					   <div class="icon">
						  <i class="fab fa-instagram"></i>
					   </div>
					   <span>Instagram</span>
					</div>
					<div class="button">
					   <div class="icon">
						  <i class="fab fa-codepen"></i>
					   </div>
					   <span>Codepen</span>
					</div>
					<div class="button">
					   <div class="icon">
						  <i class="fab fa-youtube"></i>
					   </div>
					   <span>YouTube</span>
					</div>
				 </div>
			  
		   </section>
		



	
 
</body>  
</html>  