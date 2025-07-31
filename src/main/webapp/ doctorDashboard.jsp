<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || !"doctor".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
