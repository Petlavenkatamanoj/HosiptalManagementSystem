package hospitalmanagementsystem.patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/patientList")
public class PatientListServlet extends HttpServlet {
    private PatientDAO dao;

    public void init() {
        dao = new PatientDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        List<Patient> patientList = dao.getAllPatients();
        req.setAttribute("patients", patientList);
        req.getRequestDispatcher("patientList.jsp").forward(req, res);
    }
}
