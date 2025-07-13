<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />
<html>
<head><title>Admin Login</title></head>
<body>
<h2>Admin Login</h2>
<form action="adminLogin" method="post">
    Username: <input type="text" name="username" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    <input type="submit" value="Login">
</form>
<% if ("invalid".equals(request.getParameter("error"))) { %>
    <p style="color:red;">Invalid username or password.</p>
<% } %>
</body>
</html>
