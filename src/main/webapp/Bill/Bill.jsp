<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="connect.Connect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Billing System</title>
</head>
<body>
<%
    PreparedStatement stmt;
    Connect cn;
    ResultSet rs;
    int id = -1; // Initialize ID variable with -1

    String patientID = request.getParameter("patientID");
    String patientName = request.getParameter("patientName");
    String date = request.getParameter("date");
    String gender = request.getParameter("gender");
    String fathername = request.getParameter("fathername");
    String mobileno = request.getParameter("mobileno");
    String city = request.getParameter("city");
    String[] selectedTestsData = request.getParameter("selectedTestsData").split(";");

    // Calculate total amount from selected tests data
    double totalAmount = 0.0;
    for (String testData : selectedTestsData) {
        String[] parts = testData.split(":");
        if (parts.length == 2) {
            double testPrice = Double.parseDouble(parts[1]);
            totalAmount += testPrice;
        }
    }

    // Get other form data
    double payAmount = Double.parseDouble(request.getParameter("payAmount"));
    double pendingAmount = totalAmount - payAmount;

    cn = new Connect();
    cn.DataConnection();
    try {
        // Insert data into the billing_table and retrieve the auto-generated patient ID
        stmt = cn.c.prepareStatement("INSERT INTO billing_table (patient_id, patient_name, date, selected_tests, total_amount, pay_amount, pending_amount, gender, fathername, mobileno, city) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, patientID);
        stmt.setString(2, patientName);
        stmt.setString(3, date);
        stmt.setString(4, String.join(",", selectedTestsData)); // Join test names with comma
        stmt.setDouble(5, totalAmount);
        stmt.setDouble(6, payAmount);
        stmt.setDouble(7, pendingAmount);
        stmt.setString(8, gender);
        stmt.setString(9, fathername);
        stmt.setString(10, mobileno);
        stmt.setString(11, city);
        stmt.executeUpdate();

        // Retrieve the auto-generated patient ID
        rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            id = rs.getInt(1);
        }

        stmt.close();

        // Redirect to billcreate.jsp with patient ID
        if (id != -1) {
            response.sendRedirect("BillSlip.jsp?id=" + id);
        } 
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    }
%>
</body>
</html>
