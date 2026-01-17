<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
    function confirmLogout() {
        if (confirm("Are you sure you want to logout?")) {
            document.getElementById("logoutForm").submit();
        }
    }
</script>
</head>
<body>
<form id="logoutForm" action="../Logout" method="post">
    <!-- This is just a button, you can style it as per your requirement -->
    <button type="button" onclick="confirmLogout()">Logout</button>
</form>
</body>
</html>