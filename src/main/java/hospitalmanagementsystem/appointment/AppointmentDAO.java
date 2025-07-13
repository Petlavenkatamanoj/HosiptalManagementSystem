package hospitalmanagementsystem.appointment;

import DB.DoctorCon;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AppointmentDAO {
    public int addAppointment(Appointment appt) {
        int k = 0;
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO appointment (doctor_id, patient_id, date, time, status) VALUES (?, ?, ?, ?, ?)"
            );
            ps.setInt(1, appt.getDoctorId());
            ps.setInt(2, appt.getPatientId());
            ps.setString(3, appt.getDate());
            ps.setString(4, appt.getTime());
            ps.setString(5, appt.getStatus());

            k = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }
}
