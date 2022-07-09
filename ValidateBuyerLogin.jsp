<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>

<%

			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");

			String buyerUserName = (String)session.getAttribute("buyerUserName");
			

			if(buyerUserName!=null)
			{
				response.sendRedirect("BuyerHome.jsp");
			}
			
			buyerUserName = (String)request.getParameter("buyerUserName");
			String buyerPassword = (String)request.getParameter("buyerPassword");

			if(buyerUserName==null)
			{
				response.sendRedirect("BuyerLogin.jsp");
			}

			// java code for checking already user present.

			String url = "jdbc:mysql://localhost:3306/realestatedb";
			String user = "realestate";
			String pass = "realestate";
			Class.forName("com.mysql.cj.jdbc.Driver"); 

			String query = "select * from buyer where buyer_user_name= ? and binary buyer_password = ?";

			 

			try(

					Connection conn = DriverManager.getConnection(url,user,pass);
					PreparedStatement stmt = conn.prepareStatement(query);
				)
			{
				// for succesful connection.
				
				
				stmt.setString(1,buyerUserName);
				stmt.setString(2,buyerPassword);

				ResultSet rset = stmt.executeQuery();
				

				
				// to check is there are results.
				if(rset.isBeforeFirst())
				{

					
									rset.close();
									stmt.close();
									conn.close();
									session.setAttribute("buyerUserName",buyerUserName);
					
				

					response.sendRedirect("BuyerHome.jsp");
				}
				else
				{
					rset.close();
									stmt.close();
									conn.close();
					session.setAttribute("error","* invalid UserName or password");
					response.sendRedirect("BuyerLogin.jsp");
				}

			}
			catch(Exception e)
			{
				out.println(e);
			}

			

		

		
%>
	