<%@ page errorPage="error.jsp" %> 
<%@ page session = "true" %>  
<%
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			String buyerUserName = (String)session.getAttribute("buyerUserName");
			

			
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
		      <!-- <li><a href="EmployeeLogin.jsp">Employee</a></li> -->
		      <%
			  if(session.getAttribute("buyerUserName")!=null || session.getAttribute("sellerUserName")!=null)
			  {
				  %>
				  <li><a href="Logout.jsp">Logout</a></li>
				  <%
			  }
		      %>
		      
		    </ul>
		  </div>
		</nav>
		<br><br>
		<br><br>
		<div class="buyerRegister-big-image">


		<div class="container">

	    	<div class="d-flex justify-content-center align-items-center ">
	    		<div class="row">
	    			<div class="col-sm-4">
	    				<h3><b>BUYER REGISTER</b></h3>
	    			    <hr>
	    			</div>
	    		</div>
	    		<div class="row">
	    		
	    			<div class="col-sm-4">
	    				<%
	    					if(session.getAttribute("userexists")!=null)
	    					{
	    						out.println("<h5 style=\"color:red;\">"+session.getAttribute("userexists")+"</h5>");
	    						session.removeAttribute("userexists");
	    					}
	    					else if(session.getAttribute("id")!=null)
	    					{
	    						String id = (String)session.getAttribute("id");

	    						session.removeAttribute("id");

	    						out.println("<h5 style=\"color:green;\">"+"Registration Succesfull, Your Id : " + id+"</h5>");



	    					}
	    				%>
	    				<form action="ValidateBuyerRegister.jsp" method="get">
							<p>User Name  : </p>
							<input autocomplete="off" class="form-control" type="text" name="buyerUserName" placeholder="user name.." required="">
							<br>
						<p>	Name  : </p>
							<input autocomplete="off" class="form-control" type="text" name="buyerName" placeholder="your name.." required="">
							<br>
					<p>		Contact Number  : </p>
							<input autocomplete="off" class="form-control" type="text" name="buyerContactNumber" pattern="[0-9]{10}" placeholder="10 digit phone number.." required="" maxlength="10"
							
						
							>
							<br>
						<p>	Password  : </p>
							<input autocomplete="off" class="form-control" type="password" name="buyerPassword" pattern=".{8,}" placeholder="eight or more characters password.." title="Eight or more characters"  required="">
							<br><br>
							<button class="btn btn-success"> <span class="fa fa-user-plus"></span>Register</button>
				        </form>
	    			</div>
	    		
	    	    </div>
	    		

			</div>
	    	</div>
    	
        </div>
		<br><br>
	<section class="footer">
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