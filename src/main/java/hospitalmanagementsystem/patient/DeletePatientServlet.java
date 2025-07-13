package hospitalmanagementsystem.patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deletePatient")
public class DeletePatientServlet extends HttpServlet {
    private PatientDAO dao;

    public void init() {
        dao = new PatientDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int result = dao.deletePatientById(id);
        res.sendRedirect("patientList");
    }
}
