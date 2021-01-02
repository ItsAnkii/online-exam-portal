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
<legend>Add-Question</legend>

<form action="add_question_handler.jsp" method="post">
Selct Subject<br>
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

            <table cellpadding="10">
                    
                    <td><b>Question:</b></td>
                    <td><textarea rows="10" cols="100" name="question" required></textarea></td>
                </tr>
                
                <tr>
                    <td><b>A:</b></td>
                    <td><textarea rows="2" cols="50" name="ans1" required></textarea></td>
                </tr>

                <tr>
                    <td><b>B:</b></td>
                    <td><textarea rows="2" cols="50" name="ans2" required></textarea></td>
                </tr>

                <tr>
                    <td><b>C:</b></td>
                    <td><textarea rows="2" cols="50" name="ans3" required></textarea></td>
                </tr>

                <tr>
                    <td><b>D:</b></td>
                    <td><textarea rows="2" cols="50" name="ans4" required></textarea></td>
                </tr>
                
                <tr>
                <td><b>Answer:</b></td>
                <td>  <textarea rows="2" cols="50" name="correct_ans" required></textarea></td>
                </tr>


                <tr>
                    <td colspan="2" align="left"><input type="submit" value="Add This Question"/></td>
                </tr>
            </table>
        </form>        
</fieldset>
</body>
</html>