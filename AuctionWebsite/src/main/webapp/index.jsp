<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="project1.ApplicationDb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login to your account</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body><h2>Log In</h2>
 <form action="login.jsp" method="post">Username<input type="text" name="usr" /><br><br>Password<input
   type="password" name="password" /><br>${message}<br> <br><b><input type="submit"/></b><br> <a href = "createNewUser.jsp">New User?</a>
 </form>
</body>
</html>