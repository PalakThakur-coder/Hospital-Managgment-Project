<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="connect.Connect" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Patient Details</title>
    <style>
   body {
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

.container {
    width: 50%;
    margin-top: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    margin: 20px auto; /* Center the form horizontally */
}

.patient-details {
    border: 1px solid black;
    padding: 20px;
    border-radius: 5px;
    width: 50%;
    text-align: center;
    margin-top: 20px;
    margin-left: auto; /* Adjust left margin */
    margin-right: auto; /* Adjust right margin */
}

.patient-details h1 {
    margin-top: 10px;
}

.input-field {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
select,
textarea {
    width: calc(100% - 18px); /* Adjust input width */
    padding: 8px;
    border-radius: 4px;
    border: 1px solid #ccc;
    box-sizing: border-box; /* Ensure padding is included in the width */
}

.button-container {
    margin-top: 20px;
}

.cancelBtn,
.nextBtn {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px; /* Add space between buttons */
}

.checkbox-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 15px;
}

.checkbox-item {
    display: flex;
    align-items: center;
    margin-right: 20px;
}

.checkbox-item input[type="checkbox"] {
    margin-right: 5px;
}

.other-test-text {
    display: none;
    margin-top: 5px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: calc(100% - 8px); /* Adjust input width */
    box-sizing: border-box; /* Ensure padding is included in the width */
}

    </style>
    <link rel="stylesheet" type="text/css" href="../css/Appointment.css">
</head>
<body>
    <form action="../DoctorSlip" method="post">
        <div class="patient-details">
            <h1>Patient Details</h1>
            <% 
                String patientID = request.getParameter("id");

                if(patientID != null) {
                    Connect cn = new Connect();
                    try {
                        cn.DataConnection();
                        PreparedStatement PS = cn.c.prepareStatement("SELECT * FROM offlineslip WHERE id = ?");
                        PS.setString(1, patientID);
                        ResultSet rs = PS.executeQuery();

                        if (rs.next()) {
            %>        
            <div class="input-field">
                <label>SlipID</label>
                <input type="text" name="sid" value="<%= rs.getString(1) %>" readonly>
            </div>
             <div class="input-field">
                <label>PatientID</label>
                <input type="text" name="pid" value="<%= rs.getString(2) %>" readonly>
            </div>
             <div class="input-field">
                <label>Name</label>
                <input type="text" name="name" value="<%= rs.getString(3) %>" readonly>
            </div>
             <div class="input-field">
                <label>Age</label>
                <input type="text" name="age" value="<%= rs.getString(4) %>" readonly>
            </div>
            <div class="input-field">
                <label>Gender</label>
                <input type="text" name="gender" value="<%= rs.getString(5) %>" readonly>
            </div>
            <div class="input-field">
                <label>Doctor</label>
                <input type="text" name="doctor" value="Dr.<%= rs.getString(8) %>" readonly>
            </div>
            <input type="hidden" id="date" name="date">
             <div class="input-field">
    <label>Prescription</label>
    <textarea name="prescription" cols="100" rows="5"></textarea>
</div>
            
           <div class="input-field">
    <label>Select Test</label>
    <div class="checkbox-container">
        <% 
            PreparedStatement testPS = cn.c.prepareStatement("SELECT * FROM tests");
            ResultSet testRS = testPS.executeQuery();

            while (testRS.next()) {
                String testName = testRS.getString("test_name");
        %>
        <div class="checkbox-item">
           <input type="checkbox" id="test_<%= testName %>" name="tests" value="<%= testName %>">
            <label for="test_<%= testName %>"><%= testName %></label>
        </div>
        <% 
            }
            testRS.close();
        %>
        <div class="input-field">
    
    <input type="checkbox" id="otherTest" name="otherTestCheckbox">
    <label for="otherTest">Other</label>

    
    <input type="text" name="otherTestValue" id="otherTestValue" class="other-test-text" style="display: none;">
</div>
    </div>
</div>
            <!-- Existing code for other input fields -->
            <div class="button-container">
                <button class="cancelBtn" type="button" onclick="cancelForm()">
                    <span class="btnText">Cancel</span>
                </button>
                <button class="nextBtn">
                    <span class="btnText">SUBMIT </span>
                </button>
            </div>
            <% 
                        } else {
            %>
            <p>No details found for the given patient ID.</p>
            <% 
                        }

                        rs.close();
                    } catch (Exception e) {
            %>
            <p>Error: <%= e.getMessage() %></p>
            <% 
                        e.printStackTrace();
                    }
                } else {
            %>
            <p>No patient ID provided.</p>
            <% 
                }
            %>
        </div>
    </form>

   <script>
   function cancelForm() {
	    window.location.href = '../Doctor/DoctorHome.jsp';
	}
    const otherTest = document.getElementById('otherTest');
    const otherTestValue = document.getElementById('otherTestValue');

    // Check initially if 'Other' is already checked
    if (otherTest.checked) {
        otherTestValue.style.display = 'inline-block';
    }

    otherTest.addEventListener('change', function() {
        if (otherTest.checked) {
            otherTestValue.style.display = 'inline-block';
        } else {
            otherTestValue.style.display = 'none';
        }
    });
    document.addEventListener("DOMContentLoaded", function() {
        var currentDate = new Date();
        var day = currentDate.getDate();
        var month = currentDate.getMonth() + 1; // Months are zero-based
        var year = currentDate.getFullYear();

        // Format the date as YYYY-MM-DD
        var formattedDate = year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;

        // Set the value of the date input field
        document.getElementById("date").value = formattedDate;
    });
</script>
</body>
</html>
