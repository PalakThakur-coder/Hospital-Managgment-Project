<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="connect.Connect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Bill</title>
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

        .input-group {
            display: flex;
            align-items: center;
        }

        .input-group > * {
            margin-right: 10px; /* Adjust margin as needed */
        }

        .input-group input[type="text"],
        .input-group input[type="number"] {
            width: 50%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .input-group input[type="button"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 7px;
            font-size: 20px;
        }

        .input-group input[type="button"]:hover {
            background-color: #42a022;
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

        .button-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .button-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
            margin:15px;
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

        .selected-tests {
            margin-bottom: 20px;
        }

        .selected-tests div {
            margin-bottom: 10px;
        }
         .deleteButton {
            background-color: #ff0000;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            padding: 5px 10px;
            margin-left: 10px; /* Adjust margin as needed */
        }
         .deleteButton:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>
<%
    PreparedStatement ps;
    Connect cn;
    ResultSet rs;
    cn = new Connect();
    cn.DataConnection();

    String id = request.getParameter("id");
    String s = "SELECT * FROM billing_table WHERE id = ?";
    ps = cn.c.prepareStatement(s);
    ps.setString(1, id);
    rs = ps.executeQuery();

    if (rs.next()) {
%>
<div class="container">
    <form action="UpdateBillDB.jsp" method="post" id="myForm">
        <div class="box">
            Bill No <input type="text" name="id" value="<%= rs.getString(1) %>"readonly>
            Patient Id <input type="text" name="id" value="<%= rs.getString(2) %>"readonly>
            <h2>Update Item or Pay Amount:</h2>
            <div class="input-group">
                New Item Name: <input type="text" id="newItemName" name="newItemName"><br>
                New Item Price: <input type="number" id="newItemPrice" name="newItemPrice"><br>
                <input type="button" value="Add Item" onclick="addItem()">
            </div>
        </div>
        <div class="box selected-tests">
            <h2>Selected Items:</h2>
            <div id="selectedTests" class="selected-tests-list">
                <% 
                    String selectedTests = rs.getString("selected_tests");
                    if (selectedTests != null && !selectedTests.isEmpty()) {
                        String[] tests = selectedTests.split(",");
                        for (String test : tests) {
                            String[] testData = test.split(":");
                            if (testData.length >= 2) {
                                String testName = testData[0];
                                String testPrice = testData[1];
                %>
                <div><%= testName %> - Rs <%= testPrice %></div>
                <%
                            }
                        }
                    }
                %>
            </div>
            <hr>
            <div class="totalamount">
                <h3>Total Amount: <span id="totalAmountDisplay"><%= rs.getString(6) %></span><br></h3>
                <h3>Pay Amount: <span id="payAmountDisplay"><%= rs.getString(7) %></span><br></h3>
                <h3>New Pay Amount: <input type="text" id="payAmountInput" name="newPayAmount"><br></h3>
                <input type="button" id="payAmountButton" value="Update Pay Amount" onclick="updatePayAmount()"required>
                <h3>Pending Amount: <span id="pendingAmountDisplay"><%= rs.getString(8) %></span></h3>
            </div>
            <input type="hidden" id="selectedTestsInput" name="selectedTestsInput" value="<%= rs.getString("selected_tests") %>">
        </div>
        <div class="button-container">
            <button class="cancelBtn" type="button" onclick="cancelForm()">
                <span class="btnText">Cancel</span>
            </button>
            <button class="nextBtn" type="submit">
                <span class="btnText">Update Bill</span>
            </button>
        </div>
    </form>
</div>
<%
    } else {
%>
<p>No billing data found for the provided ID.</p>
<%
    }
%>
 <!--  
<script>
var selectedTests = [];

function addItem() {
    var newItemNameInput = document.getElementById("newItemName");
    var newItemPriceInput = document.getElementById("newItemPrice");

    var newItemName = newItemNameInput.value.trim();
    var newItemPrice = parseFloat(newItemPriceInput.value.trim());

    if (newItemName === "" || isNaN(newItemPrice)) {
        alert("Please fill out new item fields with valid price!");
        return;
    }

    addTest(newItemName, newItemPrice);

    newItemNameInput.value = "";
    newItemPriceInput.value = "";
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

    selectedTests.push({ name: testName, price: testPrice });
    updateAmounts(testPrice);
}
    
function removeSelectedTest(selectedTestDiv, testPrice) {
    selectedTestDiv.parentNode.removeChild(selectedTestDiv);
    selectedTests = selectedTests.filter(function(test) {
        return test.price !== testPrice;
    });
    updateAmounts(-testPrice);
}

function updateAmounts(priceChange) {
    var totalAmountDisplay = document.getElementById("totalAmountDisplay");
    var totalAmount = parseFloat(totalAmountDisplay.textContent);

    totalAmount += priceChange;
    totalAmountDisplay.textContent = totalAmount.toFixed(2);

    var payAmountDisplay = document.getElementById("payAmountDisplay");
    var pendingAmountDisplay = document.getElementById("pendingAmountDisplay");

    var payAmount = parseFloat(payAmountDisplay.textContent);
    var pendingAmount = totalAmount - payAmount;

    pendingAmountDisplay.textContent = pendingAmount.toFixed(2);
}

function updatePayAmount() {
    var payAmountInput = document.getElementById("payAmountInput");
    var enteredPayAmount = parseFloat(payAmountInput.value.trim());

    if (isNaN(enteredPayAmount) || enteredPayAmount < 0) {
        alert("Please enter a valid pay amount.");
        return;
    }

    payAmountInput.value = enteredPayAmount;

    // Update pending amount
    var totalAmountDisplay = document.getElementById("totalAmountDisplay");
    var payAmountDisplay = document.getElementById("payAmountDisplay");
    var pendingAmountDisplay = document.getElementById("pendingAmountDisplay");

    var totalAmount = parseFloat(totalAmountDisplay.textContent);
    var payAmount = parseFloat(payAmountDisplay.textContent);
    var pendingAmount = totalAmount - payAmount - enteredPayAmount;

    pendingAmountDisplay.textContent = pendingAmount.toFixed(2);
}

function cancelForm() {
    // Redirect or perform any cancel action here
}
</script>
 -->
  
 <script>
var selectedTests = [];

function addItem() {
	event.preventDefault();
    var newItemNameInput = document.getElementById("newItemName");
    var newItemPriceInput = document.getElementById("newItemPrice");

    var newItemName = newItemNameInput.value.trim();
    var newItemPrice = parseFloat(newItemPriceInput.value.trim());

    if (newItemName === "" || isNaN(newItemPrice)) {
        alert("Please fill out new item fields with valid price!");
        return;
    }

    addTest(newItemName, newItemPrice);

    newItemNameInput.value = "";
    newItemPriceInput.value = "";
    updateAmounts();
}

function addTest(testName, testPrice) {
    var selectedTestsDiv = document.getElementById("selectedTests");
    var selectedTestDiv = document.createElement("div");
    var deleteButton = document.createElement("button");
    deleteButton.textContent = "Delete";
    deleteButton.className = "deleteButton";
    deleteButton.onclick = function() {
        removeSelectedTest(selectedTestDiv, testPrice);
    };

    selectedTestDiv.innerHTML = '<span>' + testName + ' - Rs ' + testPrice.toFixed(2) + '</span>';
    selectedTestDiv.appendChild(deleteButton);
    selectedTestsDiv.appendChild(selectedTestDiv);

    updateAmounts(+testPrice);
    selectedTests.push({ name: testName, price: testPrice });
    updatePayAmounts();
}

function removeSelectedTest(selectedTestDiv, testPrice) {
    selectedTestDiv.parentNode.removeChild(selectedTestDiv);
    selectedTests = selectedTests.filter(function(test) {
        return test.price !== testPrice;
    });
    updateAmounts(-testPrice);
}

function updateAmounts(priceChange) {
    var totalAmountDisplay = document.getElementById("totalAmountDisplay");
    var totalAmount = parseFloat(totalAmountDisplay.textContent);

    totalAmount += priceChange;
    totalAmountDisplay.textContent = totalAmount.toFixed(2);

    var payAmountDisplay = document.getElementById("payAmountDisplay");
    var pendingAmountDisplay = document.getElementById("pendingAmountDisplay");

    var payAmount = parseFloat(payAmountDisplay.textContent);
    var pendingAmount = totalAmount - payAmount;

    pendingAmountDisplay.textContent = pendingAmount.toFixed(2);
}

function updatePayAmount() {
    var payAmountInput = document.getElementById("payAmountInput");
    var enteredPayAmount = parseFloat(payAmountInput.value.trim());

    if (isNaN(enteredPayAmount) || enteredPayAmount < 0) {
        alert("Please enter a valid pay amount.");
        return;
    }

    payAmountInput.value = enteredPayAmount;

    // Update pending amount
    var totalAmountDisplay = document.getElementById("totalAmountDisplay");
    var payAmountDisplay = document.getElementById("payAmountDisplay");
    var pendingAmountDisplay = document.getElementById("pendingAmountDisplay");

    var totalAmount = parseFloat(totalAmountDisplay.textContent);
    var payAmount = parseFloat(payAmountDisplay.textContent);
    var pendingAmount = totalAmount - payAmount - enteredPayAmount;

    pendingAmountDisplay.textContent = pendingAmount.toFixed(2);
}
function cancelForm() {
    window.location.href = "../Recp/Dashboard.jsp";
}
-->
</script>
</body>
</html>
