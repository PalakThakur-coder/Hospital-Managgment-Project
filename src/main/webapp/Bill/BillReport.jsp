<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill Report</title>
    <style>
        .search-bar {
            width: 60%;
            margin-top: 2%;
            margin-left: 20%;
        }
        .search-bar form .fields {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .search-type {
            width: 10%;
            height: 40px;
            border-radius: 10px;
        }
        .search-term {
            width: 20%;
            height: 40px;
            border-radius: 10px;
        }
        label {
            font-weight: bold;
            display: flex;
            margin-bottom: 5px;
            font-size: 25px;
        }
        input[type="submit"] {
            text-align: center;
            border-radius: 6px;
            background-color: #6a64f1;
            color: white;
            height: 40px;
            cursor: pointer;
            width: 100px;
            font-size: 20px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
            color: black;
        }
        .totalamount {
            position: absolute;
            top: 20px;
            right: 20px;
            color: black;
            font-size: 25px;
            font-weight: 600;
        }
        h2 {
            text-align: center;
            color: blue;
            font-size: 30px;
        }
        .show-all-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #6a64f1;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 20px;
            cursor: pointer;
            margin:15px;
            outline:none;
        }
        .show-all-button:hover {
            background-color: #0056b3;
        }
        
    </style>
</head>
<body>
<% int totalSlips = 0; %>

    <h2>Bill Report</h2>
    
    
<div class="search-bar">
    <form action="BillReport.jsp" method="post">
        <div class="fields">
            <label for="startDate">From Start Date</label>
            <input type="date" name="startDate" class="search-term">
            <label for="endDate">To End Date</label>
            <input type="date" name="endDate" class="search-term">
            <input type="submit" value="Search" class="search-type">
            <h3>or</h3>
            <a href="BillReport.jsp" class="show-all-button">Reset</a>
            <input type="button" value="Print" onclick="printReport();" class="show-all-button">
        </div>
    </form>
</div>
<h2>Search Results</h2>
<table border='1'>
    <tr>
        <th>Bill No</th>
        <th>PatientID</th>
        <th>Name</th>
        <th>Date</th>
        <th>Services</th>
        <th>Total Fees</th>
        <th>Pay</th>
        <th>Pending</th>
    </tr>
    <% 
    double totalAmount = 0.0; 
    double payAmount = 0.0; 
    double pendingAmount = 0.0; 
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    // Check if both start and end dates are provided
    if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
        try {
            Connect cn = new Connect();
            cn.DataConnection();
            String query = "SELECT id, patient_id,patient_name, selected_tests, total_amount,pay_amount,pending_amount, date FROM billing_table WHERE date BETWEEN ? AND ?";
            PreparedStatement pstmt = cn.c.prepareStatement(query);
            pstmt.setString(1, startDate);
            pstmt.setString(2, endDate);
            ResultSet rs = pstmt.executeQuery();
                    
            while (rs.next()) {
                String id = rs.getString("id");
                String patient_id = rs.getString("patient_id");
                String name = rs.getString("patient_name");
                String date = rs.getString("date");
                String selectedTests = rs.getString("selected_tests");
                String totalAmountStr = rs.getString("total_amount");
                String payamountStr = rs.getString("pay_amount");
                String pendingamountStr = rs.getString("pending_amount");
                
                totalAmount += Double.parseDouble(totalAmountStr);
                payAmount += Double.parseDouble(payamountStr);
                pendingAmount += Double.parseDouble(pendingamountStr);// Update totalAmount
    %>
    <tr>
        <td><%= id %></td>
        <td><%= patient_id %></td>
        <td><%= name %></td>
        <td><%= date %></td>
        <td><%= selectedTests %></td>
        <td><%= totalAmountStr %></td>
        <td><%= payamountStr %></td>
        <td><%= pendingamountStr %></td>
    </tr>
    <% 
            }
    %>
</table>
<div class="totalamount">
Total Amount: <%= totalAmount %><br>
Pay Amount: <%= payAmount %><br>
Pending Amount: <%= pendingAmount %>


</div> <!-- Display total amount below the table -->
<%
        } catch (SQLException se) {
            out.println(se);
        }
    }
%>
<script>

function printReport() {
    // Get the selected start and end dates from the form.
    var startDate = '<%= request.getParameter("startDate") %>';
    var endDate = '<%= request.getParameter("endDate") %>';
    var totalAmount = '<%= totalAmount %>'; // Get total bill amount from JSP
    var payAmount = '<%= payAmount %>'; // Get total pay amount from JSP
    var pendingAmount = '<%= pendingAmount %>'; // Get total pending amount from JSP

    // Create a reference to the current page.
    var originalContent = document.body.innerHTML;

    // Open a new window for printing.
    var printWindow = window.open('', '', 'width=800, height=600');

    // Construct the HTML content for the printed report.
    var content = '<div class="report-header">' +
                      '<h2>Bill Report</h2>' +
                      '<h3>From: ' + startDate + ' To: ' + endDate + '</h3>' +
                      '<h3>Total Amount: ' + totalAmount + '</h3>' +
                      '<h3>Pay Amount: ' + payAmount + '</h3>' +
                      '<h3>Pending Amount: ' + pendingAmount + '</h3>' +
                  '</div>' +
                  '<table border="1">' + document.querySelector("table").outerHTML + '</table>';

    // Set the content of the new window.
    printWindow.document.write(content);

    // Print the content in the new window.
    printWindow.print();

    // Close the new window after printing.
    printWindow.onafterprint = function () {
        printWindow.close();
    };

    // Restore the original content to the current page.
    document.body.innerHTML = originalContent;
}
</script>


</body>
</html>
