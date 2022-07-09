<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>

<%

			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");

			String buyerUserName =(String)request.getParameter("buyerUserName");
			String buyerName = (String)request.getParameter("buyerName");
			String buyerContactNumber = (String)request.getParameter("buyerContactNumber");
			String buyerPassword = (String)request.getParameter("buyerPassword");

			String buyerUserNameSession = (String)session.getAttribute("buyerUserName");
			

			if(buyerUserNameSession!=null)
			{
				response.sendRedirect("BuyerHome.jsp");
			}
			
			if(buyerUserName==null )
			{
				response.sendRedirect("BuyerRegister.jsp");
			}
			
			if(buyerName==null )
			{
				response.sendRedirect("BuyerRegister.jsp");
			}
			
			if(buyerContactNumber==null )
			{
				response.sendRedirect("BuyerRegister.jsp");
			}

			if(buyerPassword==null )
			{
				response.sendRedirect("BuyerRegister.jsp");
			}

			// java code for checking already user present.

			

			String url = "jdbc:mysql://localhost:3306/realestatedb";
			String user = "realestate";
			String pass = "realestate";

			Class.forName("com.mysql.cj.jdbc.Driver"); 

			 
			Connection conn = null;
			PreparedStatement stmt = null;
			try
			{
				conn = DriverManager.getConnection(url,user,pass);
				

				// for succesful connection.
				
				
				
				conn.setAutoCommit(false);
				
				
				String query = "select * from buyer where buyer_user_name= ? ";

				stmt = conn.prepareStatement(query);

				stmt.setString(1,buyerUserName);
				

				
				
				ResultSet rset = stmt.executeQuery();


				
				// to check is there are results.
				if(rset.isBeforeFirst())
				{

					
					rset.close();
					stmt.close();
					conn.close();
					
				
					session.setAttribute("userexists","* User Name  already exists");					
					response.sendRedirect("BuyerRegister.jsp");
				
					
				}
				else
				{
					
					rset.close();
					stmt.close();

					String registerNew = "insert into buyer values(?,?,?,?)";

					stmt = conn.prepareStatement(registerNew);

					stmt.setString(1,buyerUserName);
					stmt.setString(2,buyerName);
					stmt.setString(3,buyerContactNumber);
					stmt.setString(4,buyerPassword);


					int rows = stmt.executeUpdate();

					if(rows==0)
					{
						stmt.close();
						conn.close();
						response.sendRedirect("BuyerRegister.jsp");
						return;
					}

                     stmt.close();


				

					stmt = conn.prepareStatement("select buyer_name from buyer where buyer_user_name = ? ");

					stmt.setString(1,buyerUserName);

					rset = stmt.executeQuery();

					 

					if(rset.next())
					{
						out.println("You are successfully registered!!, your User Name : " + buyerUserName);
					}

					
					conn.commit();

					
					rset.close();
					stmt.close();
					conn.close();
					

					session.setAttribute("buyerUserName",buyerUserName);



					response.sendRedirect("BuyerLogin.jsp");

					

					//response.sendRedirect("Test.jsp");
				}


			}
			catch(Exception e)
			{
				conn.rollback();
				response.sendRedirect("BuyerRegister.jsp");

				// must show error in transaction.
				out.println(e);
				return;
			}

		

		

		
%>
	