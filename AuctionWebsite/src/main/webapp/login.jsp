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
</head>
<body>
<%
String userid = request.getParameter("usr");
//HttpSession session = request.getSession();
session.setAttribute("usr", userid);
String password = request.getParameter("password");
//Class.forName("com.mysql.jdbc.Driver");
ApplicationDb db = new ApplicationDb();	
Connection con = db.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from endUser where userId='" + userid + "' and password='" + password + "'");
String destPage = "home.jsp"; 
if(rs.next()){
	 
	 if (rs.getString("password").equals(password) && rs.getString("userid").equals(userid)) {
		  //out.println("<h2>Welcome/<h2>");
		  if(rs.getString("usertype").equals("u")){
			  destPage = "home.jsp";
		  }
		  else if(rs.getString("usertype").equals("c")){
			  destPage = "homeCR.jsp";
		  }
		  else{
			  destPage = "homeAdmin.jsp";
		  }
		 }
 }
 else{
	 //System.out.println("error");
	//	out.println("<h2>Invalid password or username.</h2>");
	destPage = "index.jsp";
	String message = "Invalid email/password. Try again.";
    request.setAttribute("message", message);	
} 
 RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
 dispatcher.forward(request, response);
%>
</body>
</html>