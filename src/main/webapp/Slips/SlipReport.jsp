<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Slip Report</title>
    <style>
        body {
            background-color: white;
            background-size: cover;
        }
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
            padding:15px;
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
            border: 2px solid black;
            padding: 8px;
            text-align: left;
            color: black;
        }
       .totalamount {
            margin-left: 1000px;
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
        }
        .show-all-button:hover {
            background-color: #0056b3;
           
        }
        .totalamount {
            position: absolute;
            top: 20px;
            right: 20px;
            color: black;
            font-size: 25px;
            font-weight: 600;
        }
    </style>
</head>
<body>
<%int totalSlips = 0; %>

        <h2>Slip Report</h2>
        
  
    <div class="search-bar">
     
        
        <form action="SlipReport.jsp" method="post">
             <div class="fields">
                <label for="startDate"> From Start Date</label>
                <input type="date" name="startDate" class="search-term">
               
                <label for="endDate"> To End Date</label>
                <input type="date" name="endDate" class="search-term">
                <input type="submit" value="Search" class="search-type">
                <h3>or</h3>
                <a href="SlipReport.jsp" class="show-all-button">Reset</a>
                <input type="button" value="Print" onclick="printReport();" class="show-all-button">
            </div>
        </form>
    </div>
    <h2>Search Results</h2>
    <table border='1'>
        <tr>
        <th>S_ID</th>
            <th>ID</th>
            
            <th>Name</th>
            <th>AGE</th>
            <th>Gender</th>
            <th>FatherName</th>
            <th>MobileNo</th>
            <th>HouseNo</th>
            <th>City</th> 
            <th>Slip Type</th>
            <th>Patient Type</th>
            <th>Date</th>
            
           
        </tr>
        <%
        

        // Get start and end dates from request parameters
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        // Check if both start and end dates are provided
        if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
            try {
                Connect cn = new Connect();
                cn.DataConnection();
                String query = "SELECT s_id, id, name, age, gender, fathername, mobileno, street, city, patienttype, date,type FROM offlineslip WHERE date BETWEEN ? AND ?";
                PreparedStatement pstmt = cn.c.prepareStatement(query);
                pstmt.setString(1, startDate);
                pstmt.setString(2, endDate);
                ResultSet rs = pstmt.executeQuery();
                
                    
                    while (rs.next()) {
                    	String s_id = rs.getString("s_id");
                        String id = rs.getString("id");
                        
                        String name = rs.getString("name");
                        String age = rs.getString("age");
                        String gender = rs.getString("gender");
                        String fathername = rs.getString("fathername");
                        String mobileno = rs.getString("mobileno");
                        String street = rs.getString("street");
                        String city = rs.getString("city");
                        String Type = rs.getString("type");
                        String patienttype = rs.getString("patienttype");
                        String date = rs.getString("date");
                       
                        totalSlips++; // Increment totalSlips
        %>
        <tr>
        <td><%= s_id %></td>
            <td><%= id %></td>
            
            <td><%= name %></td>
            <td><%= age %></td>
            <td><%= gender %></td>
            <td><%= fathername %></td>
            <td><%= mobileno %></td>
            <td><%= street %></td>
            <td><%= city %></td>
            <td><%= Type %></td>
            <td><%= patienttype %></td>
            <td><%= date %></td>
           
        </tr>
        <%
                    }
        %>
    </table>
    <div class="totalamount">Total Slips: <%= totalSlips %></div> <!-- Display total slips below the table -->
    <%
                } catch (SQLException se) {
                    out.println(se);
                }
            }
        %>
      <script>
    function printReport() {
        // Get the selected start and end dates from the form.
        var startDate = '<%= request.getParameter("startDate") %>'
        var endDate = '<%= request.getParameter("endDate") %>'
        var totalSlips = '<%= totalSlips %>'; // Get total slips count from JSP
        
        // Create a reference to the current page.
        var originalContent = document.body.innerHTML;

        // Open a new window for printing.
        var printWindow = window.open('', '', 'width=800, height=600');

        // Construct the HTML content for the printed report.
      
            var content = '<div class="report-header">' +
                              '<h2>Slip Report</h2>' +
                              '<h3>From: ' + startDate + ' To: ' + endDate + '</h3>' +
                             '<h3><div class="totalamount">Total Slips: ' + totalSlips + '</div></h3>' +
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