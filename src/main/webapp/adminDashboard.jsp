<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="hospitalmanagementsystem.admin.AdminDashboardDAO" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />
<%
    AdminDashboardDAO dashDao = new AdminDashboardDAO();
    int doctorCount = dashDao.getDoctorCount();
    int patientCount = dashDao.getPatientCount();
    int appointmentCount = dashDao.getAppointmentCount();
%>

<%
    if (session == null || session.getAttribute("adminUser") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<html>
<head><title>Admin Dashboard</title></head>
<body>
<h2>Welcome, <%= session.getAttribute("adminUser") %>!</h2>
<ul>
    <li><a href="doctor.jsp">Manage Doctors</a></li>
    <li><a href="patient.jsp">Manage Patients</a></li>
    <li><a href="logout.jsp">Logout</a></li>
    <li><a href="patientList">View All Patients</a></li>
    <li><a href="appointmentForm.jsp">Schedule Appointment</a></li>
    <li><a href="searchPatient.jsp">Search Patient</a></li>
    <li><a href="searchDoctor.jsp">Search Doctor</a>
</li>
</ul>
<h2>Admin Dashboard</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Entity</th>
        <th>Count</th>
    </tr>
    <tr>
        <td>Total Doctors</td>
        <td><%= doctorCount %></td>
    </tr>
    <tr>
        <td>Total Patients</td>
        <td><%= patientCount %></td>
    </tr>
    <tr>
        <td>Total Appointments</td>
        <td><%= appointmentCount %></td>
    </tr>
</table>

</body>
</html>
