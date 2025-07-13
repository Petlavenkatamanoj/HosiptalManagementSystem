<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="hospitalmanagementsystem.patient.Patient" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />

<%
    Patient p = (Patient) request.getAttribute("patient");
    if (p == null) {
%>
    <h2>Patient Not Found</h2>
    <a href="patientList">Back to List</a>
<%
        return;
    }
%>

<html>
<head><title>Edit Patient</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h2>Edit Patient</h2>
<form action="editPatient" method="post">
    <input type="hidden" name="id" value="<%= p.getId() %>">
    Name: <input type="text" name="name" value="<%= p.getName() %>" required><br><br>
    Gender:
    <input type="radio" name="gender" value="Male" <%= "Male".equals(p.getGender()) ? "checked" : "" %>> Male
    <input type="radio" name="gender" value="Female" <%= "Female".equals(p.getGender()) ? "checked" : "" %>> Female<br><br>
    Phone: <input type="text" name="phone" value="<%= p.getPhone() %>" required><br><br>
    Age: <input type="number" name="age" value="<%= p.getAge() %>" required><br><br>
    Address: <textarea name="address"><%= p.getAddress() %></textarea><br><br>
    Disease: <input type="text" name="disease" value="<%= p.getDisease() %>" required><br><br>
    Admit Status:
    <select name="admit_status">
        <option value="Admitted" <%= "Admitted".equals(p.getAdmitStatus()) ? "selected" : "" %>>Admitted</option>
        <option value="Discharged" <%= "Discharged".equals(p.getAdmitStatus()) ? "selected" : "" %>>Discharged</option>
    </select><br><br>
    Room Number: <input type="text" name="room_number" value="<%= p.getRoomNumber() %>"><br><br>

    <input type="submit" value="Update Patient">
</form>
</body>
</html>
