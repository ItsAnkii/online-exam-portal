<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style='background-color: #D2B48C;'>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<h1>&nbsp &nbsp&nbspAvailable Company Are</h1>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","root");
String query="select * from company_table";
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(query);
String stt="";
String stt2="";
int id=0;
String mob="";
%>
<table style="border:1px solid red;padding:25px;margin:25px;background:black;color:white;">
<tr style="border:none;padding:25px;margin:25px;">
<th style="border:none;padding:25px;margin:25px;">ID</th>
<th style="border:none;padding:25px;margin:25px;">Company Name</th>
<th style="border:none;padding:25px;margin:25px;">Email</th>
<th style="border:none;padding:25px;margin:25px;">mobile</th>
</tr>
<%
while(rs.next())
{
	 stt=rs.getString("name");
	stt2=rs.getString("email");
	id=rs.getInt("id");
	mob=rs.getString("mobile");
	%>
<tr style="border:none;padding:25px;margin:25px;">
<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
	
<%
}

%>
</table>
<form action="do_delete_company.jsp">
<b><label style="font-family:verdana;font-size=:50px;margin:25px;">Please  Enter The id of User you Want To Delete</label></b>
<input style="font-family:verdana;font-size=:50px;margin:25px;width:45px;height:30px"type="text" name="usr" id="usr">
<input  style="font-family:verdana;font-size=:50px;margin:25px;width:65px;height:30px" type="submit">
</form>
</body>
</html>