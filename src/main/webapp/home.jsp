<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">Welcome to Hospital Management System</h2>
    <div class="row justify-content-center">
        <!-- Admin Card -->
        <div class="col-md-4">
            <div class="card text-center shadow-lg mb-4">
                <div class="card-header bg-primary text-white">
                    <h5>Admin</h5>
                </div>
                <div class="card-body">
                    <p>Manage doctors, patients, and appointments.</p>
                    <a href="adminLogin.jsp" class="btn btn-primary">Admin Login</a>
                </div>
            </div>
        </div>
        <!-- Doctor Card -->
        <div class="col-md-4">
            <div class="card text-center shadow-lg mb-4">
                <div class="card-header bg-success text-white">
                    <h5>Doctor</h5>
                </div>
                <div class="card-body">
                    <p>Login to manage appointments and patient records.</p>
                    <a href="doctorLogin.jsp" class="btn btn-success">Doctor Login</a>
                </div>
            </div>
        </div>
        <!-- Patient Card -->
        <div class="col-md-4">
            <div class="card text-center shadow-lg mb-4">
                <div class="card-header bg-info text-white">
                    <h5>Patient</h5>
                </div>
                <div class="card-body">
                    <p>Book appointments and view doctor details.</p>
                    <a href="patientLogin.jsp" class="btn btn-info text-white">Patient Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
