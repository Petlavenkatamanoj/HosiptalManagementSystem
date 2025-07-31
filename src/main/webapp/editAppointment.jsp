<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DoctorCon" %>
<%@ page session="true" %>

<%
    String role = (String) session.getAttribute("role");
    if (session == null || role == null || !role.equals("admin")) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DoctorCon.getCon();

    PreparedStatement pst = con.prepareStatement("SELECT * FROM appointment WHERE id = ?");
    pst.setInt(1, id);
    ResultSet rs = pst.executeQuery();

    int patientId = 0, doctorId = 0;
    String date = "", time = "";
    if (rs.next()) {
        patientId = rs.getInt("patient_id");
        doctorId = rs.getInt("doctor_id");
        date = rs.getString("date");
        time = rs.getString("time");
    }
%>

<html>
<head><title>Edit Appointment</title></head>
<body>
<h2>Edit Appointment</h2>
<form action="updateAppointment.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>" />
    Date: <input type="date" name="date" value="<%= date %>" required /><br><br>
    Time: <input type="time" name="time" value="<%= time %>" required /><br><br>
    <input type="submit" value="Update" />
</form>
</body>
</html>
