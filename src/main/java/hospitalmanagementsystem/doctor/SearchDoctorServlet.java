package hospitalmanagementsystem.doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchDoctor")
public class SearchDoctorServlet extends HttpServlet {
    private DoctorDAO dao;

    public void init() {
        dao = new DoctorDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Doctor> result = dao.searchDoctors(keyword);
        req.setAttribute("doctors", result);
        req.getRequestDispatcher("doctorSearchResult.jsp").forward(req, res);
    }
}
