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
<script src="js/Patient.js"></script>
<style>
body {
	background-image: url("img/Medical.jpg");
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
#chatbotButton {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: #e879d2;
	color: white;
	border: none;
	border-radius: 50%;
	padding: 15px;
	font-size: 16px;
	cursor: pointer;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

#chatbotContainer {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 20px;
	width: 300px;
	border: 1px solid #ccc;
	border-radius: 10px;
	background-color: #fff;
	overflow: hidden;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
}

#closeButton {
	position: absolute;
	top: 10px;
	right: 15px;
	font-size: 18px;
	cursor: pointer;
	color: #555;
}

#chatMessages {
	max-height: 600px;
	overflow-y: scroll;
	padding: 20px;
	background-color: #f9f9f9;
}

.user-message, .chatbot-message {
	max-width: 80%;
	word-wrap: break-word;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
	font-size: 14px;
}

.user-message {
	color: #007BFF;
	background-color: #d6eaf8;
	text-align: right;
	margin-left: auto;
}

.chatbot-message {
	color: #28A745;
	background-color: #d4edda;
	text-align: left;
	margin-right: auto;
}

#chatInput {
	width: calc(100% - 40px);
	height: 40px;
	padding: 10px;
	border: none;
	border-top: 1px solid #ccc;
	resize: none;
	margin: 0;
	font-size: 14px;
	outline: none;
}

#sendButton {
	width: 40px;
	height: 40px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 0 10px 10px 0;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
}

#sendButton:hover {
	background-color: #45a049;
}
</style>
</head>
<body>


	<div class="container">


		<form action="AddPatient" method="post" onsubmit="return initializeFormValidation()">

			<div class="form first">
				<div class="details personal">
					<span class="title">Creation of PatientID</span>
					<div class="fields">

						
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
							<label>Grandfather Name</label> <input type="text"
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
						<h5>ID Name :</h5>
						<br> 
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
			<button class="cancelBtn" type="button" onclick="cancelForm()">
					<span class="btnText">Cancel</span>
				</button>
				<button class="nextBtn"id="nextBtn"onclick="submitForm()">
					<span class="btnText">Submit</span>
				</button>


				
			</div>
			</form>
	</div>
	
	<button id="chatbotButton" onclick="toggleChatbot()">Chat</button>
	<div id="chatbotContainer">
		<div id="closeButton" onclick="toggleChatbot()">&#10006;</div>
		<div id="chatMessages"></div>
		<div style="display: flex;">
			<textarea id="chatInput" placeholder="Type your message..."></textarea>
			<button id="sendButton" onclick="sendMessage()">&#10148;</button>
		</div>

	</div>
	<script>
	function toggleChatbot() {
    var chatbotContainer = document.getElementById("chatbotContainer");
    if (chatbotContainer.style.display === "none" || chatbotContainer.style.display === "") {
        chatbotContainer.style.display = "block";
    } else {
        chatbotContainer.style.display = "none";
    }
}

function sendMessage() {
    var userMessage = document.getElementById("chatInput").value;
    var chatMessages = document.getElementById("chatMessages");

    chatMessages.innerHTML += "<div class='user-message'>" + userMessage + "</div>";

    var chatbotReply = getChatbotReply(userMessage);

    chatMessages.innerHTML += "<div class='chatbot-message'>" + chatbotReply + "</div>";

    document.getElementById("chatInput").value = "";
}

function getChatbotReply(userMessage) {
    switch (userMessage.toLowerCase()) {
        case "hello":
        case "hy":
            return "Hello! How can I help you?";
        case "how are you":
            return "I'm just a bot, but thanks for asking!";
        case "how can i book an appointment":
        case "appointment booking":
            return "You can book an appointment by visiting our website and using the online appointment booking system. Alternatively, you can call our appointment helpline at +91 2342342356";
        case "what medical specialties are available at the hospital":
        case "specialist":
        case "doctor":
            return "We offer a wide range of medical specialties, including cardiology, orthopedics, oncology, pediatrics, and more.";
        case "what are the visiting hours for patients":
        case "timing for hospital":
        case "timing":
            return "Available 24/7";
        case "goodbye":
            return "Goodbye! Have a great day!";
        default:
            return "Oops! Something went wrong. Please try again.";
    }
}
	</script>
	
	<script src="js/Patient.js"></script>
</body>
</html>
