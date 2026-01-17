<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="Recptionist.PatientDao" %>
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
<link rel="stylesheet" type="text/css" href="../css/adddataform.css">
<link rel="stylesheet" type="text/css" href="../css/adddatafrm1.css">
<link rel="stylesheet" type="text/css" href="../css/Appointment.css">
<script src="../js/Patient.js"></script>
<style>
body {
	background-image: url("../img/Medical.jpg");
	background-color: #cccccc;
}

.container {
	position: relative;
	max-width: 1200px;
	width: 100%;
	border-radius: 6px;
	padding: 30px;
	height: 750px;
	background-color: #fff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

.textarea {
	width: 500px;
	height: 50px;
	padding: 10px;
	font-size: 16px;
	border: 2px solid #ccc;
	border-radius: 5px;
	resize: vertically;
	
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
</style>
</head>
<body>


		<%
    PatientDao patientDAO = new PatientDao();
    String id;
    id = patientDAO.generatePatientID();
%>
	<div class="container">


		<form action="../AddIpdPatient" method="post">

			<div class="form first">
				<div class="details personal">
					<span class="title">Creation of PatientID</span>
					<div class="fields">
 <input type="hidden" name="patienttype" value="ipd">
						<div class="input-field">
							<h3>
								PatientID :<%=id%></h3>

						</div>
						<div class="input-field">
							<label class="required-field">Name</label> <input type="text"
								placeholder="Name" name="name" id="name" required> <span
								id="name-error" class="error-message"></span>
						</div>
						<div class="input-field">
							<label class="required-field">Age</label> <input type="text"
								placeholder="Enter age" name="age" id="age" required> <span
								id="age-error" class="error-message"></span>
						</div>
						<div class="input-field1">
							<label class="required-field">Gender :</label> <br>
							 <label for="male">Male</label>
								<input type="radio" value="Male" id="male"name="gender" required>
								 <label for="female">Female</label>
								<input type="radio" value="Female"id="female" name="gender" required>
								<label for="other">Other</label>
							 <input type="radio" value="Other"id="other" name="gender" required>
							
						</div>
						<div class="input-field">
							<label class="required-field">Father Name</label> <input
								type="text" name="fathername" id="fathername"
								placeholder="Enter your Father name" required> <span
								id="father-error" class="error-message"></span>
						</div>
						<div class="input-field">
							<label>Guardian Name</label> <input type="text"
								name="grandfathername" id="grandfathername"
								placeholder="Enter your grandfather name"> <span
								id="grandfather-error" class="error-message"></span>
						</div>


						<div class="input-field">
							<label class="required-field">Mobile No</label> <input
								type="number" name="mobileno" id="mobileno"
								placeholder="Enter your Mobile No" required> <span
								id="mobile-error" class="error-message"></span>
						</div>
						<div class="input-field">
							<label>Email</label> <input type="email" name="email" id="email"
								placeholder="Email"> <span id="email-error"
								class="error-message"></span>
						</div>
					</div>
				</div>
				<div class="details personal">
					<span class="title">Address Details</span>
					<div class="fields">
						<div class="input-field">
							<label>Houseno</label> <input type="text" placeholder="houseno"
								name="houseno">
						</div>
						<div class="input-field">
							<label>Street</label> <input type="text" placeholder="street"
								name="street">
						</div>
						<div class="input-field">
							<label class="required-field">City</label> <input type="text"
								placeholder="city" name="city" id="city" required> <span
								id="city-error" class="error-message"></span>
						</div>
						<div class="input-field">
							<label class="required-field">State</label> <input type="text"
								placeholder="state" name="state" id="state" required> <span
								id="state-error" class="error-message"></span>
						</div>
					</div>
				</div>
				<div class="detail-personal">
					<span class="title">Description</span>
					<div class="fields">
						<div class="input-field">
							<textarea class="textarea" name="description" rows="2" cols="50"></textarea>

						</div>
					</div>
				</div>
			</div>

			<input type="hidden" id="date" name="date">


			<div class="details personal">
				<span class="title">Identity Details</span>
				<div class="fields">
					<div class="input-field1">
						<h5>ID Name :</h5><br>
						<label for="aadharRadio">AadharCard</label>
						<input type="radio" value="Aadhar"id="aadharRadio" name="idname"
							onclick="toggleOtherIdName(false)">
							 <label for="panRadio">Pan Card</label>
							<input type="radio" value="Pan" name="idname"id="panRadio"
							onclick="toggleOtherIdName(false)">
							 <label for="voterRadio">Voter Card</label>
							<input type="radio" value="Voter" name="idname"id="voterRadio"
							onclick="toggleOtherIdName(false)"> 
							 <label for="otherRadio">Other</label>
							<input type="radio" value="Other" name="idname" id="otherRadio"
							onclick="toggleOtherIdName(true)"> 
					</div>

					<div class="input-field" id="otherIdNameBox" style="display: none;">
						<label> Other ID Name</label> <input type="text"
							placeholder="enter your any id name" name="idname_input"id="otherRadio">
					</div>
					<div class="input-field">
						<label>ID Number</label> <input type="text"
							placeholder="enter your id no" name="idno"id="idno"><span
								id="idno-error" class="error-message"></span>
					</div>
				</div>
			</div>

			<div class="button-container">
			<button class="cancelBtn" type="button" onclick="cancelform()">
					<span class="btnText">Cancel</span>
				</button>
				<button class="nextBtn">
					<span class="btnText">Submit</span>
				</button>


				
			</div>
			</form>
	</div>
	
<script>

function cancelform() {
    window.location.href = '../Admin/Dashboard.jsp';
}
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

	<script src="../js/Patient.js"></script>
</body>
</html>
