package hospitalmanagementsystem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // For demonstration. Replace with real DB check.
        boolean isAuthenticated = false;

        if ("admin".equals(role)) {
            if ("admin".equals(username) && "admin123".equals(password)) {
                isAuthenticated = true;
            }
        } else if ("doctor".equals(role)) {
            if ("doc".equals(username) && "doc123".equals(password)) {
                isAuthenticated = true;
            }
        } else if ("patient".equals(role)) {
            if ("pat".equals(username) && "pat123".equals(password)) {
                isAuthenticated = true;
            }
        }

        if (isAuthenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            if ("admin".equals(role)) {
                response.sendRedirect("adminDashboard.jsp");
            } else if ("doctor".equals(role)) {
                response.sendRedirect("doctorDashboard.jsp");
            } else if ("patient".equals(role)) {
                response.sendRedirect("patientDashboard.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid credentials or role.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
