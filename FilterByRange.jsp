<%@ page errorPage="error.jsp" %> 
<%@ page session = "true" %>  
<%@ page import="java.sql.*" %>
<%
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			String buyerUserName = (String)session.getAttribute("buyerUserName");
			
		if(buyerUserName==null)
			{
				response.sendRedirect("BuyerLR.jsp");
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
		
<div class="filterByRangeBg">
		<div class="container">

	    	<div class="justify-content-center align-items-center ">
	    		<div class="row">
	    			<div class="col-sm-4">
	    				<h3><b>FILTER BY RANGE</b></h3>
	    			    <hr>
	    			</div>
	    		</div>
	    		<div class="row">
	    		
	    			<div class="col-sm-4">
	    				
	    				<form action="#" method="post">
							 <div class="input-group">
							    <input type="number" autocomplete="off" class="form-control" name="Minimum" placeholder="Minimum" required="" />
							    <span class="input-group-addon">-</span>
							    <input type="number" autocomplete="off" class="form-control" name="Maximum" placeholder="Maximum" required="" />
							    
							</div>
							<br>
							<input type="radio" name="type" value="sale" required=""> <span style="font-size:20px">buy</span>
							<input type="radio" name="type" value="rent" required="" style="margin-left: 10px;"> <span style="font-size:20px">rent</span>
							<br><br>
							<input type="submit" name="">
				        </form>
	    			</div>
	    		
	    	    </div>
	    	        <%
				            if(request.getParameter("type")!=null)
				            {
				            	String url = "jdbc:mysql://localhost:3306/realestatedb";
			String user = "realestate";
			String pass = "realestate";
							Class.forName("com.mysql.cj.jdbc.Driver"); 
							try(
									Connection conn = DriverManager.getConnection(url,user,pass);
									
								)
							{
								String type = request.getParameter("type");

								String query ;
								// result set.
								ResultSet rset ;
								PreparedStatement stmt;
								if(type.equals("sale"))
								{
									out.println("<br><br><h4>"+"Results for \'Sale\' between "+ (String)request.getParameter("Minimum") + "/- and " + (String)request.getParameter("Maximum") +"/-</h4>");

									query = "select house_id,seller_name,seller_contact_number,city,street_name,apartment_number,sale_price,number_of_bedrooms,specificatons from house natural join seller where sale_status =true and rent_status=false  and sale_price between ? and ?";

									stmt = conn.prepareStatement(query);

									stmt.setString(1,(String)request.getParameter("Minimum"));
									stmt.setString(2,(String)request.getParameter("Maximum"));


								}
								else
								{
									out.println("<br><br><h4>"+"Results for \'Rent\' between "+ (String)request.getParameter("Minimum") + "/- and " + (String)request.getParameter("Maximum") +"/-</h4>");
									query = "select house_id,seller_name,seller_contact_number,city,street_name,apartment_number,rent_price,number_of_bedrooms,specificatons from house natural join seller where rent_status=true and sale_status=false  and rent_price between ? and ?";

									stmt = conn.prepareStatement(query);

									stmt.setString(1,(String)request.getParameter("Minimum"));
									stmt.setString(2,(String)request.getParameter("Maximum"));
								}

								
							    rset = stmt.executeQuery();

				               


								ResultSetMetaData rsmd = rset.getMetaData();

								int columnCount = rsmd.getColumnCount();

								     %>
									<br><br>
									<%
					            out.println("<div class=\"table-responsive\">");
								
								out.println("<table class = \"table-bordered table table-striped table-hover \"");
								out.println("<thead>");
								for(int i=1;i<=columnCount;i++)
								{
									out.print("<th scope=\"col\">"+rsmd.getColumnName(i).toUpperCase() + "</th>");
								}
								    out.println("</thead>");
								int counter = 0;
								out.println("<tbody>");
								while(rset.next())
								{
									
									out.println("<tr>");
								 	

									for(int i=1;i<=columnCount;i++)
									{
										
										out.print("<td>"+rset.getString(i) + "</td>");
										
									}
									counter++;
								    out.println("</tr>");
									
								}
							out.println("</tbody>");

								out.println("</table>");

								conn.close();
									stmt.close();
									rset.close();





							}
							catch(Exception e)
							{
								out.println(e);
							}
				            }
					%>
	    	    <br><br><br>
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
