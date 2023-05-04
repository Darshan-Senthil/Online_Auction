<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="project1.ApplicationDb"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String userid = (String) session.getAttribute("usr");
//int itemId = (int) session.getAttribute("itemId");
int itemId= Integer.parseInt(request.getParameter("itemId"));
ApplicationDb db = new ApplicationDb();	
Connection con = db.getConnection();
Statement st = con.createStatement();
int bidAmt= Integer.parseInt(request.getParameter("bidAmt"));
String autoBid = request.getParameter("autoBid");
int upperLimit = Integer.parseInt(request.getParameter("upperLimit"));
String dt = request.getParameter("dt");
String destPage = "home.jsp";
ResultSet bidDetails = st.executeQuery("SELECT * FROM BID WHERE itemId = "+itemId+" AND userId = '"+userid+"'");
if(bidDetails.next()){
	PreparedStatement ps = con.prepareStatement("UPDATE BID SET bidAmt = ?, bidTime = CURRENT_TIMESTAMP where itemId = ? AND userId = ? and bidId = ?");
	ps.setInt(1,bidAmt);
	ps.setInt(2,itemId);
	ps.setString(3,userid);
	ps.setInt(4,bidDetails.getInt(1));
	ps.executeUpdate();
}
else{
	PreparedStatement ps = con.prepareStatement("insert into bid (bidAmt, bidTime, upperLimit, userId, itemId, autoIncrement) VALUES(?,CURRENT_TIMESTAMP,?,?,?,?)");
	ps.setInt(1,bidAmt);
	//ps.setString(2,dt);
	ps.setInt(2,upperLimit);
	ps.setString(3,userid);
	ps.setInt(4,itemId);
	ps.setString(5,autoBid);
	ps.executeUpdate();	
}

ResultSet otherUsers = st.executeQuery("SELECT * FROM BID WHERE itemId = '"+itemId+"' AND autoIncrement = 'Y' AND bidAmt <="+bidAmt+ " AND userId <>'"+userid+"'");
if(otherUsers.next()){
	destPage = "autoBid.jsp?itemId="+ itemId;
	request.setAttribute("bidAmt",bidAmt);
}
RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
dispatcher.forward(request, response);
%>
</body>
</html>