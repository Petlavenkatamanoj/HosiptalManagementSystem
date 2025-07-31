<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DoctorCon" %>

<%
    String role = (String) session.getAttribute("role");
    if (session == null || role == null || !role.equals("admin")) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<html>
<head>
    <title>Manage Appointments</title>
</head>
<body>
    <h2>Appointment List</h2>
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Patient Name</th>
            <th>Doctor Name</th>
            <th>Date</th>
            <th>Time</th>
            <th>Actions</th>
        </tr>

<%
    try {
        Connection con = DoctorCon.getCon();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(
            "SELECT a.id, p.name AS patientName, d.name AS doctorName, a.date, a.time " +
            "FROM appointment a " +
            "JOIN patient p ON a.patient_id = p.id " +
            "JOIN doctor d ON a.doctor_id = d.id"
        );

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("doctorName") %></td>
            <td><%= rs.getString("patientName") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getString("time") %></td>
            <td><a href="editAppointment.jsp?id=<%= rs.getInt("id") %>">Edit</a></td>
            <td><a href="deleteAppointment.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure?')">Delete</a></td>
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
