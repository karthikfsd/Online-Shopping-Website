<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file ="SellerHeader.jsp" %>
    <%@page import=" java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<div style="color: Black;  font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>

<table>
        <thead>
          <tr>
            <th scope="col">Product ID</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th>stock</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
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
            <td><form action="<%= request.getContextPath() %>/ProductEditTable" method="get"><i class='fas fa-pen-fancy'></i>
            <input type ="submit" value="Edit"></form></td>
            
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