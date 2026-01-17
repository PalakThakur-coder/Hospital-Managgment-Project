<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="connect.Connect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Slip</title>
    <link rel="stylesheet" href="../css/Slip.css">
    <style>
        /* Add your CSS styles here */
    
 .slip-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    height: 100%; 
    overflow: auto; 
}
        .main {
            margin-top: 20px;
        }

        .main h2 {
            font-size: 20px;
            margin-bottom: 10px;
            text-align: center; /* Center the text */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        table th {
            background-color: #f2f2f2;
        }

        .total-amount, .pending-amount {
            margin-top: 20px;
        }

        .head {
            font-weight: bold;
        }

        .fill {
            margin: 5px 0;
        }

        .print-button {
            margin-top: 20px;
        }

        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }

        .amount-details {
            text-align: right;
        }

        .amount-detail {
            text-align: right;
            clear: both;
        }

        .amount-detail div {
            margin-bottom: 5px; /* Add margin between each pair */
        }

        .amount-detail .head {
            display: inline-block;
            width: 160px; /* Adjust as needed */
            text-align: right; /* Align text to the left */
        }

        .amount-detail span {
            display: inline-block;
            text-align: right; /* Align text to the right */
        }
      
        
    </style>
    <script>
        function printSlip() {
            window.print();
        }

        function back() {
            window.location.href = '../Recp/Dashboard.jsp';
        }
    </script>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id")); // Get the patient ID from the URL
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Connect cn = new Connect();
        cn.DataConnection();
        String query = "SELECT * FROM billing_table WHERE id = ?";
        ps = cn.c.prepareStatement(query);
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
            String patientID = rs.getString("patient_id");
            String patientName = rs.getString("patient_name");
            String date = rs.getString("date");
            String gender = rs.getString("gender");
            String fatherName = rs.getString("fathername");
            String mobileNo = rs.getString("mobileno");
            String city = rs.getString("city");
            String totalAmount = rs.getString("total_amount");
            String pendingAmount = rs.getString("pending_amount");
            String payAmount = rs.getString("pay_amount");
            String selectedTestsData = rs.getString("selected_tests");
%>
<div class="print-button">
    <button class="button" type="button" value="Print" onclick="printSlip();">Print</button>
    <button class="button" type="button" value="back" onclick="back();">Back</button>
</div>
<div class="slip-container">
<div class="slip-container1">
    <div class="date"><%=new java.text.SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date())%></div>
    <div class="phone-number">Phone: +91-9817788781,8307551446</div>
    <div class="slip-header">
        <img src="../img/lifelogo.jpeg" alt="Hospital Logo" height="30" width="50">
        <div class="hospital-info">
            <h2>LIFE LINE SUPERSPACILITY HOSPITAL</h2>
            <p>Add: Bhainswan chowk, Rohtak road<br> Gohana(Sonipat)</p>
            <p style="font-weight: bold;">BILL</p>
            
            
        </div>
        <hr>
    </div>
    <div class="content">
        <div class="slip-content1">
            <span class="head">BillNo:</span>
            <p class="fill"><%=id%></p>
            <span class="head">P-ID:</span>
            <p class="fill"><%=patientID%></p>
            <span class="head">Patient Name:</span>
            <p class="fill"><%=patientName%></p>
            <span class="head">Gender:</span>
            <p class="fill"><%=gender%></p>
        </div>
        <div class="slip-content2">
            <span class="head">Father Name:</span>
            <p class="fill"><%=fatherName%></p>
            <span class="head">Address:</span>
            <p class="fill"><%=city%></p>
            <span class="head">Contact No:</span>
            <p class="fill"><%=mobileNo%></p>
        </div>
    </div>
    <hr>
    <div class="main">
        <h2>Total Services</h2>
        <table>
            <tr>
                <th>Service Name</th>
                <th>Service Price</th>
            </tr>
            <%
                if (selectedTestsData != null && !selectedTestsData.isEmpty()) {
                    String[] tests = selectedTestsData.split(",");
                    for (String test : tests) {
                        String[] testParts = test.split(":");
                        if (testParts.length == 2) {
                            String itemName = testParts[0].trim(); // Item name
                            String itemPrice = testParts[1].trim(); // Item price
            %>
            <tr>
                <td><%=itemName%></td>
                <td><%=itemPrice%></td>
            </tr>
            <%
                        }
                    }
                }
            %>
        </table>
    </div>
    <div class="amount-details">
        <div class="amount-detail">
            <div>
                <span class="head">Total Amount:</span>
                <span><%=totalAmount%></span>
            </div>
            <div>
                <span class="head">Pay Amount:</span>
                <span><%=payAmount%></span>
            </div>
            <div>
                <span class="head">Pending Amount:</span>
                <span><%=pendingAmount%></span>
            </div>
        </div>
    </div>
</div>
</div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
