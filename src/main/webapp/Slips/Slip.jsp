<%@ page import="connect.Connect"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Patient Slip</title>
<link rel="stylesheet"href="../css/Slip.css">
<script>
	function printSlip() {
		window.print();
	}
</script>
</head>
<body>
	<%
	String s_id = request.getParameter("s_id");

	PreparedStatement ps;
	ResultSet rs;

	try {
		Connect cn = new Connect();
		cn.DataConnection();
		String query = "SELECT * FROM offlineslip WHERE s_id = ?";
		ps = cn.c.prepareStatement(query);
		ps.setString(1, s_id);
		rs = ps.executeQuery();

		if (rs.next()) {
			// Retrieve patient details from the database
			String id = rs.getString("id");
			String name = rs.getString("name");
			String age = rs.getString("age");
			String gender = rs.getString("gender");
			String date = rs.getString("date");
			String type = rs.getString("type");
			String doctor = rs.getString("doctor");
			String fathername = rs.getString("fathername");
			String mobileno = rs.getString("mobileno");
			String street = rs.getString("street");
			String city = rs.getString("city");
			String state = rs.getString("state");

			// Set retrieved data as request attributes
			request.setAttribute("s_id", s_id);
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("age", age);
			request.setAttribute("gender", gender);

			request.setAttribute("type", type);
			request.setAttribute("fathername", fathername);
			request.setAttribute("mobileno", mobileno);
			request.setAttribute("street", street);
			request.setAttribute("city", city);
			request.setAttribute("state", state);

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<div class="print-button">
		<button class="button" type="button" value="Print"
			onclick="printSlip();">Print</button>
		<button class="button" type="button" value="back" onclick="back();">Back</button>
	</div>
	<div class="slip-container">
		<!-- Slip content -->
		<%
		// Get the current date
		java.util.Date currentDate = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy");
		String currentdate = sdf.format(currentDate);
		%>
		<div class="date"><%=currentdate%></div>
		<div class="phone-number">Phone: +91-9817788781,8307551446</div>
		<!-- Position the phone number outside slip-header -->
		<div class="slip-header">
			<img src="../img/lifelogo.jpeg" alt="Hospital Logo" height="30"
				width="50">
			<div class="hospital-info">
				<h2>LIFE LINE SUPERSPACILITY HOSPITAL</h2>
				<p>
					Add: Bhainswan chowk, Rohtak road<br> Gohana(Sonipat)
				</p>
				<div class="valid-text">OPD CONSULTATION</div>

			</div>
			<hr>
		</div>
		<div class="content">
			<div class="slip-content1">
				<span class="head">S-ID:</span>
				<p class="fill"><%=request.getAttribute("s_id")%></p>
				<span class="head">P-ID:</span>
				<p class="fill"><%=request.getAttribute("id")%></p>
				<span class="head">Patient Name:</span>
				<p class="fill"><%=request.getAttribute("name")%></p>
				<span class="head">Age:</span>
				<p class="fill"><%=request.getAttribute("age")%>
				</p>
			</div>
			<div class="slip-content2">
				<span class="head">Father's:</span>
				<p class="fill"><%=request.getAttribute("fathername")%></p>

				<span class="head">Address: </span>
				<p class="fill"><%=request.getAttribute("street")%></p>
				<span class="head">Contact No:</span>
				<p class="fill"><%=request.getAttribute("mobileno")%></p>


			</div>
			<div class="vital-signs">

				B.P.&nbsp; ...................... Temp.&nbsp; .....................
				SPO<sub>2</sub>.&nbsp; .................... P.Rate.&nbsp;
				....................
			</div>
			<div class="footer">
				<hr>
				<!-- Horizontal line -->
				<div class="valid-text">Valid for 7 days</div>
				Not valid for medico legal purpose
			</div>
		</div>
</div>
		<script>
			function back() {
				window.location.href = '../Recp/AddPatient.jsp';
			}
		</script>
</body>
</html>
