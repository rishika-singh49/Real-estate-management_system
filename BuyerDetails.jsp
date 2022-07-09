<%@ page import="java.util.*" %>  
<%@ page import="java.sql.*" %>

<%
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");


			String buyerUserName = (String)session.getAttribute("buyerUserName");
			

			
	
			

 %>
<!DOCTYPE html>
<html>
	<head>
		<title>
			Buyer Details
		</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	    

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>         	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	</head>
<body>
    
    <nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="">Real-Estate</a>
		    </div>
		    <ul class="nav navbar-nav">
		        <li><a href="index.jsp">Home</a></li>
		    	<li><a href="#">Buyer</a></li>
		    	<li><a href="#">Seller</a></li>
//		    	<li class="active"><a href="EmployeeLogin.jsp">Employee</a></li>

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
	    <%
            String url = "jdbc:mysql://localhost:3306/realesatatedb";
			String user = "realestate";
			String pass = "realestate";
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			try
			{

				
				Connection conn = DriverManager.getConnection(url,user,pass);
				Statement stmt = conn.createStatement();
		
               ResultSet rset = stmt.executeQuery("select * from buyer  order by buyer_user_name");


			ResultSetMetaData rsmd = rset.getMetaData();

			int columnCount = rsmd.getColumnCount();

		%>
				<br><br><br>
		<%

			out.println("<div class=\"table-responsive\">");
			out.println("<table class = \"table-bordered table table-striped table-hover \"");
			out.println("<thead>");
			for(int i=1;i<=columnCount;i++)
			{
				out.print("<th scope=\"col\">"+rsmd.getColumnName(i).toUpperCase() + "</th>");
			}
			out.println("</thead>");
			
			out.println("<tbody>");
			while(rset.next())
			{
				
				out.println("<tr>");
			 	

				for(int i=1;i<=columnCount;i++)
				{
					
					out.print("<td>"+rset.getString(i) + "</td>");
					
				}
				
			    out.println("</tr>");
				
			}
		    out.println("</tbody>");

			out.println("</table>");

			
									
									rset.close();
									stmt.close();
									conn.close();





			}
			catch(Exception e)
			{
				out.println(e);
			}
	    %>

</body>
</html>