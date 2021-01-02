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



<h1>&nbsp &nbsp&nbspAvailable Questions Are</h1>
<% 


String subject=request.getParameter("subject");
/* 
HttpSession session = request.getSession(); */
session.setAttribute("subject", subject);


Class.forName("com.mysql.jdbc.Driver");
Connection co = DriverManager.getConnection
("jdbc:mysql://localhost:3306/admin","root","root");
Statement st=co.createStatement();
ResultSet rs3=st.executeQuery("select * from "+subject);
String ques="";
String ans1="";
int id=0;
String ans2="";
String ans3="";
String ans4="";
String correct="";
%>
<table style="border:1px solid red;padding:25px;margin:25px;background:black;color:white;">
<tr style="border:none;padding:25px;margin:25px;">
<th style="border:none;padding:25px;margin:25px;">ID</th>
<th style="border:none;padding:25px;margin:25px;">Question</th>
<th style="border:none;padding:25px;margin:25px;">Answer 1</th>
<th style="border:none;padding:25px;margin:25px;">Answer 2</th>
<th style="border:none;padding:25px;margin:25px;">Answer 3</th>
<th style="border:none;padding:25px;margin:25px;">Answer 4</th>
<th style="border:none;padding:25px;margin:25px;">Correct Answer</th>
</tr>
<%
while(rs3.next())
{
	 ques=rs3.getString("question");
	ans1=rs3.getString("answer1");
	id=rs3.getInt("id");
	ans2=rs3.getString("answer2");
	ans3=rs3.getString("answer3");
	ans4=rs3.getString("answer4");
	correct=rs3.getString("correct");
	
%>
<tr style="border:none;padding:25px;margin:25px;">
<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
<td style="border:none;padding:25px;margin:25px;"><%=ques %></td>
<td style="border:none;padding:25px;margin:25px;"><%=ans1 %></td>
<td style="border:none;padding:25px;margin:25px;"><%=ans2 %></td>
<td style="border:none;padding:25px;margin:25px;"><%=ans3 %></td>
<td style="border:none;padding:25px;margin:25px;"><%=ans4 %></td>
<td style="border:none;padding:25px;margin:25px;"><%=correct %></td>
	
<%
}

%>
</table>
<form action="delete_question_handler2.jsp">
<b><label style="font-family:verdana;font-size=:50px;margin:25px;">Please  Enter The ID of Question you Want To Delete</label></b>
<input style="font-family:verdana;font-size=:50px;margin:25px;width:45px;height:30px"type="text" name="usr" id="usr">
<input  style="font-family:verdana;font-size=:50px;margin:25px;width:65px;height:30px" type="submit">
</form>

</body>
</html>