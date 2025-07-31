<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DoctorCon" %>

<%
    // Admin role check
    String role = (String) session.getAttribute("role");
    if (session == null || role == null || !role.equals("admin")) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<html>
<head>
    <title>Manage Patients</title>
</head>
<body>
    <h2>Patient List</h2>
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Phone</th>
            <th>City</th>
            <th>Age</th>
            <th>Disease</th>
            <th>Actions</th>
        </tr>

<%
    try {
        Connection con = DoctorCon.getCon();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM patient");

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("city") %></td>
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("disease") %></td>
            <td>
                <a href="editPatient.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
                <a href="deletePatient.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure?')">Delete</a>
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
