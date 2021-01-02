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
String sql = "create table admin."+subject+"(id int auto_increment,question varchar(255),answer1 varchar(255),answer2 varchar(255),answer3 varchar(255),answer4 varchar(255),correct varchar(255), primary key(id))";
System.out.println(">>>>"+sql);
int nora = st.executeUpdate(sql);
if(nora >= 0)
{
out.println("<i style='color : blue'>Subject has been Saved</i>");
out.println("<a href='welcome_admin.jsp'>Go to Admin Homepage</a>");
out.println("<a href='add_question.jsp'>Add a Question</a>");
}
%>

</body>
</html>