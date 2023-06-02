<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@include file="HomeFooter.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="css/bill.css">
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <br>
    <div class="topnav sticky">
   
            <center><h2>Online shopping Website</h2></center>
            
            <div class="left-div">
            
            <form action="<%= request.getContextPath() %>/ProductAddition" method="get">
            <button class="button " type="submit">Add New Product</button><i class="fas fa-plus-square"></i></form>
           
            <form action="<%= request.getContextPath() %>/ProductEdit" method="get">
            <button class="button " type="submit">All Products & Edit Products</button><i class="fab fa-elementor"></i></form>
            <form action="<%= request.getContextPath() %>/Logout" method="get">
            <button class="button " type="submit">Logout</button><i class="fas fa-share-square"></i></form>
            </div>
          </div>
           <br>
</body>
</html>