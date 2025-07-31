<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DoctorCon" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DoctorCon.getCon();
    PreparedStatement pst = con.prepareStatement("DELETE FROM appointment WHERE id=?");
    pst.setInt(1, id);

    int status = pst.executeUpdate();

    if (status > 0) {
        response.sendRedirect("manageAppointments.jsp");
    } else {
        out.println("Failed to delete appointment");
    }
%>
