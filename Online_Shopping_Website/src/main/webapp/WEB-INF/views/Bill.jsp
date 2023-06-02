<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@include file="HomeFooter.jsp" %>
                <%@page import=" java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<meta charset="ISO-8859-1">
<title>Bill</title>
</head>
<body>
<%
int total=0;
int num=0;
int username=1;

Class.forName("com.mysql.cj.jdbc.Driver");
try (Connection connection = DriverManager
    .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

    PreparedStatement preparedStatement = connection
    .prepareStatement("select sum(total)  from cart where product_id='"+username+"'")) {


    System.out.println(preparedStatement);
    ResultSet rs =preparedStatement.executeQuery();
    while(rs.next())
    {
    	total=rs.getInt(1);
    }
    
    PreparedStatement preparedStatement1 = connection
    	      .prepareStatement("select username, email,contact,city,streetname,state,country from customer  where username in (select username from cart)"); 
    	    	  System.out.println(preparedStatement1);
    	    	    ResultSet rs1 =preparedStatement1.executeQuery();
    	      while(rs1.next())
    	      {
%>
<h3>Online shopping Bill</h3>
<hr>
<div class="left-div"><h3>Name: <%=rs1.getString(1) %></h3></div>
<div class="right-div-right"><h3>Email:  <%=rs1.getString(2) %></h3></div>
<div class="right-div"><h3>Mobile Number:  <%=rs1.getString(3) %></h3></div>  

<div class="left-div"><h3>Order Date: 06-12-2021</h3></div>
<div class="right-div-right"><h3>Payment Method: Credit Card  </h3></div>
<div class="right-div"><h3>Expected Delivery:15-12-2021  </h3></div> 

<div class="left-div"><h3>Transaction Id: 45</h3></div>
<div class="right-div-right"><h3>City:  <%=rs1.getString(4) %></h3></div> 
<div class="right-div"><h3>Address:  <%=rs1.getString(5) %></h3></div> 

<div class="left-div"><h3>State:  <%=rs1.getString(6) %></h3></div>
<div class="right-div-right"><h3>Country:  <%=rs1.getString(7) %></h3></div>  

<hr>

<%break;} %>
	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>Product Id</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
  </tr>
  <%
      PreparedStatement preparedStatement2 = connection
      .prepareStatement("select product_id, product_name, category, price from products  where product_id in (select product_id from cart)"); 
    	  System.out.println(preparedStatement2);
    	    ResultSet rs2 =preparedStatement2.executeQuery();
      while(rs2.next())
      {
    	      
      %>
  <tr>
    <td><%=rs2.getInt(1) %></td>
    <td><%=rs2.getString(2) %></td>
    <td><%=rs2.getString(3) %></td>
    <td><%=rs2.getInt(4) %></td>
  </tr>
  <tr>
<%} %>
</table>
<form action="<%= request.getContextPath() %>/HomeServlet" method="get">
<button class="button left-button" type="submit">Continue Shopping</button>
<a onclick="window.print();"><button class="button right-button">Print</button></a></form>
<br><br><br><br>
<%
          	      
}
        catch(Exception e)
        {
        	System.out.println(e);
        	
        }
        %>
</body>
</html>