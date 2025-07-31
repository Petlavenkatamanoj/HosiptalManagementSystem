<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Patients</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">Patient Management</h2>

    <!-- Add Patient Form -->
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">Add New Patient</div>
        <div class="card-body">
            <form method="post" action="AddPatientServlet" class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" required />
                </div>
                <div class="col-md-3">
                    <label class="form-label">Gender</label>
                    <input type="text" name="gender" class="form-control" required />
                </div>
                <div class="col-md-3">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phone" class="form-control" required />
                </div>
                <div class="col-md-2">
                    <label class="form-label">Age</label>
                    <input type="number" name="age" class="form-control" required />
                </div>
                <div class="col-md-5">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" class="form-control" required />
                </div>
                <div class="col-md-5">
                    <label class="form-label">Disease</label>
                    <input type="text" name="disease" class="form-control" required />
                </div>
                <div class="col-md-3">
                    <label class="form-label">Admit Status</label>
                    <input type="text" name="admit_status" class="form-control" required />
                </div>
                <div class="col-md-3">
                    <label class="form-label">Room No</label>
                    <input type="text" name="room_number" class="form-control" required />
                </div>
                <div class="col-md-5">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required />
                </div>
                <div class="col-md-5">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required />
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-success">Add Patient</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Patient List Table -->
    <div class="card mb-4">
        <div class="card-header bg-secondary text-white">All Patients</div>
        <div class="card-body table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th><th>Name</th><th>Gender</th><th>Phone</th><th>Age</th><th>Address</th>
                        <th>Disease</th><th>Status</th><th>Room</th><th>Email</th><th>Action</th>
                    </tr>
                </thead>
                <tbody>
<%
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "yourpassword");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM patient");

    while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("disease") %></td>
            <td><%= rs.getString("admit_status") %></td>
            <td><%= rs.getString("room_number") %></td>
            <td><%= rs.getString("email") %></td>
            <td>
                <form method="post" action="DeletePatientServlet" onsubmit="return confirm('Are you sure?')">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
            </td>
        </tr>
<%
    }
    con.close();
%>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Appointment Form -->
    <div class="card">
        <div class="card-header bg-info text-white">Create Appointment</div>
        <div class="card-body">
            <form method="post" action="AddAppointmentServlet" class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Patient ID</label>
                    <input type="number" name="patient_id" class="form-control" required />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Doctor ID</label>
                    <input type="number" name="doctor_id" class="form-control" required />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Date</label>
                    <input type="date" name="date" class="form-control" required />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Time</label>
                    <input type="time" name="time" class="form-control" required />
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Create Appointment</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS (optional, for modals/alerts if used later) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
