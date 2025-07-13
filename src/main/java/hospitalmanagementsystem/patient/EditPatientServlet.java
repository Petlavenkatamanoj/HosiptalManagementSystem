package hospitalmanagementsystem.patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/editPatient")
public class EditPatientServlet extends HttpServlet {
    private PatientDAO dao;

    public void init() {
        dao = new PatientDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Patient p = dao.getPatientById(id);
            if (p != null) {
                req.setAttribute("patient", p);
                req.getRequestDispatcher("editPatient.jsp").forward(req, res);
            } else {
                res.getWriter().println("Patient with ID " + id + " not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Patient p = new Patient();
        p.setId(Integer.parseInt(req.getParameter("id")));
        p.setName(req.getParameter("name"));
        p.setGender(req.getParameter("gender"));
        p.setPhone(req.getParameter("phone"));
        p.setAge(Integer.parseInt(req.getParameter("age")));
        p.setAddress(req.getParameter("address"));
        p.setDisease(req.getParameter("disease"));
        p.setAdmitStatus(req.getParameter("admit_status"));
        p.setRoomNumber(req.getParameter("room_number"));

        int result = dao.updatePatient(p);
        if (result > 0) {
            res.sendRedirect("patientList");
        } else {
            res.getWriter().println("Failed to update");
        }
    }
}
