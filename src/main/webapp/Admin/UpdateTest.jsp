<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Test</title>
    <style>
        body {
            background-image: url("../img/bg.jpg");
            background-size: cover;
        }
        .update-form {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            font-size: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #6a64f1;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="update-form">
        <h2>Update Test Information</h2>
        <form action="../UpdateTest" method="post">
            <%-- Retrieve the test name from the request parameter --%>
            <% String testName = request.getParameter("test_name"); %>
            <%-- Display the test name in a hidden field for updating --%>
            <input type="hidden" name="testName" value="<%= testName %>">
            <%-- Display the test name in a disabled text field --%>
            <label for="testName">Test Name:</label>
            <input type="text" name="testNameDisplay" value="<%= testName %>" ><br>
            <label for="testFee">New Test Fee:</label>
            <input type="text" name="testFee" required><br>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
