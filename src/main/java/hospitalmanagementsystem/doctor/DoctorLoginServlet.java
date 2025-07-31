package hospitalmanagementsystem.doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import DB.DoctorCon; // Adjust based on your DB connection class
import java.sql.*;

@WebServlet("/DoctorLoginServlet")
public class DoctorLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");

        String email = request.getParameter("email");


        try (Connection conn = DoctorCon.getCon()) {
            String sql = "SELECT * FROM doctoremp WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // login successful
                HttpSession session = request.getSession();
                session.setAttribute("doctorName", rs.getString("name"));
                response.sendRedirect("doctor/dashboard.jsp");
            } else {
                // login failed
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("doctorLogin.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("DB error");
        }

    }
}
