
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Payment</title>
    <style>
         body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

       
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
        }

        .nextBtn {
            background-color: blue;
            color: #fff;
        }

        .cancelBtn {
            background-color: #ff0000;
            color: #fff;
        }

        .cancelBtn:hover {
            background-color: #cc0000;
        }
        
    </style>
</head>
<body>

    <form action="PaymentProcess.jsp" method="post" id="paymentForm">
        <h2>Online Payment Form</h2>

        <!-- Payment method selection -->
        <label for="paymentMethod">Select Payment Method:</label>
        <select id="paymentMethod" name="paymentMethod" onchange="showPaymentFields()" required>
            <option value="debitCard">Debit Card</option>
            <option value="upi">UPI</option>
            <option value="netBanking">Net Banking</option>
        </select>

        <!-- Payment details - Debit Card -->
        <div id="debitCardFields">
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" required>

            <label for="expiryDate">Expiry Date (MM/YY):</label>
            <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>

            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" required>
        </div>

        <!-- Payment details - UPI -->
        <div id="upiFields" style="display: none;">
            <label for="upiId">UPI ID:</label>
            <input type="text" id="upiId" name="upiId" required>
        </div>

        <!-- Payment details - Net Banking -->
        <div id="netBankingFields" style="display: none;">
            <label for="netBankingId">Net Banking ID:</label>
            <input type="text" id="netBankingId" name="netBankingId" required>
        </div>

        <!-- Common Payment details -->
        <label for="amount">Amount:</label>
        <input type="text" id="amount" name="amount" value="200"readonly>

        <!-- Customer details -->
        <label for="name">Name on Card / UPI ID / Net Banking ID:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <div class="button-container">
                    <button class="cancelBtn" type="button" onclick="cancelForm()">
                        <span class="btnText">Cancel</span>
                    </button>
                    <button class="nextBtn"onclick="submitForm()">
                        <span class="btnText"> Pay</span>
                    </button>
                </div>
    </form>

    <script>
        function showPaymentFields() {
            var paymentMethod = document.getElementById("paymentMethod").value;

            // Hide all payment fields
            document.getElementById("debitCardFields").style.display = "none";
            document.getElementById("upiFields").style.display = "none";
            document.getElementById("netBankingFields").style.display = "none";

            // Show fields based on the selected payment method
            if (paymentMethod === "debitCard") {
                document.getElementById("debitCardFields").style.display = "block";
            } else if (paymentMethod === "upi") {
                document.getElementById("upiFields").style.display = "block";
            } else if (paymentMethod === "netBanking") {
                document.getElementById("netBankingFields").style.display = "block";
            }
        }
       
        function submitForm() {
            // Add form validation if needed

            // Submit the form
            document.getElementById("paymentForm").submit();
        }

        function cancelForm() {
            // Handle cancel logic if needed
            window.location.href = "UserHome.jsp";
        }
    </script>

</body>
</html>
