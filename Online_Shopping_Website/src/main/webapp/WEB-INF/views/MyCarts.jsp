<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@include file="HomeHeader.jsp" %>
    <%@include file="HomeFooter.jsp" %>
        <%@page import=" java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<table>
<thead>
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
    %>
          <tr>
            <th scope="col" style="background-color: yellow;">Total:<%out.println(total); %></th>
            <%if(total>0){ %><th scope="col">
            <form action="<%= request.getContextPath() %>/PaymentForOrder" method="get"><i class='fas fa-pen-fancy'></i>
        <input type ="submit" value="Proceed To Order"></form><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">Product Id</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">price</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      PreparedStatement preparedStatement1 = connection
      .prepareStatement("select product_id, product_name, category, price from products  where product_id in (select product_id from cart)"); 
    	  System.out.println(preparedStatement1);
    	    ResultSet rs1 =preparedStatement1.executeQuery();
      while(rs1.next())
      {
    	      
      %>
          <tr>
           <td><%=rs1.getInt(1) %></td>
            <td><%=rs1.getString(2) %></td>
            <td><%=rs1.getString(3) %></td>
            <td><%=rs1.getInt(4) %></td>
            <td><form action="<%= request.getContextPath() %>/RemoveCart" method="get"><i class='fas fa-pen-fancy'></i>
            <input type ="submit" value="Remove"><i class='fas fa-trash-alt'></i></form></td>
          </tr>

        </tbody>
      </table>
      <%
      }
      }
        catch(Exception e)
        {
        	System.out.println(e);
        	
        }
        %>
      <br>
      <br>
      <br>
      
</body>
</html>