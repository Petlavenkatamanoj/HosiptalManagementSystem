<%@ page import="java.util.*" %>
<%@ page session="true" %>

<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("adminLogin.jsp"); // send back to login if not admin
        return;
    }
%>

<jsp:include page="header.jsp" />
<jsp:include page="navbar.jsp" />

<div class="container mt-4">
    <h2 class="mb-3">Admin Dashboard</h2>

    <div class="row">
        <div class="col-md-4">
            <div class="card text-white bg-primary mb-3">
                <div class="card-header">Doctors</div>
                <div class="card-body">
                    <h5 class="card-title">Total Doctors: 5</h5>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-white bg-success mb-3">
                <div class="card-header">Patients</div>
                <div class="card-body">
                    <h5 class="card-title">Total Patients: 20</h5>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-white bg-warning mb-3">
                <div class="card-header">Appointments</div>
                <div class="card-body">
                    <h5 class="card-title">Total Appointments: 12</h5>
                </div>
            </div>
        </div>
    </div>

    <a href="logout.jsp" class="btn btn-danger">Logout</a>
</div>
