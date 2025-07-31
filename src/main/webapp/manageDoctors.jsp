<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="hospitalmanagementsystem.doctor.Doctor" %>
<%@ page import="DB.DoctorCon" %>
<%@ page import="java.sql.*" %>

<%
    // Session check for admin
    String role = (String) session.getAttribute("role");
    if (session == null || role == null || !role.equals("admin")) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<html>
<head>
    <title>Manage Doctors</title>
</head>
<body>
<h2>Manage Doctors</h2>

<table border="1" cellpadding="5">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Gender</th>
    <th>Phone</th>
    <th>City</th>
    <th>Email</th>
    <th>Age</th>
    <th>Qualification</th>
    <th>Actions</th>
</tr>

<%
    try {
        Connection con = DoctorCon.getCon();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM doctor");

        while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("gender") %></td>
    <td><%= rs.getString("phone") %></td>
    <td><%= rs.getString("city") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getInt("age") %></td>
    <td><%= rs.getString("qualification") %></td>
    <td>
        <a href="editDoctor.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
        <a href="deleteDoctor.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure?')">Delete</a>
    </td>
</tr>
<%
        }
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</table>

</body>
</html>
