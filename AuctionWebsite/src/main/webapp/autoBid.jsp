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
int itemId= Integer.parseInt(request.getParameter("itemId"));
int bidAmt= Integer.parseInt(request.getParameter("bidAmt"));
ApplicationDb db = new ApplicationDb();	
Connection con = db.getConnection();
Statement st = con.createStatement();
String destPage = "home.jsp";
int flag =1;
ResultSet otherUsers = st.executeQuery("SELECT b.*, i.bidIncrement FROM BID b INNER JOIN item i on b.itemId = i.itemid WHERE b.itemId = '"+itemId+"' AND b.autoIncrement = 'Y' AND b.bidAmt <="+bidAmt+ " AND b.userId <>'"+userid+"' AND (b.bidAmt+i.bidIncrement) < b.upperLimit");
while(flag == 1){
	PreparedStatement ps = con.prepareStatement("UPDATE BID SET bidAmt = ?, bidTime = CURRENT_TIMESTAMP where itemId = ? AND userId = ? and bidId = ?");
	while(otherUsers.next()){
		String user = otherUsers.getString(5);
		int newAmt = otherUsers.getInt(2)+otherUsers.getInt(8);
		ps.setInt(1,newAmt);
		ps.setInt(2,itemId);
		ps.setString(3,user);
		ps.setInt(4,otherUsers.getInt(1));
		if(otherUsers.getInt(2)+otherUsers.getInt(8) < otherUsers.getInt(4)){
			ps.executeUpdate();	
		}
	}
	otherUsers.close();
	ResultSet maxUser = st.executeQuery("SELECT userId, bidAmt from bid where itemId ="+itemId+" and bidAmt = (select max(bidAmt) from bid where itemId ="+itemId+" )");
	maxUser.next();
	int maxAmt = maxUser.getInt(2);
	String avoidUser = maxUser.getString(1);
	otherUsers = st.executeQuery("SELECT b.*, i.bidIncrement FROM BID b INNER JOIN item i on b.itemId = i.itemid WHERE b.itemId = '"+itemId+"' AND b.autoIncrement = 'Y' AND b.bidAmt < "+maxAmt+" AND b.userId <> '"+avoidUser+"' AND (b.bidAmt+i.bidIncrement) < b.upperLimit");
	if(!otherUsers.isBeforeFirst()){
		flag =0;
	}
	
}
RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
dispatcher.forward(request, response);
%>
</body>
</html>