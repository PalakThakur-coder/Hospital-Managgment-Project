<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import ="java.sql.*" %>
    <%@page import ="connect.Connect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
String s1=request.getParameter("name");
String s2=request.getParameter("specialist");
Connect cn = new Connect();
cn.DataConnection();
java.sql.PreparedStatement ps =  cn.c.prepareStatement("insert into doctor(name,specialist) values(?,?)");

ps.setString(1,s1);
ps.setString(2,s2);
 int i=ps.executeUpdate();
 
ps.close();
if(i>0)
{
	out.println("added");
}
}catch(SQLException se)
{
	out.println(se);
}
%>
</body>
</html>