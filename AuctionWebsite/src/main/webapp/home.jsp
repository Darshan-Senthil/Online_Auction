<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="project1.ApplicationDb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction Home</title>
</head>
<body>
<%
String userid = (String) session.getAttribute("usr");
//HttpSession session = request.getSession();
session.setAttribute("usr", userid);
String password = request.getParameter("password");
//Class.forName("com.mysql.jdbc.Driver");
ApplicationDb db = new ApplicationDb();	
Connection con = db.getConnection();
Statement st = con.createStatement();
%>
    <div style="text-align: center">
        <h1>Welcome to the Auction</h1>
        <b><%=userid%></b>
        <br><br>
        <table align="center">
    		<tr>
    			<td><a href="index.jsp">Q&A</a>
    			<td>|</td>
				<td><a href="index.jsp">Account</a></td>
				<td>|</td>
				<td><a href="index.jsp">Logout</a></td>
   			</tr>
    	</table>
    	<%
    	ResultSet itemList = st.executeQuery("SELECT * FROM ITEM limit 5");
    	%>
    	<br><br>
    	<TABLE align="center" BORDER="1">
    	<caption style="text-align:center">ITEMS CURRENTLY IN AUCTION</caption>
            <TR>
                <TH>Name</TH>
                <TH>ClosingTime</TH>
                <TH>Price</TH>
                <TH>Category</TH>
            </TR>
            <%while(itemList.next()){ 
            	int itemId = itemList.getInt(1);
            	//session.setAttribute("itemId", itemId);
            %>
            <TR>
            	<TD> <%=itemList.getString(2)%></TD>
                <TD> <%= itemList.getString(9) %></TD>
                <TD> <%= itemList.getString(3) %></TD>
                <TD> <%= itemList.getString(8) %></TD>
                
                <TD><a href = "bid.jsp?itemId=<%=itemList.getInt(1)%>">Make a bid</a></TD>
            </TR>
            <%} %>
         </TABLE>
    </div>
</body>
</html>