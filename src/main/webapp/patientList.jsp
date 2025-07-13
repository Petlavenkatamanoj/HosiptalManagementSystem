<%@ page import="java.util.List" %>
<%@ page import="hospitalmanagementsystem.patient.Patient" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />

<html>
<head><title>Patient List</title></head>
<body>
    <h1>Patient List</h1>
    <table class="table table-striped table-hover mt-4">
      <thead class="table-dark">
        <tr>
          <th>Name</th><th>Age</th><th>Phone</th><th>Address</th><th>Disease</th><th>Status</th><th>Room</th><th>Actions</th>
        </tr>
      </thead>
      <tbody>
      <% for (Patient p : list) { %>
        <tr>
          <td><%= p.getName() %></td>
          <td><%= p.getAge() %></td>
          <td><%= p.getPhone() %></td>
          <td><%= p.getAddress() %></td>
          <td><%= p.getDisease() %></td>
          <td><%= p.getAdmitStatus() %></td>
          <td><%= p.getRoomNumber() %></td>
          <td>
            <a class="btn btn-sm btn-warning" href="editPatient?id=<%=p.getId()%>">Edit</a>
            <a class="btn btn-sm btn-danger" href="deletePatient?id=<%=p.getId()%>" onclick="return confirm('Are you sure?');">Delete</a>
          </td>
        </tr>
      <% } %>
      </tbody>
    </table>

</body>
</html>
