package hosiptalmanagementsystem.doctor;

import DB.DoctorCon;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DoctorDAO {
    public int k = 0;

    public int addData(HttpServletRequest req) {
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement pm = con.prepareStatement("INSERT INTO doctorEmp VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            pm.setString(1, req.getParameter("name"));
            pm.setString(2, req.getParameter("gender"));
            pm.setString(3, req.getParameter("phone"));
            pm.setString(4, req.getParameter("city"));
            pm.setString(5, req.getParameter("email"));
            pm.setString(6, req.getParameter("age"));
            pm.setString(7, req.getParameter("address"));
            pm.setString(8, req.getParameter("qualification"));

            k = pm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }
}
