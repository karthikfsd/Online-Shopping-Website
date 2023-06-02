<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="css/bill.css">
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
    <br>
    <div class="topnav sticky">
    
            <center><h2>Online shopping Website</h2></center>
            <div class="left-div">
            <form action="<%= request.getContextPath() %>/UserDeatils" method="get">
            <button class="button " type="submit">User Information</button><i class="fas fa-user-alt"></i></form>
            <form action="<%= request.getContextPath() %>/HomeServlet" method="get">
            <button class="button " type="submit">Home</button><i class="fa fa-institution"></i></form>
            <form action="<%= request.getContextPath() %>/MyCart" method="get">
            <button class="button " type="submit">My Cart</button><i class="fas fa-cart-arrow-down"></i></form>
            <form action="<%= request.getContextPath() %>/MyOrders" method="get">
            <button class="button " type="submit">My Orders</button><i class="fab fa-elementor"></i></form></div>
            <div class="right-div">
            <form action="<%= request.getContextPath() %>/MessageUs" method="get">
            <button class="button " type="submit">Message Us</button><i class="fas fa-comment-alt"></i></form>
            <form action="<%= request.getContextPath() %>/AboutUs" method="get">
            <button class="button " type="submit">About Us</button><i class="fa fa-address-book"></i></form>
            <form action="<%= request.getContextPath() %>/Logout" method="get">
            <button class="button " type="submit">Logout</button><i class="fas fa-share-square"></i></form></div>
            <div class="search-container">  
            <form action="SearchServlet" method="get">   
            <input type="text" placeholder="Search" name="search"> 
            <button type="submit"><i class="fa fa-search"></i></button></form>    
             
            </div>
          </div>
           <br>


</body>
</html>