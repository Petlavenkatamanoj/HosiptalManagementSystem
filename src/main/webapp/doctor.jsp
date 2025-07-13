<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />
<html>
<head>
<title>Add Doctor</title></head>
<body>
<div class="container mt-4">
  <h2>Add Doctor</h2>
  <form action="doctor" method="get" class="row g-3">
    <div class="col-md-6">
      <label class="form-label">Name</label>
      <input type="text" class="form-control" name="name" required>
    </div>
    <div class="col-md-6">
      <label class="form-label">Gender</label><br>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" value="Male" checked>
        <label class="form-check-label">Male</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" value="Female">
        <label class="form-check-label">Female</label>
      </div>
    </div>
    <div class="col-md-6">
      <label class="form-label">Phone</label>
      <input type="text" class="form-control" name="phone" required>
    </div>
    <div class="col-md-6">
      <label class="form-label">City</label>
      <input type="text" class="form-control" name="city" required>
    </div>
    <div class="col-md-6">
      <label class="form-label">Email</label>
      <input type="email" class="form-control" name="email" required>
    </div>
    <div class="col-md-6">
      <label class="form-label">Age</label>
      <input type="number" class="form-control" name="age" required>
    </div>
    <div class="col-12">
      <label class="form-label">Address</label>
      <textarea class="form-control" name="address"></textarea>
    </div>
    <div class="col-12">
      <label class="form-label">Qualification</label>
      <input type="text" class="form-control" name="qualification">
    </div>
    <div class="col-12">
      <button type="submit" class="btn btn-primary">Add Doctor</button>
    </div>
  </form>
</div>
</body>
</html>
