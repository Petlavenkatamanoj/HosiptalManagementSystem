package hospitalmanagementsystem.admin;

import DB.DoctorCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDashboardDAO {

    public int getDoctorCount() {
        return getCount("SELECT COUNT(*) FROM doctorEmp");
    }

    public int getPatientCount() {
        return getCount("SELECT COUNT(*) FROM patient");
    }

    public int getAppointmentCount() {
        return getCount("SELECT COUNT(*) FROM appointment");
    }

    private int getCount(String sql) {
        int count = 0;
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
