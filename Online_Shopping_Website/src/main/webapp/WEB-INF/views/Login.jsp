<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<meta charset="ISO-8859-1">
<title>Login Form</title>
</head>
<body>

<div id='container'>
<div class='signup'>
  <h1>Customer Login Form</h1>
  <form action="<%= request.getContextPath() %>/Login" method="post">
	<input type="text" name="username" placeholder ="Enter Username" required/>
	<input type="password" name="password" placeholder ="Enter Password" required/>
   <input type="submit" value="Customer Login" />
  </form>
  <form action="<%= request.getContextPath() %>/NewRegister" method="get">
 <input type ="submit" value="Customer Registration">
  </form>
    <form action="<%= request.getContextPath() %>/SellerLogin" method="get">
 <input type ="submit" value="Seller Login">
  </form>
  <form action="<%= request.getContextPath() %>/PasswordChange" method="get">
 <input type ="submit" value="Forgot Password">
  </form>
 </div>
 <div class = "login">
 <h2>Online Shopping Website</h2>
 <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
 </div>
 </div>
</body>
</html>