<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>

<%

			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");

			String sellerUserName= (String)session.getAttribute("sellerUserName");
			

			if(sellerUserName!=null)
			{
				response.sendRedirect("SellerHome.jsp");
			}
			
			sellerUserName = (String)request.getParameter("sellerUserName");
			String sellerPassword = (String)request.getParameter("sellerPassword");

			if(sellerUserName==null )
			{
				response.sendRedirect("SellerLogin.jsp");
			}
			if(sellerPassword==null )
			{
				response.sendRedirect("SellerLogin.jsp");
			}

			// java code for checking already user present.

			String url = "jdbc:mysql://localhost:3306/realestatedb";
			String user = "realestate";
			String pass = "realestate";

			Class.forName("com.mysql.cj.jdbc.Driver"); 

			String query = "select * from seller where seller_user_name = ? and seller_password = ?";

			 

			try(

					Connection conn = DriverManager.getConnection(url,user,pass);
					PreparedStatement stmt = conn.prepareStatement(query);
				)
			{
				
				
				
				
				stmt.setString(1,sellerUserName);
				stmt.setString(2,sellerPassword);
				

				ResultSet rset = stmt.executeQuery();
				

				
				// to check is there are results.
				if(rset.isBeforeFirst())
				{
									
									rset.close();
									stmt.close();
									conn.close();

					session.setAttribute("sellerUserName",sellerUserName);
				

					response.sendRedirect("SellerHome.jsp");
				}
				else
				{
									rset.close();
									stmt.close();
									conn.close();
					session.setAttribute("error","* invalid UserName or password");
					response.sendRedirect("SellerLogin.jsp");
				}





			}
			catch(Exception e)
			{
				out.println(e);
			}

			

		

		
%>
	