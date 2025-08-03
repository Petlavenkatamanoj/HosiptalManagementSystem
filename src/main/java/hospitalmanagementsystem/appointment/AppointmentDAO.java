package hospitalmanagementsystem.appointment;

import java.sql.*;
import java.util.*;
import DB.DoctorCon;

public class AppointmentDAO {

    private Connection conn;

    public AppointmentDAO() {
        conn = DoctorCon.getCon(); // Make sure DoctorCon.getConnection() returns a valid DB connection
    }

    public boolean addAppointment(Appointment appointment) {
        String sql = "INSERT INTO appointment (doctor_id, patient_id, date, time, status) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, appointment.getDoctorId());
            stmt.setInt(2, appointment.getPatientId());
            stmt.setString(3, appointment.getDate());
            stmt.setString(4, appointment.getTime());
            stmt.setString(5, appointment.getStatus());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
