<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="HomeFooter.jsp" %>
        <%@page import=" java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>

</head>
<body>
<br>
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
          <th scope="col">
    <form action="<%= request.getContextPath() %>/MyCart" method="get"><i class='fas fa-arrow-circle-left'></i>
        <input type ="submit" value="Back"></form></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">price</th>
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
            </tr>
         <%}
      PreparedStatement preparedStatement2 = connection
    	      .prepareStatement("select streetname, aptno, city, country from customer  where username='pc'"); 
    	    	  System.out.println(preparedStatement2);
    	    	  ResultSet rs2=preparedStatement2.executeQuery();
    	    	   while(rs2.next())
    	    	      {
      %>
        </tbody>
      </table>
      
<hr style="width: 100%">


<h3 style="color: red">Your Order will be delivered to <%=rs2.getString(1)%> <%=rs2.getString(2)%> <%=rs2.getString(3)%> <%=rs2.getString(4)%></h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
<form action="<%= request.getContextPath() %>/BillGenerate" method="get">
 <select class="input-style" name="paymentMethod">
 <option value="Credit Card">Credit Card</option>
 <option value="Debit Card">Debit Card</option>
 </select>
</div>
<div class="right-div">
<h3>Please Enter Your Card Information Below</h3>
<input class="input-style" type="number" name="cardNumber" placeholder ="Enter Card Number" required/><br><br>
<input class="input-style" type="number" name="expirationDate" placeholder ="Enter Expiration Date" required/><br><br>
<input class="input-style" type="number" name="code" placeholder ="Enter Security Code" required/><br><br>
</div>
<hr style="width: 100%">
<div class="right-div">
<button class="button" type="submit">Proceed to Generate Bill <i class='far fa-arrow-alt-circle-right'></i></button></form>
</div>
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