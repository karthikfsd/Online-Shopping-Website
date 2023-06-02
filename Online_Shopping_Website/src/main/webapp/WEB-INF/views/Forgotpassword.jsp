<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>
<div id='container'>
<div class='signup'>
  <h1>Customer Register Form</h1>
  <form action="PasswordChange" method = "post">
  <input type="email" name="email" placeholder="Enter E-Mail" required>
  <select name ="securityQuestion" required>
  <option value = "What was your first car?">What was your first car?</option>
	<option value = "What is the name of your first pet">What is the name of your first pet</option>
  </select>
  <input type="text" name="answer" placeholder="Enter Answer" required>
  <input type="password" name="password" placeholder ="Enter New Password" required/>
  <input type="submit" value ="save">
  </form>
  </div>
  </div>
</body>
</html>