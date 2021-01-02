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

<div id='timer' />
<script type="text/javascript">window.onload = CreateTimer("timer", 60);</script>


<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>



<%
String subject = request.getParameter("subject");


session.setAttribute("subject", subject);



Class.forName("com.mysql.jdbc.Driver");
Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin?user=root&password=root");
Statement st = co.createStatement();
Statement st2 = co.createStatement();

ResultSet rs= st.executeQuery("select * from "+subject);


/* 
ResultSetMetaData rsmd = rs.getMetaData(); */


String s1,s2,s3,s4;
int i=1;
while(rs.next())
{

out.println("<form name='exam' action='test_handler.jsp' method='post'><b>" +i+ " . " +  rs.getString(2) +  "</b><br><br>");
s1 = rs.getString(3);
s2 = rs.getString(4);
s3 = rs.getString(5);
s4 = rs.getString(6);
out.println("<input type=radio name=opt"+i+" value=" +s1+ ">" + s1 + "<br><br>");
out.println("<input type=radio name=opt"+i+" value=" +s2+ ">" + s2 + "<br><br>");
out.println("<input type=radio name=opt"+i+" value=" +s3+ ">" + s3 + "<br><br>");
out.println("<input type=radio name=opt"+i+" value=" +s4+ ">" + s4 + "<br><br>");
i++ ;
}



out.println("<input name ='submit' value='Submit' type='submit'/>");


/*
int n = rsmd.getColumnCount();
out.println( "<table border=1 cellspacing=3><tr>" );
for( int j=1; j<=n; j++   ) // Achtung: erste Spalte mit 1 statt 0
{
out.println( "<th>" +  rsmd.getColumnName( j ) +  "</th>" );
while( rs.next() )
{
out.println( "</tr><tr>" );
for( int k=1; k<=n; k++   ) // Achtung: erste Spalte mit 1 statt 0
out.println( "<td nowrap>" +  rs.getString( k )  + "</td>" );
}
out.println( "</tr></table>" );
} */



co.close();

%>







</body>
</html>