<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Report</title>
    <style>
        body {
          
         
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            display: flex;
            justify-content: space-between;
            width: 100%;
         
            padding: 20px;
            border-radius: 10px;
        
        }
       
        .left-section, .right-section {
            width: 45%;
            padding: 20px;
        }
       
        .right-section {
            overflow: auto;
        }
        .search-bar {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .action-buttons a {
            text-decoration: none;
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            margin-right: 5px;
        }
        .action-buttons a:hover {
            background-color: #45a049;
        }
         .add-item-button {
        background-color: #6a64f1;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px; /* Adjust margin as needed */
    }

    .add-item-button:hover {
        background-color: #0056b3;
    }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-section">
            <h2>Add a New Item</h2>
            <form action="../AddTest" method="post">
                <label for="testName">Item Name:</label>
                <input type="text" id="testName" name="testname" required><br>
                <input type="submit" value="Add Item" class="add-item-button">
            </form>
        </div>
        <div class="right-section">
            <div class="search-bar">
                <h2>Total Items</h2>
                <!-- Your search bar content -->
            </div>
            <table border='1'>
                <tr>
                    <th>Test Name</th>
                    <th>Action</th>
                </tr>
                <% 
                    String selectedTest = request.getParameter("selectedTest");
                    try {
                        Connect cn = new Connect();
                        cn.DataConnection();
                        String query = "SELECT test_name FROM tests";
                        if (selectedTest != null && !selectedTest.isEmpty()) {
                            query = "SELECT test_name FROM tests WHERE test_name=?";
                        }
                        PreparedStatement pstmt = cn.c.prepareStatement(query);
                        if (selectedTest != null && !selectedTest.isEmpty()) {
                            pstmt.setString(1, selectedTest);
                        }
                        ResultSet rs = pstmt.executeQuery();
                        while (rs.next()) {
                            String test_name = rs.getString("test_name");
                %>
                <tr>
                    <td><%= test_name %></td>
                    <td class="action-buttons">
                        <a href="DeleteTest.jsp?test_name=<%= test_name %>">Delete</a>
                    </td>
                </tr>
                <%
                        }
                        rs.close();
                        pstmt.close();
                        cn.c.close();
                    } catch (SQLException se) {
                        out.println(se);
                    }
                %>
            </table>
        </div>
    </div>
</body>
</html>
