<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file ="SellerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div align="center">
  <h1>Product Addition Form</h1>
  <form action="<%= request.getContextPath() %>/ProductAddition" method="post">
   <table style="with: 80%">
    <tr>
     <td>Product Name</td>
     <td><input type="text" name="product_name" /></td>
    </tr>
    <tr>
     <td>Category</td>
     <td><input type="text" name="category" /></td>
    </tr>
    <tr>
     <td>Seller Id</td>
     <td><input type="text" name="seller_id" /></td>
    </tr>
    <tr>
     <td>Seller Name</td>
     <td><input type="text" name="seller_name" /></td>
    </tr>
    <tr>
     <td>Price</td>
     <td><input type="text" name="price" /></td>
    </tr>
        <tr>
     <td>Stock</td>
     <td><input type="text" name="stock" /></td>
    </tr>
        <tr>
     <td>Weight</td>
     <td><input type="text" name="weight" /></td>
    </tr>
        <tr>
     <td>Color</td>
     <td><input type="text" name="color" /></td>
    </tr>
        <tr>
     <td>Size</td>
     <td><input type="text" name="size" /></td>
    </tr>
        <tr>
     <td>Date</td>
     <td><input type="date" name="date" /></td>
    </tr>
   </table>
   <input type="submit" value="Add" />
  </form>
  	<form action = "Logout">
	<input type ="submit" value="Logout">
	</form>
 </div>
 
</body>
</html>