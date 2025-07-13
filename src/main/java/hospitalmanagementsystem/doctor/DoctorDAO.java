package hospitalmanagementsystem.doctor;

import DB.DoctorCon;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAO {
    public int k = 0;

    public int addData(HttpServletRequest req) {
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement pm = con.prepareStatement(
                    "INSERT INTO doctorEmp(name, gender, phone, city, email, age, address, qualification) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );


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
    public List<Doctor> searchDoctors(String keyword) {
        List<Doctor> list = new ArrayList<>();
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM doctorEmp WHERE name LIKE ? OR city LIKE ? OR qualification LIKE ?"
            );
            String likeKeyword = "%" + keyword + "%";
            ps.setString(1, likeKeyword);
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setName(rs.getString("name"));
                d.setGender(rs.getString("gender"));
                d.setPhone(rs.getString("phone"));
                d.setEmail(rs.getString("email"));
                d.setAge(rs.getInt("age"));
                d.setCity(rs.getString("city"));
                d.setAddress(rs.getString("address"));
                d.setQualification(rs.getString("qualification"));
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
