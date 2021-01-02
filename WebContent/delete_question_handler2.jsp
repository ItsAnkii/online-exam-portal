<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>

<%@ page import=" java.io.PrintWriter"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import=" javax.servlet.http.HttpSession"%>
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
int id=Integer.parseInt(request.getParameter("usr"));

String subject=(String)session.getAttribute("subject");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","root");
String query="delete from "+subject+" where id='"+id+"'";
Statement st=conn.createStatement();
st.executeUpdate(query);
String query2="ALTER TABLE `"+subject+"` DROP `id`";
String query3="ALTER TABLE `"+subject+"` AUTO_INCREMENT = 1";
String query4="ALTER TABLE `"+subject+"` ADD `id` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST";
st.executeUpdate(query2);
st.executeUpdate(query3);
st.executeUpdate(query4);
%>
<h3>Question <%=id %> Deleted Successfully</h3><br>
<h2>
<a href='delete_question.jsp'>Delete Question From Different Subject</a><br>
<a href='welcome_admin.jsp'>Go To Admin Homepage</a><br>
</h2>

</body>
</html>