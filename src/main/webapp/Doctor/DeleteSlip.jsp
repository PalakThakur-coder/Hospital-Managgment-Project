<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Slip Handler</title>
    <style>
        body {
            background-color: white;
        }
        h2 {
            text-align: center;
            color: blue;
            font-size: 30px;
        }
        p {
            text-align: center;
            font-size: 20px;
            color: red;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #6a64f1;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 20px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Delete Slip Handler</h2>
    <%
    String s_id = request.getParameter("s_id");
    try {
        Connect cn = new Connect();
        cn.DataConnection();

        // Perform the actual delete operation based on s_id
        PreparedStatement ps = cn.c.prepareStatement("DELETE FROM slips WHERE s_id = ?");
        ps.setString(1, s_id);
        int rowsDeleted = ps.executeUpdate();

        if (rowsDeleted > 0) {
    %>
            <p>Slip with ID <%= s_id %> has been successfully deleted.</p>
            <a href="TotalSlip.jsp">Back to Total Slips</a>
    <%
        } else {
    %>
            <p>Error deleting the slip.</p>
            <a href="TotalSlip.jsp">Back to Total Slips</a>
    <%
        }
    } catch (SQLException se) {
        out.println(se);
    }
    %>
</body>
</html>
