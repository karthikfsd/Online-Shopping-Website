<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import=" java.sql.*"%>
             <link rel="stylesheet" href="css/signup-style.css">
            <% 
int username=1;

Class.forName("com.mysql.cj.jdbc.Driver");
try (Connection connection = DriverManager
    .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

    PreparedStatement preparedStatement = connection
    .prepareStatement("delete from cart where product_id='"+username+"'")) {
    System.out.println(preparedStatement);
    preparedStatement.executeUpdate();
    %>
    
    <form action="<%= request.getContextPath() %>/MyCart" method="get"><i class='fas fa-pen-fancy'></i>
    <h1>Product Successfully Removed From Cart</h1>
        <input type ="submit" value="Back"></form>
<%
}
catch(Exception e)
{
	System.out.println(e);
	
}
%>