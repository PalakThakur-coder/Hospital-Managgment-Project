<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="connect.Connect"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Home</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adddataform.css">
<link rel="stylesheet" type="text/css" href="css/adddatafrm1.css">
<link rel="stylesheet" type="text/css" href="css/Appointment.css">
<style>
body {
	background-image: url("img/Medical.jpg");
	background-color: #cccccc;
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

.error-message {
	color: red;
}

.input-field.error {
	border: 2px solid red;
}

.radio-container {
	text-align: center;
	font-size: 20px;
}

.radio-container label {
	margin: 0 10px;
}

.input-field {
	margin-bottom: 15px;
}

h5 {
	margin-bottom: 8px;
}

input[type="radio"] {
	margin-right: 5px;
}

label[for="onlinePayment"], label[for="offlinePayment"] {
	display: inline-block;
	margin-right: 15px;
}

/* Add this style for the modal */
#paymentModal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

#paymentContainer {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	width: 400px;
	text-align: center;
}

#closePaymentModal {
	cursor: pointer;
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 18px;
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
	String s = "SELECT * FROM patienttable WHERE id = '" + id + "'";
	ps = cn.c.prepareStatement(s);
	
	try {
		rs = ps.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<header1>Patient Slip Generate</header1>
		<form action="OnlineSlip" method="post">

			<div class="form first">
				<div class="details personal">
					<span class="title">Personal Details</span>
					<div class="fields">
						<div class="input-field">
							<label>PatientID</label> <input type="hidden" name="bookingtype"
								value="Online"> <input type="text" name="id"
								value="<%=rs.getString(2)%>" readonly>
						</div>
						<input type="hidden" name="s_id" id="s_id"
							value="<%=rs.getString(17)%>" readonly>
						<div class="input-field">
							<label>Name</label> <input type="text" name="name"
								value="<%=rs.getString(3)%>" readonly>
						</div>
						<div class="input-field">
							<label>Age</label> <input type="text" name="age"
								value="<%=rs.getString(16)%>" readonly>
						</div>
						<div class="input-field">
							<label>Gender:</label> <input type="text" name="gender"
								value="<%=rs.getString(4)%>" readonly>
						</div>
						<div class="input-field">
							<label>Father Name</label> <input type="text" name="fathername"
								value="<%=rs.getString(5)%>" readonly>
						</div>
						<div class="input-field">
							<label>Grandfather Name</label> <input type="text"
								name="grandfathername" value="<%=rs.getString(6)%>" readonly>
						</div>
						<div class="input-field">
							<label>Mobile No</label> <input type="number" name="mobileno"
								id="mobileno" value="<%=rs.getString(7)%>" readonly> <span
								id="mobile-error" class="error-message"></span>
						</div>
						<div class="input-field">
							<label>Email</label> <input type="email" id="email"
								value="<%=rs.getString(8)%>" name="email" readonly> <span
								id="email-error" class="error-message"></span>
						</div>
					</div>
				</div>
				<div class="details personal">
					<span class="title">Address Details</span>
					<div class="fields">
						<div class="input-field">
							<label>Houseno</label> <input type="text" placeholder="houseno"
								name="houseno" value="<%=rs.getString(9)%>" readonly>
						</div>
						<div class="input-field">
							<label>Street</label> <input type="text" placeholder="street"
								name="street" value="<%=rs.getString(10)%>" readonly>
						</div>
						<div class="input-field">
							<label>City</label> <input type="text" placeholder="city"
								name="city" value="<%=rs.getString(11)%>" readonly>
						</div>
						<div class="input-field">
							<label>State</label> <input type="text" placeholder="state"
								name="state" value="<%=rs.getString(12)%>" readonly>
						</div>
					</div>
				</div>
				<div>

					<div class="input-field">
						<label>Booking Date</label> <input type="date" name="date"
							id="date"onclick="checkOnlineBookings()" required> 
							<label>Payment Method:</label> 
						
						<input type="radio" name="paymentMethod" value="online"
							id="onlinePayment" onclick="showPaymentModal()" required>
						<label for="onlinePayment">Online Payment</label> <input
							type="radio" name="paymentMethod" value="offline"
							id="offlinePayment" required> <label for="offlinePayment">Offline
							Payment</label>
					</div>
					<span class="title">Doctor Details</span>
					<div class="fields">

						<h4>Doctor:</h4>
						<select name="doctor">
							<option value="selectdoctor" disabled>Select Doctor</option>
							<%
							Statement st1 = cn.c.createStatement();
							ResultSet doctorResultSet = st1.executeQuery("SELECT name, specialisation FROM doctortable");
							while (doctorResultSet.next()) {
								String doctorName = doctorResultSet.getString("name");
								String specialisation = doctorResultSet.getString("specialisation");
							%>
							<option value="<%=doctorName%>"
								<%=specialisation.equals("General") ? "selected" : ""%>><%=doctorName%>
								(<%=specialisation%>)
							</option>
							<%
							}
							doctorResultSet.close();
							st1.close();
							%>
						</select>
						<div class="input-field">
							<h5>ID Name:</h5>
							<input type="text" name="idname" value="<%=rs.getString(14)%>"
								readonly>
						</div>
						<div class="input-field" id="otherIdNameBox"
							style="display: none;">
							<label>Other ID Name</label> <input type="text"
								placeholder="enter your any id name" name="idname_input">
						</div>
						<div class="input-field">
							<label>ID Number</label> <input type="text"
								placeholder="enter your id no" name="idno"
								value="<%=rs.getString(15)%>" readonly>
						</div>
					</div>
				</div>



				<div class="button-container">
					<button class="cancelBtn" type="button" onclick="cancelForm()">
						<span class="btnText">Cancel</span>
					</button>
					<button class="nextBtn" onclick="submitForm()">
						<span class="btnText"> Slip</span>
					</button>
				</div>
				</div>
		</form>
	</div>


	<!-- Modal for Payment.jsp -->
	<div id="paymentModal">
		<div id="paymentContainer">
			<span id="closePaymentModal" onclick="closePaymentModal()">&times;</span>
			<iframe src="Payment.jsp" width="100%" height="500px" frameborder="0"></iframe>
		</div>
	</div>

	<%
	} else {
	%>
	<p>No patient data found for the provided ID.</p>
	<%
	}
	} catch (SQLException se) {
	out.println(se);
	}
	
	
	%>

	<script>
		function cancelForm() {
			window.location.href = "index.jsp";
		}

		function showPaymentModal() {
			document.getElementById("paymentModal").style.display = "block";
		}

		function closePaymentModal() {
			document.getElementById("paymentModal").style.display = "none";
		}

		function submitForm() {
			// Your form submission logic goes here

			// After payment is completed, close the payment modal
			closePaymentModal();
		}

		
	    
	</script>
	

</body>
</html>
