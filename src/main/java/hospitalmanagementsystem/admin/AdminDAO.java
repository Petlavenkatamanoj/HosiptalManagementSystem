package hospitalmanagementsystem.admin;

import DB.DoctorCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
    public boolean login(String username, String password) {
        boolean isValid = false;
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
