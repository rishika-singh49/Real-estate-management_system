 <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String date = sdf.format(new Date());

%>


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
 <%
	    	           
	    	        	
	    	        	{

				            String url = "jdbc:mysql://localhost:3306/realestatedb";
			String user = "realestate";
			String pass = "realestate";
							Class.forName("com.mysql.cj.jdbc.Driver"); 
							Connection conn= null;
							try
							{
								conn = DriverManager.getConnection(url,user,pass);



								//Statement stmt = conn.createStatement();

							/*	ResultSet rset1 = stmt1.executeQuery("select agent_id from agents");

								 ArrayList<String> agentIds = new ArrayList<>();

								while(rset1.next())
								{
									agentIds.add(rset1.getString(1));
								}

								Random rand = new Random();


								int randIndex = rand.nextInt(agentIds.size());

								String randomAgentId = agentIds.get(randIndex);

								out.println(randomAgentId);
								*/










								String city = (String)request.getParameter("city");
								String streetName  = (String)request.getParameter("street");
								String apartmentNumber = (String)request.getParameter("houseNumber");
								String salePriceString = (String)request.getParameter("salePrice");
								String rentPriceString = (String)request.getParameter("rentPrice");
								String specifications = (String)request.getParameter("specifications");
								String numberOfBedroomsString = (String)request.getParameter("numberOfBedrooms");
								String type = (String)request.getParameter("type");
								boolean saleStatus=false;
								boolean rentStatus=false;
								
								
								int salePrice=Integer.parseInt(salePriceString);
								int rentPrice=Integer.parseInt(rentPriceString);
								int numberOfBedrooms = Integer.parseInt(numberOfBedroomsString);
								//int apartmentNumber=Integer.parseInt(apartmentNumberString);
								// to be changed whole below.........

								String query ;
								
								PreparedStatement stmt;

								conn.setAutoCommit(false);

								query = "insert into house(seller_user_name,city,street_name,apartment_number,sale_price,rent_price,sale_status,rent_status,number_of_bedrooms,specificatons) values(?,?,?,?,?,?,?,?,?,?)";

								

								stmt = conn.prepareStatement(query);

								stmt.setString(1,sellerUserName);
								stmt.setString(2,city);
								stmt.setString(3,streetName);
								stmt.setString(4,apartmentNumber);
		
								

								if(type.equals("sale"))
								{
									stmt.setInt(5,salePrice);
									
									stmt.setInt(6,0);

									stmt.setBoolean(7,true);

									stmt.setBoolean(8,false);
									stmt.setInt(9,numberOfBedrooms);
								   stmt.setString(10,specifications);
								


								}
								else if(type.equals("rent"))
								{
									stmt.setInt(5,0);
									
									stmt.setInt(6,rentPrice);

									stmt.setBoolean(7,false);

									stmt.setBoolean(8,true);

									stmt.setInt(9,numberOfBedrooms);
								stmt.setString(10,specifications);
								
									
								}
								else
								{
									stmt.setInt(5,salePrice);

									stmt.setInt(6,rentPrice);
									
									stmt.setBoolean(7,true);
									
									stmt.setBoolean(8,true);

									stmt.setInt(9,numberOfBedrooms);
							     	stmt.setString(10,specifications);
					
								}
								

								
							    int rowsAffected = stmt.executeUpdate();

System.out.println(rowsAffected);
							   // out.println(randomAgentId);


							   	
							   

							    

							    if(rowsAffected==0)
							    {
							    	//conn.rollback();

							    	
									stmt.close();
									conn.close();

									//conn1.close();
									//stmt1.close();
									//rset1.close();
							    	session.setAttribute("transactionFailed","true");
							    	response.sendRedirect("UploadNewHouse.jsp");
							    	return;
							    }
							    else
							    {
							    	
							    	conn.commit();
							    	conn.close();
									stmt.close();

									//conn1.close();
									//stmt1.close();
									//rset1.close();
							    	session.setAttribute("transactionFailed","false");
							    	response.sendRedirect("UploadNewHouse.jsp");
							    	return;
							    
							    }

							    



				               





							}
							catch(Exception e)
							{
								//conn.rollback();
								
								session.setAttribute("transactionFailed","true");
								out.println(e);
								
							    response.sendRedirect("UploadNewHouse.jsp");
								System.out.println(e.getMessage());


								return;
							}
					
	    	        	}
	    	        %>