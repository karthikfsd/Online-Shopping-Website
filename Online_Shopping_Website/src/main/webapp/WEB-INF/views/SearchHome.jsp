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
<title>Search Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
      
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
        int z=0;
        String search = request.getParameter("search");
        	Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

                PreparedStatement preparedStatement = connection
                .prepareStatement("select product_id, product_name, category, price,stock  from products where product_name like '%"+search+"%' or category like '%"+search+"%'")) {


                System.out.println(preparedStatement);
                ResultSet rs =preparedStatement.executeQuery();
            while(rs.next())
            {     
            	z=1;
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
      <%if(z==0){      
      %>
      <h1 style="color:white; text-align: center;">Nothing to show</h1>
      <%} %>
      <br>
      <br>
      <br>
</body>
</html>