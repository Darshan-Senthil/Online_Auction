<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction Home</title>
</head>
<body>

    <div style="text-align: center">
        <h1>Welcome to the home page for Admin</h1>
        <b><%=session.getAttribute("usr")%></b>
        <br><br>
        <a href="logout.jsp">Logout</a>
    </div>
</body>
</html>