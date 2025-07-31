<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Admin Login</h4>
                </div>
                <div class="card-body">

                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("errorMessage") %>
                        </div>
                    <% } %>

                    <form action="AdminLoginServlet" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" name="username" id="username" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" id="password" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>

                </div>
                <div class="card-footer text-center">
                    <p>Don't have an account? <a href="adminRegister.jsp">Register here</a>.</p>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
