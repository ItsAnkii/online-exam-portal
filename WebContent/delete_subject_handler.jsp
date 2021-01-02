<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style='background-color: #D2B48C;'>

<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<%
String subject = request.getParameter("subject");
Class.forName("com.mysql.jdbc.Driver");
Connection co = DriverManager.getConnection
("jdbc:mysql://localhost:3306/admin","root","root");
Statement st = co.createStatement();
String sql = "drop table "+subject;
st.executeUpdate(sql);

out.println("<i>Subject Deleted</i>");
out.println("<a href='welcome_admin.jsp'>Go To Admin Homepage</a>");

co.close();
%>
</body>
</html>