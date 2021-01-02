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
String id = request.getParameter("id");
String subject = request.getParameter("subject"),
ques = request.getParameter("question"),
a1 = request.getParameter("ans1"),
a2 = request.getParameter("ans2"),
a3 = request.getParameter("ans3"),
a4 = request.getParameter("ans4"),
ca = request.getParameter("correct_ans");
Class.forName("com.mysql.jdbc.Driver");
Connection co = DriverManager.getConnection
("jdbc:mysql://localhost:3306/admin","root","root");
Statement st = co.createStatement();
String sql = "insert into admin."+subject+"(question,answer1,answer2,answer3,answer4,correct) values('"+ques+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+ca+"')";
int rec = st.executeUpdate(sql);
if(rec > 0)
{
out.println("<i>Question Added</i>");
out.println("<a href='add_question.jsp'>Add More Questions</a>");
out.println("<a href='welcome_admin.jsp'>Go To Admin Homepage</a>");
}
else
	out.println("Their was a problem adding question");
co.close();
%>




</body>
</html>