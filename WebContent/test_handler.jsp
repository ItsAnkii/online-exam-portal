<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page language="java" %>
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
String subject=(String)session.getAttribute("subject");
Class.forName("com.mysql.jdbc.Driver");
Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin?user=root&password=root");
Statement st = cn.createStatement();
ResultSet rs = null;
try {
rs = st.executeQuery("select * from "+subject);

/* ResultSetMetaData rsmd = rs.getMetaData();*/

String s1,s2,s3,s4;
int i=1;
int correct=0,incorrect=0,total=0;
out.println("<h2><br><br><center><table border=1 cellpadding=2 cellspacing=2><tr><th>Question</th><th>Your Answer</th><th>Correct Answer</th><th>Status</th></tr>");
while(rs.next())
{
total++ ;

s1 = rs.getString(2);
s2 = request.getParameter("opt"+i);
s3 = rs.getString(7);
if(s2.equals(s3))
{
    s4="Correct";
    correct++  ;
}
else
{
    s4="Incorrect";
    incorrect++  ;
}   
out.println("<tr><td>" +s1+ "</td><td>" +s2+ "</td><td>" +s3+ "</td><td>" +s4+ "</td></tr>");
i++  ;
}
out.println("</table><br><br><table><b><tr><td>Correct Answers</td><td>" +correct+ "</td></tr>");
out.println("<tr><td>Incorrect Answers</td><td>" +incorrect+ "</td></tr>");
out.println("<tr><td>Total Questions</td><td>" +total+ "</td></tr></table></b></center></h2>");

}
  finally {
try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
try { if( null != st ) st.close(); } catch( Exception ex ) {}
try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
}

%>
</body>
</html>