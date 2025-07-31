<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg">
                <div class="card-header text-center">
                    <h4>Register as Patient</h4>
                </div>
                <div class="card-body">
                    <form action="PatientRegisterServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Name:</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Username:</label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password:</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Gender:</label>
                            <select class="form-select" name="gender">
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                        <% if (request.getParameter("error") != null) { %>
                            <p class="mt-3 text-danger text-center">
                                <%= request.getParameter("error") %>
                            </p>
                        <% } %>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
