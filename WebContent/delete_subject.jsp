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
Class.forName("com.mysql.jdbc.Driver");
Connection co = DriverManager.getConnection
("jdbc:mysql://localhost:3306/admin","root","root");
Statement st = co.createStatement();
Statement st2 = co.createStatement();
String sql = "show tables in admin";
ResultSet rs = st.executeQuery(sql);
ResultSet rs2 = st2.executeQuery(sql);
int records = 0;
while(rs.next())
{
records++;
}
String[] tables = new String[records];
int i = 0;
while(rs2.next())
{
tables[i] = rs2.getString(1);
i++;
}
co.close();
%>
<fieldset>
<legend>Delete A Subject</legend>
<form action="delete_subject_handler.jsp" method="post">
<select name="subject">
<%
for(int index = 0; index < tables.length; index++)
{
%>
<option><%=tables[index]%></option>
<%
}
%>
</select><br><br>
<input type="submit" value="Delete The Subject">
</form>
</fieldset>
</body>
</html>