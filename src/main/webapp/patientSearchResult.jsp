<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="hospitalmanagementsystem.patient.Patient" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />

<html>
<head><title>Patient Search Result</title></head>
<body>
<h2>Search Results</h2>
<table border="1" cellpadding="5">
<tr>
    <th>Name</th><th>Gender</th><th>Phone</th><th>Age</th><th>Address</th><th>Disease</th><th>Status</th><th>Room</th>
</tr>
<%
    List<Patient> list = (List<Patient>) request.getAttribute("patients");
    if (list != null && !list.isEmpty()) {
        for (Patient p : list) {
%>
<tr>
    <td><%= p.getName() %></td>
    <td><%= p.getGender() %></td>
    <td><%= p.getPhone() %></td>
    <td><%= p.getAge() %></td>
    <td><%= p.getAddress() %></td>
    <td><%= p.getDisease() %></td>
    <td><%= p.getAdmitStatus() %></td>
    <td><%= p.getRoomNumber() %></td>
</tr>
<%
        }
    } else {
%>
<tr><td colspan="8">No results found.</td></tr>
<%
    }
%>
</table>
</body>
</html>
