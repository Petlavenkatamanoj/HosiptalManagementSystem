<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Registration</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Register Admin</h4>
                </div>
                <div class="card-body">

                    <%
                        String error = request.getParameter("error");
                        if ("username_exists".equals(error)) {
                    %>
                        <div class="alert alert-danger">Username already exists.</div>
                    <%
                        } else if ("insert_failed".equals(error)) {
                    %>
                        <div class="alert alert-danger">Failed to insert admin. Try again.</div>
                    <%
                        } else if ("exception".equals(error)) {
                    %>
                        <div class="alert alert-danger">Something went wrong during registration. Try again.</div>
                    <% } %>

                    <form action="AdminRegisterServlet" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form>

                </div>
                <div class="card-footer text-center">
                    <p>Already have an account? <a href="adminLogin.jsp">Login here</a>.</p>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS (optional, for components like modals) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
