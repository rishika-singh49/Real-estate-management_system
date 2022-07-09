<%@ page errorPage="error.jsp" %> 
<%@ page session = "true" %>  
<%
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			String sellerUserName = (String)session.getAttribute("sellerUserName");
			

			if(sellerUserName==null)
			{
				response.sendRedirect("SellerLR.jsp");
			}

			

			

 %>

<html>
<head>
	
	<link rel="stylesheet" href="./common.css" >

	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	  <!-- <a class="navbar-brand" href=""><i class="glyphicon glyphicon-home"></i>  Real-Estate</a>
 -->
</head>  
<body>  


		

		
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      
	 			 <a class="navbar-brand" href="index.jsp"><i class="glyphicon glyphicon-home"></i>  Real-Estate</a>

		    </div>
		    <ul class="nav navbar-nav">
		      <li ><a href="index.jsp">Home</a></li>
		      <li><a href="BuyerLR.jsp">Buyer</a></li>
		      <li class="active"><a href="SellerLR.jsp">Seller</a></li>
		     
		      <%  if(session.getAttribute("buyerUserName")!=null || session.getAttribute("sellerUserName")!=null)
			  {
				  %>
				  <li><a href="Logout.jsp">Logout</a></li>
				  <%
			  }
			  %>
			 
		    </ul>
		  </div>
		</nav>
		<div class=sellerHome>
		<br><br>
		<br><br>

		<div class="container">

	    	<div class="d-flex justify-content-center align-items-center ">
	    		<div class="row">
	    			<div class="col-sm-4">
	    				<h3><b>SELLER HOME</b></h3>
	    			    <hr>
	    			</div>
	    		</div>
	    		<div class="row">
	    		
	    			<div class="col-sm-4">
	    				
	    				<button type="button" onclick="location.href='UploadNewHouse.jsp'" class="btn btn-primary btn-lg btn-block">SELL/RENT A HOUSE</button>

	    				<br><br>

	    				<button type="button" onclick="location.href='ViewSellerHouses.jsp'" class="btn btn-primary btn-lg btn-block">VIEW HOUSES</button>

	    				<br><br>

	    				
	    			</div>
	    		
	    	    </div>
	    		
	    	</div>
    	
        </div>

       </div>
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