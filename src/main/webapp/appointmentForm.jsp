<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg rounded">
        <div class="card-header bg-primary text-white">
            <h3 class="text-center">Book Appointment</h3>
        </div>
        <div class="card-body">
            <form action="addAppointment" method="post">
                <div class="mb-3">
                    <label for="doctorId" class="form-label">Doctor ID</label>
                    <input type="number" class="form-control" name="doctorId" id="doctorId" required>
                </div>

                <div class="mb-3">
                    <label for="patientId" class="form-label">Patient ID</label>
                    <input type="number" class="form-control" name="patientId" id="patientId" required>
                </div>

                <div class="mb-3">
                    <label for="date" class="form-label">Appointment Date</label>
                    <input type="date" class="form-control" name="date" id="date" required>
                </div>

                <div class="mb-3">
                    <label for="time" class="form-label">Appointment Time</label>
                    <input type="time" class="form-control" name="time" id="time" required>
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-select" name="status" id="status">
                        <option value="Scheduled">Scheduled</option>
                        <option value="Pending">Pending</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success w-100">Book Appointment</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
