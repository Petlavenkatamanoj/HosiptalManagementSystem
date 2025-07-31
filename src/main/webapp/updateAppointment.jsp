<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DoctorCon" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String date = request.getParameter("date");
    String time = request.getParameter("time");

    Connection con = DoctorCon.getCon();
    PreparedStatement pst = con.prepareStatement("UPDATE appointment SET date=?, time=? WHERE id=?");
    pst.setString(1, date);
    pst.setString(2, time);
    pst.setInt(3, id);
    int status = pst.executeUpdate();

    if (status > 0) {
        response.sendRedirect("manageAppointments.jsp");
    } else {
        out.println("Failed to update appointment");
    }
%>
