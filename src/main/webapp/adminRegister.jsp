<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Registration</title>
</head>
<body>
    <h2>Register Admin</h2>

    <%
        String error = request.getParameter("error");
        if ("username_exists".equals(error)) {
    %>
        <p style="color:red;">Username already exists.</p>
    <%
        } else if ("insert_failed".equals(error)) {
    %>
        <p style="color:red;">Failed to insert admin. Try again.</p>
    <%
        } else if ("exception".equals(error)) {
    %>
        <p style="color:red;">Something went wrong during registration. Try again.</p>
    <% } %>

    <form action="AdminRegisterServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Register">
    </form>

    <p>Already have an account? <a href="adminLogin.jsp">Login here</a>.</p>
</body>
</html>
