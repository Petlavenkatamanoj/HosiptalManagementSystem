<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="text-center mb-4">Doctor Management</h1>

    <!-- Add Doctor Form -->
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">Add New Doctor</div>
        <div class="card-body">
            <form method="post" action="AddDoctorServlet">
                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Gender</label>
                        <input type="text" name="gender" class="form-control" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Phone</label>
                        <input type="text" name="phone" class="form-control" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label">City</label>
                        <input type="text" name="city" class="form-control" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Age</label>
                        <input type="number" name="age" class="form-control" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" class="form-control" required>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label">Qualification</label>
                        <input type="text" name="qualification" class="form-control" required>
                    </div>
                    <div class="col">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Add Doctor</button>
            </form>
        </div>
    </div>

    <!-- Doctor List Table -->
    <div class="card">
        <div class="card-header bg-secondary text-white">Doctor List</div>
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>City</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "yourpassword");

                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM doctoremp");

                        while(rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("phone") %></td>
                        <td><%= rs.getString("city") %></td>
                        <td>
                            <form method="post" action="DeleteDoctorServlet" onsubmit="return confirm('Are you sure to delete this doctor?');">
                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%
                        }
                        rs.close();
                        st.close();
                        con.close();
                    } catch(Exception e) {
                        out.println("<tr><td colspan='6' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
