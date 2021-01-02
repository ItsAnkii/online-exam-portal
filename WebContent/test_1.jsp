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
Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin?user=root&password=root");
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
%>
<fieldset>
<legend>Select Subject</legend>
<form action="test_2.jsp" method="post">
<select name="subject">
<%
for(int index = 0; index < tables.length; index++)
{
%>
<option><%=tables[index]%></option>
<%
}

%>
</select>
<br>
<input type="submit" value="Continue To Test">
</form>
</fieldset>
</body>
</html>