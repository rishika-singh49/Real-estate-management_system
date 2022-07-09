<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>

<%

			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");

			String sellerUserName = (String)request.getParameter("sellerUserName");
			String sellerName = (String)request.getParameter("sellerName");
			String sellerContactNumber = (String)request.getParameter("sellerContactNumber");
			String sellerPassword = (String)request.getParameter("sellerPassword");

			String sellerUserNameSession= (String)session.getAttribute("sellerUserName");
			if(sellerUserNameSession!=null)
			{
				response.sendRedirect("SellerHome.jsp");
			}
			if(sellerUserName==null )
			{
				response.sendRedirect("SellerRegister.jsp");
			}
			if(sellerName==null )
			{
				response.sendRedirect("SellerRegister.jsp");
			}

			if(sellerContactNumber==null )
			{
				response.sendRedirect("SellerRegister.jsp");
			}

			if(sellerPassword==null )
			{
				response.sendRedirect("SellerRegister.jsp");
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
				
				
				String q = "select * from seller where seller_user_name = ?";

				stmt = conn.prepareStatement(q);

				stmt.setString(1,sellerUserName);

				
				
				ResultSet rset = stmt.executeQuery();

				// to check is there are results.
				if(rset.isBeforeFirst())
				{

									
									rset.close();
					                stmt.close();
									conn.close();
					session.setAttribute("userexists","* User already exists");
					response.sendRedirect("SellerRegister.jsp");
					
				}
				else
				{
					rset.close();
				    stmt.close();
					

					String registerNew = "insert into seller values(?,?,?,?)";

					stmt = conn.prepareStatement(registerNew);

					stmt.setString(1,sellerUserName);
					stmt.setString(2,sellerName);
					stmt.setString(3,sellerContactNumber);
					stmt.setString(4,sellerPassword);

					int rows = stmt.executeUpdate();

					if(rows==0)
					{
						stmt.close();
						conn.close();
						response.sendRedirect("SellerRegister.jsp");
						return;
					}

					
					stmt.close();

					q = "select * from seller where seller_user_name = ? ";

					stmt = conn.prepareStatement(q);

					stmt.setString(1,sellerUserName);

					rset = stmt.executeQuery();

					
					if(rset.next())
					{
						out.println("You are successfully registered!!, your User Name : " + sellerUserName);
					}

					
					// commit.
					conn.commit();

									
									rset.close();
									stmt.close();
									conn.close();

					session.setAttribute("sellerUserName",sellerUserName);



					response.sendRedirect("SellerLogin.jsp");

					return;
				}

			}
			catch(Exception e)
			{
				//conn.rollback();
				response.sendRedirect("SellerRegister.jsp");

				// must show error in transaction.
				out.println(e);
				return;
			}

		

		

		
%>
	