<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill Details</title>
<style>

.serchbar {
    width: 60%;
    height: 5%;
    margin-top: 2%;
    margin-left: 0px;
    margin-bottom: 0%;
}
.serchbar form .fields {
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
}
.searchType {
    width: 10%;
    height: 40px;
    border-radius: 10px;
}
.searchTerm {
    width: 20%;
    height: 40px;
    border-radius: 10px;
}
label {
    font-weight: bold;
    display: flex;
    margin-bottom: 5px;
    font-size: 20px;
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
    text-color: black;
}
td a {
    display: inline-block;
    padding: 2px 5px;
    margin-right: 2px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 15px;
    transition: background-color 0.3s ease;
}
td a:hover {
    background-color: #0056b3;
}
h2 {
    text-align: center;
    text-color: white;
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
}
.show-all-button:hover {
    background-color: #0056b3;
}
.edit-form {
    display: none;
}
</style>
</head>
<body>

<div class="serchbar">
    <h2>Bill Details</h2>
    <form action="ViewBill.jsp">
        <div class="fields">
            <label for="searchType">Search by:</label>
            <select name="searchType" class="searchType" id="searchType">
                <option value="id">Billno</option>
                <option value="patient_id">Patient ID</option>
                <option value="patient_name">Patient Name</option>
            </select>
            <br><br>
            <label for="searchTerm">Search Term:</label>
            <input type="text" name="searchTerm" class="searchTerm" id="searchTerm">
            <input type="submit" value="Search">
            <h3>or</h3>
            <a href="ViewBill.jsp" class="show-all-button">Reset</a>
        </div>
    </form>
</div>
<h2>Search Results</h2>
<table border='1'>
    <tr>
        <th>ID</th>
        <th>Patient ID</th>
        <th>Patient Name</th>
         <th>Gender</th>
        <th>Father's Name</th>
        <th>Mobile Number</th>
        <th>City</th>
        <th>Date</th>
        <th>Items</th>
        <th>Total Amount</th>
        <th>Pay Amount</th>
        <th>Pending Amount</th>
        <th colspan="2">Action</th>
    </tr>
    <% 
    try {
        Connect cn = new Connect();
        cn.DataConnection();
        String query = "";
        String searchType = request.getParameter("searchType");
        String searchTerm = request.getParameter("searchTerm");
        
        if (searchType != null && searchTerm != null) {
            if ("id".equals(searchType)) {
                query = "SELECT * FROM billing_table WHERE id LIKE ?";
            } else if ("patient_id".equals(searchType)) {
                query = "SELECT * FROM billing_table WHERE patient_id LIKE ?";
            } else if ("patient_name".equals(searchType)) {
                query = "SELECT * FROM billing_table WHERE patient_name LIKE ?";
            }
        }
        
        PreparedStatement ps;
        if (!query.isEmpty()) {
            ps = cn.c.prepareStatement(query);
            ps.setString(1, "%" + searchTerm + "%");
        } else {
            // If no search type is selected, fetch all records
            ps = cn.c.prepareStatement(query);
        }
        
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            String id = rs.getString("id");
            String patientID = rs.getString("patient_id");
            String patientName = rs.getString("patient_name");
            String gender = rs.getString("gender");
            String fatherName = rs.getString("fathername");
            String mobileNumber = rs.getString("mobileno");
            String city = rs.getString("city");
            String date = rs.getString("date");
            String selectedTests = rs.getString("selected_tests");
            String totalAmount = rs.getString("total_amount");
            String payAmount = rs.getString("pay_amount");
            String pendingAmount = Double.toString(Double.parseDouble(totalAmount) - Double.parseDouble(payAmount));
    %>
    <tr>
        <td><%= id %></td>
        <td><%= patientID %></td>
        <td><%= patientName %></td>
         <td><%= gender %></td>
        <td><%= fatherName %></td>
        <td><%= mobileNumber %></td>
        <td><%= city %></td>
        <td><%= date %></td>
        <td><%= selectedTests %></td>
        <td><%= totalAmount %></td>
        <td><%= payAmount %></td>
        <td><%= pendingAmount %></td>
        
           
             <td>  <a href="UpdateBill.jsp?id=<%= id %>">Edit</a>
             <td>  <a href="BillSlip.jsp?id=<%= id %>">CreateSlip</a>
        </td>
    </tr>
    <% }
    } catch(SQLException se) {
        se.printStackTrace();
    }
    %>
</table>
</body>
</html>
