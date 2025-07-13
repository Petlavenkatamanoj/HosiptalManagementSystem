package hospitalmanagementsystem.patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/patient")
public class PatientServlet extends HttpServlet {
    private PatientDAO dao;

    public void init() {
        dao = new PatientDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int result = dao.addPatient(req);
        PrintWriter out = res.getWriter();


        if (result > 0) {
            req.setAttribute("msg", "Patient added successfully!");
        } else {
            req.setAttribute("msg", " Failed to add patient.");
        }
        req.getRequestDispatcher("patient.jsp").forward(req, res);

    }
}
