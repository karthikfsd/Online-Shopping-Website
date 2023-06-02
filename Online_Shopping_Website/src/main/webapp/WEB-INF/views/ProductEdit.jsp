<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@include file ="SellerHeader.jsp" %>
    <%@page import=" java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<meta charset="ISO-8859-1">
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>

<%
        	Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

                PreparedStatement preparedStatement = connection
                .prepareStatement("select product_id, product_name, category, price,stock  from products where product_id =1")) {


                System.out.println(preparedStatement);
                ResultSet rs =preparedStatement.executeQuery();
                while(rs.next())
                {           	
            %>
            <form action="ProductEditPopulate" method="get">
            <div class="left-div">
 <h3>Product Name</h3>
<input class = "input-style" type ="number" name="product_id" value="<%=rs.getString(1) %>" required>
<hr>
</div>
<div class="left-div">
 <h3>Product Name</h3>
<input class = "input-style" type ="text" name="product_name" value="<%=rs.getString(2) %>" required>
<hr>
</div>

<div class="right-div">
<h3>Category</h3>
 <input class = "input-style" type ="text" name="category" value="<%=rs.getString(3) %>" required>
<hr>
</div>

<div class="left-div">
<h3>Price</h3>
 <input class = "input-style" type ="number" name="price" value="<%=rs.getString(4) %>" required>
<hr>
</div>

<div class="right-div">
<h3>Stock</h3>
<input class = "input-style" type ="text" name="stock" value="<%=rs.getString(5) %>" required>
 <hr>
</div>
 <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
	<%
            }
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }
    %>

</body>
<br><br><br>
</body>
</html>