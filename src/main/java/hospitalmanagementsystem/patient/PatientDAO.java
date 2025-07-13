package hospitalmanagementsystem.patient;

import DB.DoctorCon;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PatientDAO {
    public int addPatient(HttpServletRequest req) {
        int k = 0;
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO patient(name, gender, phone, age, address, disease, admit_status, room_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("gender"));
            ps.setString(3, req.getParameter("phone"));
            ps.setInt(4, Integer.parseInt(req.getParameter("age")));
            ps.setString(5, req.getParameter("address"));
            ps.setString(6, req.getParameter("disease"));
            ps.setString(7, req.getParameter("admit_status"));
            ps.setString(8, req.getParameter("room_number"));

            k = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }
    public List<Patient> getAllPatients() {
        List<Patient> patients = new ArrayList<>();

        try (Connection con = DoctorCon.getCon();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM patient");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Patient p = new Patient();
                p.setName(rs.getString("name"));
                p.setGender(rs.getString("gender"));
                p.setPhone(rs.getString("phone"));
                p.setAge(rs.getInt("age"));
                p.setAddress(rs.getString("address"));
                p.setDisease(rs.getString("disease"));
                p.setAdmitStatus(rs.getString("admit_status"));
                p.setRoomNumber(rs.getString("room_number"));
                patients.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return patients;
    }
    public Patient getPatientById(int id) {
        Patient p = null;
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM patient WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Patient();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setGender(rs.getString("gender"));
                p.setPhone(rs.getString("phone"));
                p.setAge(rs.getInt("age"));
                p.setAddress(rs.getString("address"));
                p.setDisease(rs.getString("disease"));
                p.setAdmitStatus(rs.getString("admit_status"));
                p.setRoomNumber(rs.getString("room_number"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    public int updatePatient(Patient p) {
        int k = 0;
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE patient SET name=?, gender=?, phone=?, age=?, address=?, disease=?, admit_status=?, room_number=? WHERE id=?"
            );
            ps.setString(1, p.getName());
            ps.setString(2, p.getGender());
            ps.setString(3, p.getPhone());
            ps.setInt(4, p.getAge());
            ps.setString(5, p.getAddress());
            ps.setString(6, p.getDisease());
            ps.setString(7, p.getAdmitStatus());
            ps.setString(8, p.getRoomNumber());
            ps.setInt(9, p.getId());

            k = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }
    public int deletePatientById(int id) {
        int k = 0;
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement("DELETE FROM patient WHERE id=?");
            ps.setInt(1, id);
            k = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }
    public List<Patient> searchPatients(String keyword) {
        List<Patient> list = new ArrayList<>();
        try {
            Connection con = DoctorCon.getCon();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM patient WHERE name LIKE ? OR address LIKE ? OR disease LIKE ?"
            );
            String likeKeyword = "%" + keyword + "%";
            ps.setString(1, likeKeyword);
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Patient p = new Patient();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setGender(rs.getString("gender"));
                p.setPhone(rs.getString("phone"));
                p.setAge(rs.getInt("age"));
                p.setAddress(rs.getString("address"));
                p.setDisease(rs.getString("disease"));
                p.setAdmitStatus(rs.getString("admit_status"));
                p.setRoomNumber(rs.getString("room_number"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


}
