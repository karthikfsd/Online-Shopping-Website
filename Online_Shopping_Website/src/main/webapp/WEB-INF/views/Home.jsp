<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="HomeHeader.jsp" %>
    <%@include file="HomeFooter.jsp" %>
        <%@page import=" java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>

<div style="color: Black; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
      
      <table>
        <thead>
          <tr>
            <th scope="col">Product ID</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th>stock</th>
            <th scope="col">Add to cart<i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
        	Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

                PreparedStatement preparedStatement = connection
                .prepareStatement("select product_id, product_name, category, price,stock  from products")) {


                System.out.println(preparedStatement);
                ResultSet rs =preparedStatement.executeQuery();
            while(rs.next())
            {           	
        %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><form action="<%= request.getContextPath() %>/AddToCart" method="get"><i class='fas fa-cart-plus'></i>
            <input type ="submit" value="Add To Cart"></form></td>
            
          </tr>
         <%
            }
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
</body>
</html>