<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("admin")) {
    response.sendRedirect("adminLogin.jsp");
}
%>

<html>
<head><title>Add Patient</title></head>
<body>
<h2>Patient Registration Form</h2>
<form action="patient" method="post">
    Id:<input type="number" name="id" required><br><br>
    Name: <input type="text" name="name" required><br><br>
    Gender:
    <input type="radio" name="gender" value="Male" required> Male
    <input type="radio" name="gender" value="Female"> Female<br><br>
    Phone: <input type="text" name="phone" required><br><br>
    Age: <input type="number" name="age" required><br><br>
    Address: <textarea name="address" required></textarea><br><br>
    Disease: <input type="text" name="disease" required><br><br>
    Admit Status:
    <select name="admit_status">
        <option>Admitted</option>
        <option>Discharged</option>
    </select><br><br>
    Room Number: <input type="text" name="room_number"><br><br>

    <input type="submit" value="Add Patient">
</form>
<% if (request.getAttribute("msg") != null) { %>
  <div class="alert alert-info alert-dismissible fade show mt-3" role="alert">
    <%= request.getAttribute("msg") %>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  </div>
<% } %>

</body>
</html>
