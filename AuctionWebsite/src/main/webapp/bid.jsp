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
<div style="text-align: center">
<% String userid = (String) session.getAttribute("usr");
//int itemId = (int) session.getAttribute("itemId");
int itemId= Integer.parseInt(request.getParameter("itemId"));
ApplicationDb db = new ApplicationDb();	
Connection con = db.getConnection();
Statement st = con.createStatement();
ResultSet bidDetails = st.executeQuery("SELECT * FROM BID WHERE itemId = "+itemId+" AND bidAmt = (SELECT MAX(bidAmt) from bid b where b.itemId = "+itemId+")");
int currAmt = 0;
if(bidDetails.next()){
	currAmt = bidDetails.getInt(2);
	}
%>
<form class="form-inline" method="post" action="Verifybid.jsp?itemId=<%=itemId%>">
		Enter Bid amount. Current bid Amount is <%=currAmt%><input type="number" name="bidAmt" /><br><br>
		Enter if you want to auto bid<select name="autoBid" id="autoBid">
		<option>Y</option>
		<option>N</option>
		</select><br><br>
		Enter upper limit for auto bid.<input type="number" name="upperLimit" /><br><br>
		Closing Date/Time: <input type="datetime-local" name="dt" /><br><br>
		<input type="submit"/><br><br>
  </form>
</div>
</body>
</html>