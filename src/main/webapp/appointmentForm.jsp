<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("admin")) {
    response.sendRedirect("adminLogin.jsp");
}
%>

<html>
<head>
    <title>Schedule Appointment</title>
</head>
<body>
<h2>Schedule Appointment</h2>
<form action="appointment" method="post">
    Doctor ID: <input type="number" name="doctor_id" required><br><br>
    Patient ID: <input type="number" name="patient_id" required><br><br>
    Date: <input type="date" name="date" required><br><br>
    Time: <input type="time" name="time" required><br><br>
    Status:
    <select name="status">
        <option>Scheduled</option>
        <option>Completed</option>
        <option>Cancelled</option>
    </select><br><br>
    <input type="submit" value="Schedule">
</form>
</body>
</html>
