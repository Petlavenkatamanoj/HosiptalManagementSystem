package hospitalmanagementsystem.appointment;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String status = request.getParameter("status");

        Appointment appointment = new Appointment();
        appointment.setDoctorId(doctorId);
        appointment.setPatientId(patientId);
        appointment.setDate(date);
        appointment.setTime(time);
        appointment.setStatus(status);

        AppointmentDAO dao = new AppointmentDAO();
        boolean result = dao.addAppointment(appointment);

        if (result) {
            RequestDispatcher rd = request.getRequestDispatcher("appointmentSuccess.jsp");
            rd.forward(request, response);
        } else {
            response.getWriter().println("Failed to schedule appointment. Try again.");
        }
    }
}
