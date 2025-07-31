<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");

    if (session == null || role == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Admin Dashboard</h1>

        <div class="row">

            <%-- Show Doctors card only for admin --%>
            <% if ("admin".equals(role)) { %>
            <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-header">Doctors</div>
                    <div class="card-body">
                        <h5 class="card-title">Total Doctors: 5</h5>
                        <a href="manageDoctors.jsp" class="btn btn-light">Manage Doctors</a>
                    </div>
                </div>
            </div>
            <% } %>

            <%-- Show Patients and Appointments for admin and receptionist --%>
            <% if ("admin".equals(role) || "receptionist".equals(role)) { %>
            <div class="col-md-4">
                <div class="card text-white bg-success mb-3">
                    <div class="card-header">Patients</div>
                    <div class="card-body">
                        <h5 class="card-title">Total Patients: 20</h5>
                        <a href="managePatients.jsp" class="btn btn-light">Manage Patients</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-header">Appointments</div>
                    <div class="card-body">
                        <h5 class="card-title">Total Appointments: 12</h5>
                        <a href="manageAppointments.jsp" class="btn btn-light">Manage Appointments</a>
                    </div>
                </div>
            </div>
            <% } %>

        </div>

        <a href="logout.jsp" class="btn btn-danger mt-4">Logout</a>
    </div>
</body>
</html>
