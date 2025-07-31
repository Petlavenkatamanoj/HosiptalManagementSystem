package hospitalmanagementsystem.patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import DB.DoctorCon;

@WebServlet("/PatientLoginServlet")
public class PatientLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DoctorCon.getCon()) {
            String sql = "SELECT * FROM patient WHERE email=? AND password=?";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userType", "patient");
                    session.setAttribute("patientId", rs.getInt("id"));
                    session.setAttribute("patientName", rs.getString("name"));

                    response.sendRedirect("patientDashboard.jsp");
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    request.getRequestDispatcher("patientLogin.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Database error in PatientLoginServlet", e);
        }
    }
}
