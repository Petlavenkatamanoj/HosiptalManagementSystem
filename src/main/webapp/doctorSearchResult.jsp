<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="hospitalmanagementsystem.doctor.Doctor" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />

<html>
<head><title>Doctor Search Result</title></head>
<body>
<h2>Search Results</h2>
<table border="1" cellpadding="5">
<tr>
    <th>Name</th><th>Gender</th><th>Phone</th><th>City</th><th>Email</th><th>Age</th><th>Qualification</th>
</tr>
<%
    List<Doctor> list = (List<Doctor>) request.getAttribute("doctors");
    if (list != null && !list.isEmpty()) {
        for (Doctor d : list) {
%>
<tr>
    <td><%= d.getName() %></td>
    <td><%= d.getGender() %></td>
    <td><%= d.getPhone() %></td>
    <td><%= d.getCity() %></td>
    <td><%= d.getEmail() %></td>
    <td><%= d.getAge() %></td>
    <td><%= d.getQualification() %></td>
</tr>
<%
        }
    } else {
%>
<tr><td colspan="7">No results found.</td></tr>
<%
    }
%>
</table>
</body>
</html>
