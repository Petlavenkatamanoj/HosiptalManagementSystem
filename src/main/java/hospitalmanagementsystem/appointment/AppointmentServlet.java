package hospitalmanagementsystem.appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {
    private AppointmentDAO dao;

    public void init() {
        dao = new AppointmentDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Appointment appt = new Appointment();
        appt.setDoctorId(Integer.parseInt(req.getParameter("doctor_id")));
        appt.setPatientId(Integer.parseInt(req.getParameter("patient_id")));
        appt.setDate(req.getParameter("date"));
        appt.setTime(req.getParameter("time"));
        appt.setStatus(req.getParameter("status"));

        int result = dao.addAppointment(appt);
        if (result > 0) {
            res.sendRedirect("appointmentSuccess.jsp");
        } else {
            res.getWriter().println("Failed to add appointment");
        }
    }
}
