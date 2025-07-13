package hospitalmanagementsystem.patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchPatient")
public class SearchPatientServlet extends HttpServlet {
    private PatientDAO dao;

    public void init() {
        dao = new PatientDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Patient> result = dao.searchPatients(keyword);
        req.setAttribute("patients", result);
        req.getRequestDispatcher("patientSearchResult.jsp").forward(req, res);
    }
}
