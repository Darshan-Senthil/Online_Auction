<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="project1.ApplicationDb"%>
<!DOCTYPE html>


<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Auction Page - Login Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div id="particles-js"></div>
<body class="login">
	<div class="container">
		<div class="login-container-wrapper clearfix">
			<div class="logo">
				<i class="fa fa-sign-in"></i>
			</div>
			<div class="welcome"><strong>Welcome,</strong> please login</div>

			<form action="login.jsp" method="post" class="form-horizontal login-form">
				<div class="form-group relative">
					<input id="login_username" class="form-control input-lg" type="text" name="usr" placeholder="Username" required>
					<i class="fa fa-user"></i>
				</div>
				<div class="form-group relative password">
					<input id="login_password" class="form-control input-lg" type="password" name="password" placeholder="Password" required>
					<i class="fa fa-lock"></i>
				</div>
				${message}<br> <br>
			  <div class="form-group">
			    <button type="submit" class="btn btn-success btn-lg btn-block">Login</button>
			  </div>
       
			  <div class="checkbox pull-right">
			    <label> <a class="forget" href="createNewUser.jsp" title="forget">Create new account</a> </label>
			  </div>
			</form>
		</div>
	</div>

  </body>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src='https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js'></script><script  src="./script.js"></script>

</body>
</html>