<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: red;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
            color: red;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Item</h2>
        <%
            String test_name = request.getParameter("test_name");

            if (test_name != null && !test_name.isEmpty()) {
                try {
                    // Establish database connection
                    Connect cn = new Connect();
                    cn.DataConnection();
                    
                    // Prepare delete statement
                    String deleteQuery = "DELETE FROM tests WHERE test_name=?";
                    PreparedStatement pstmt = cn.c.prepareStatement(deleteQuery);
                    pstmt.setString(1, test_name);

                    // Execute the delete statement
                    int rowsDeleted = pstmt.executeUpdate();
                    
                    if (rowsDeleted > 0) {
                 response.sendRedirect("ViewTest.jsp");
                    }
                    pstmt.close();
                    
                } catch (SQLException se) {
                }
                }
        %>
       
    </div>
</body>
</html>
