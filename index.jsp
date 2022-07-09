<%@ page errorPage="error.jsp" %> 
<html>
<head>
	<!-- https://www.w3schools.com/icons/icons_reference.asp
 -->
<link rel="stylesheet" href="./common.css" >
<link rel="stylesheet" href="./style.css" >


	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


   

	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	  
	  <style>
#slider{
    overflow: hidden;
}
#slider figure{
    position: relative;
    width:500%;
    margin-top: 10px;
    left: 0;
    animation: 20s slider infinite;
}
#slider figure img{
    width: 20%;
    float: left;
    height: 85vh;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    padding:5rem;
   
   margin-top: 30px;
   margin-bottom: 30px;
}
@keyframes slider{
    0% {
         left: 0;
     }
    20% {
         left: 0;
     }
    25% {
         left: -100%;
    }
   45%{
         left: -100%;
    }
    50%{
         left: -200%;
    }
    70%{
          left: -200%;
    }
    75%{
          left: -300%;
   }
   95%{
       left: -300%;
  }
  100%{
      left: -400%;
  }
}
</style>
</head>  
<body>  
<header>

		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">
			

		      <a class="navbar-brand" href="#"><i class="glyphicon glyphicon-home"></i>  Real-Estate</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="#">Home</a></li>
		      <li><a href="BuyerLR.jsp">Buyer</a></li>

		      <li><a href="SellerLR.jsp">Seller</a></li>
		      <li><a href="aboutus.jsp">About Us</a></li>

			  

		      <%
		      		if(session.getAttribute("buyerUserName")!=null || session.getAttribute("sellerUserName")!=null )
					  {
		      			%>
		      			<li><a href="Logout.jsp">Logout</a></li>
		      			<%
		      		}
		      %>

		         
		    </ul>
		  </div>
		</nav>

		<br>


		
				</div>
			








	<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			

    %>

  <div id="slider">
        <figure>
            <img src="images/imageSlider1.jpg">
            <img src="images/imageSlider2.jpg">
            <img src="images/imageSlider3.jpg">
            <img src="images/extra2.jpg">
            <img src="images/imageSlider1.jpg">
        </figure>
   </div>

	
<div class="con">
<br><br>
				<center>	<h3>We Provide Properties For..</h3>


<div class="container">
			<div class="card">
			
				<div class="imgBx">
			<a href="BuyerLR.jsp">
					<img src="./images/Seller 1.jpg">
					<h2>Buying<h2/>
					</a>
				
					<h2>
					</p>
					
				</div>
			</div>
		
			<div class="card">
				<div class="imgBx">
            <a href="SellerLR.jsp">
					<img src="images/extra1.jpg">
										<h2>Selling<h2/>

					</a>
					<h2>
					</p>					

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