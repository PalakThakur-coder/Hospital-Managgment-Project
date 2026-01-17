<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="connect.Connect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Billing System</title>
    <style>
        /* Your CSS styles */
         body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .box {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
        }

        .select-box {
            text-align: center;
        }

        .selected-tests {
            text-align: center;
            font-weight: bold;
        }

        .totalamount {
            text-align: center;
            font-weight: bold;
        }

        .input-group {
            display: flex;
            align-items: center;
        }

        .input-group > * {
            margin-right: 10px; /* Adjust margin as needed */
        }

        .select-box select {
            width: 50%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .select-box input[type="text"],
        .select-box input[type="number"] {
            width: 40%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .select-box input[type="button"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 7px;
            font-size: 20px;
        }

        .select-box input[type="button"]:hover {
            background-color: #42a022;
        }

        .selected-tests div {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .selected-tests button {
            background-color: #ff0000;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 3px;
            font-size: 14px;
        }

        .selected-tests button:hover {
            background-color: #cc0000;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
        }

        .nextBtn {
            background-color: blue;
            color: #fff;
        }

        .cancelBtn {
            background-color: #ff0000;
            color: #fff;
            font-size: 20px;
        }

        .cancelBtn:hover {
            background-color: #cc0000;
        }

        .selected-tests-list {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .selected-tests-list div {
            margin-bottom: 10px;
        }

        #payAmountInput {
            width: 20%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        #payAmountButton {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 7px;
            font-size: 20px;
        }

        #payAmountButton:hover {
            background-color: #42a022;
        }
    </style>
</head>
<body>
<%
    PreparedStatement ps;
    Connect cn;
    ResultSet rs;
    String ID = "";
    cn = new Connect();
    cn.DataConnection();

    String id = request.getParameter("id");
    String s = "SELECT * FROM patienttable WHERE id =  '" + id + "'  ";
    ps = cn.c.prepareStatement(s);

    rs = ps.executeQuery();
    if (rs.next()) {
%>
<div class="container">
    <form action="Bill.jsp" method="post" id="myForm"> <!-- Assuming InsertData.jsp is your backend file -->
        <div class="patient-details">
            PatientID: <input type="text" name="patientID" value="<%= rs.getString(2) %>" readonly>
            Name: <input type="text" name="patientName" value="<%= rs.getString(3) %>" readonly>
            <input type="hidden" name="gender" value="<%= rs.getString(4) %>">
            <input type="hidden" name="fathername" value="<%= rs.getString(5) %>">
            <input type="hidden" name="mobileno" value="<%= rs.getString(7) %>">
            <input type="hidden" name="city" value="<%= rs.getString(11) %>">
            <input type="hidden" id="date" name="date" value="<%= java.time.LocalDate.now() %>">
        </div>
        <div class="box select-box">
            <h2>Select or Add a New Item:</h2>
            <div class="input-group">
                <select id="testSelect" name="selectedTest">
                    <%
                        try {
                            cn.DataConnection();
                            Statement st = cn.c.createStatement();
                            rs = st.executeQuery("select test_name from tests");
                            while (rs.next()) {
                                String name = rs.getString("test_name");
                    %>
                    <option value="<%= name %>"><%= name %></option>
                    <%
                            }
                            rs.close();
                            st.close();
                        } catch (SQLException se) {
                            out.println(se);
                        }
                    %>
                </select>
                <input type="number" id="TestPrice" placeholder="Enter Price">
                <input type="button" value="Add" onclick="addSelectedTest()">
            </div>
        </div>

        <div class="box select-box">
            <h2>New Item</h2>
            <input type="text" id="testName" placeholder="Enter New Item Name" >
            <input type="number" id="newTestPrice" placeholder="Enter Price">
            <input type="button" value="Add" onclick="addNewTest()">
        </div>

        <input type="hidden" id="selectedTestsInput" name="selectedTestsData" />
        <div class="box selected-tests">
            <h2>Selected Items</h2>
            <div id="selectedTests" class="selected-tests-list"></div>
        </div>
        <input type="hidden" id="totalAmount" name="totalAmount" value="0">
        <input type="hidden" id="pendingAmount" name="pendingAmount" value="0">

        <div class="totalamount">
            <h3> Total Amount: <span id="totalAmountDisplay">0.00</span><br></h3>
            <input type="number" id="payAmountInput" placeholder="Enter Pay Amount" name="payAmount"required>
            <input type="button" id="payAmountButton"value=" Pay Amount" onclick="setPayAmount()"><br>
            <h3>   Pending Amount: <span id="pendingAmountDisplay">0.00</span></h3>
        </div>

        <div class="button-container">
            <button class="cancelBtn" type="button" onclick="cancelForm()">
                <span class="btnText">Cancel</span>
            </button>
            <button class="nextBtn" type="button" onclick="insertTest()">
                <span class="btnText">Generate Slip</span>
            </button>
        </div>
    </form>
</div>
<%
    } else {
%>
<p>No patient data found for the provided ID.</p>
<%
    }
%>

<script>
    var selectedTests = [];

    function addSelectedTest() {
        var selectedTestSelect = document.getElementById("testSelect");
        var newTestPriceInput = document.getElementById("TestPrice");
        var newTestName = selectedTestSelect.value.trim();
        var newTestPrice = parseFloat(newTestPriceInput.value.trim());

        if (isNaN(newTestPrice)) {
            alert("Please enter a valid price.");
            return;
        }

        addTest(newTestName, newTestPrice);
        newTestPriceInput.value = "";
    }

    function addNewTest() {
        var testNameInput = document.getElementById("testName");
        var newTestPriceInput = document.getElementById("newTestPrice");

        var testName = testNameInput.value.trim();
        var newTestPrice = parseFloat(newTestPriceInput.value.trim());

        if (testName === "" || isNaN(newTestPrice)) {
            alert("Please fill out new item fields with valid price!");
            return;
        }

        addTest(testName, newTestPrice);
        testNameInput.value = "";
        newTestPriceInput.value = "";
        updateAmounts();
    }

    function addTest(testName, testPrice) {
        var selectedTestsDiv = document.getElementById("selectedTests");
        var selectedTestDiv = document.createElement("div");
        var deleteButton = document.createElement("button");
        deleteButton.textContent = "Delete";
        deleteButton.onclick = function() {
            removeSelectedTest(selectedTestDiv, testPrice);
        };

        selectedTestDiv.innerHTML = '<span>' + testName + ' - Rs ' + testPrice.toFixed(2) + '</span>';
        selectedTestDiv.appendChild(deleteButton);
        selectedTestsDiv.appendChild(selectedTestDiv);

        updateAmounts();
        selectedTests.push({ name: testName, price: testPrice });
        updateAmounts();
    }

    function removeSelectedTest(selectedTestDiv, price) {
        selectedTestDiv.remove();
        var index = selectedTests.findIndex(test => test.price === price);
        if (index !== -1) {
            selectedTests.splice(index, 1);
        }
        updateAmounts();
    }

    function updateAmounts() {
        var totalAmount = selectedTests.reduce((total, test) => total + test.price, 0);
        var payAmount = parseFloat(document.getElementById("payAmountInput").value.trim());
        var pendingAmount = totalAmount - payAmount;

        document.getElementById("totalAmountDisplay").textContent = totalAmount.toFixed(2);
        document.getElementById("pendingAmountDisplay").textContent = pendingAmount.toFixed(2);
    }

    function setPayAmount() {
        var payAmountInput = document.getElementById("payAmountInput");
        var enteredPayAmount = parseFloat(payAmountInput.value.trim());

        if (isNaN(enteredPayAmount) || enteredPayAmount < 0) {
            alert("Please enter a valid pay amount.");
            return;
        }

        payAmount = enteredPayAmount;
        updateAmounts();
    }

    function insertTest() {
    	   var enteredPayAmount = parseFloat(document.getElementById("payAmountInput").value.trim());

           if (isNaN(enteredPayAmount) || enteredPayAmount <= 0) {
               alert("Please fill in the pay amount before generating the bill.");
               return;
           }
        var selectedTestsData = selectedTests.map(test => test.name + ":" + test.price).join(";");
        document.getElementById("selectedTestsInput").value = selectedTestsData;
        document.getElementById("myForm").submit();
    }

    function cancelForm() {
        window.location.href = "../Recp/Dashboard.jsp";
    }
</script>
</body>
</html>
