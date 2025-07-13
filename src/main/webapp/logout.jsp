<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />
<%
    session.invalidate();
    response.sendRedirect("adminLogin.jsp");
%>
