<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<meta charset="ISO-8859-1">
<title>Customer Registration Form</title>
</head>
<body>
<div id='container'>
<div class='signup'>
  <h1>Customer Register Form</h1>
  <form action="<%= request.getContextPath() %>/register" method="post">
	<input type="text" name="username" placeholder ="Enter Username" required/>
	<input type="email" name="email" placeholder ="Enter E-mail" required/>
		<select name ="securityQuestion" required>
	<option value = "What was your first car?">What was your first car?</option>
	<option value = "What is the name of your first pet">What is the name of your first pet</option>
	</select>
	<input type="text" name="answer" placeholder ="Enter Answer" required/>
	<input type="password" name="password" placeholder ="Enter Password" required/>
	<input type="password" name="re_passowrd" placeholder ="Enter Password" required/>
	<input type="text" name="firstname" placeholder ="Enter Firstname" required/>
	<input type="text" name="lastname" placeholder ="Enter Lastname" required/>
	<input type="text" name="streetname" placeholder ="Enter Streetname" required/>
	<input type="text" name="aptno" placeholder ="Enter Aptno" required/>
	<input type="text" name="city" placeholder ="Enter City" required/>
	<input type="text" name="zipcode" placeholder ="Enter Zipcode" required/>
	<input type="text" name="state" placeholder ="Enter State" required/>
	<input type="text" name="country" placeholder ="Enter Country" required/>
	<input type="number" name="contact" placeholder ="Enter Contact" required/>
   <input type="submit" value="SignUp" />
  </form>
  <form action = "Login">
	<input type ="submit" value="Login">
	</form>
 </div>
 <div class = "whysign">
 <h2>Online Shopping Website</h2>
 <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
 </div>
 </div>
</body>
</html>