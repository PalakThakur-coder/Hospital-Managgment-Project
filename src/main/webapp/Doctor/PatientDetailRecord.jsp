<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Records for Patient ID: <%= request.getParameter("id") %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: rgb(5, 60, 104);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: white;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        tr:nth-child(even) {
            background-color: #f1f1f1;
        }
         .back-button {
            text-align: center;
            margin-bottom: 20px;
        }

        .back-button a {
            color: white;
            background-color: red;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .back-button a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="back-button">
        <a href="DoctorHome.jsp">Back</a>
    </div>
    <h2>Patient Records for Patient ID: <%= request.getParameter("id") %></h2>
    
    <table border='1'>
        <tr>
            <th>Slip ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Date</th>
            <th>Doctor</th>
            <th>Prescription</th>
            <th>Tests</th>
        </tr>
        
        <% 
        try {
            Connect cn = new Connect();
            cn.DataConnection();
            
            String patientId = request.getParameter("id");
            
            PreparedStatement ps = cn.c.prepareStatement("SELECT * FROM doctorslip WHERE patientid = ?");
            ps.setString(1, patientId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                
                String slipid = rs.getString("slipid");
                String name = rs.getString("name");
                String age = rs.getString("age");
                String gender= rs.getString("gender");
                String date= rs.getString("date");
                String doctor= rs.getString("doctor");
                String prescription=rs.getString("prescription");
                
                String tests= rs.getString("selectedTest");
                
        %>
                <tr>
                    <td><%= slipid %></td>
                    <td><%= name %></td>
                    <td><%= age %></td>
                    <td><%= gender %></td>
                      <td><%= date %></td>
                     <td><%= doctor %></td>
                    <td><%= prescription %></td>
                    <td><%= tests %></td>
                </tr>
        <%
            }
        } catch(SQLException se) {
            // Handle SQL exception gracefully
            out.println("An error occurred: " + se.getMessage());
        }
        %>
    </table>
    
    
</body>
</html>
