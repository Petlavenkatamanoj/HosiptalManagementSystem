package hospitalmanagementsystem.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    private AdminDAO dao;

    public void init() {
        dao = new AdminDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (dao.login(username, password)) {
            HttpSession session = req.getSession();
            session.setAttribute("adminUser", username);
            res.sendRedirect("adminDashboard.jsp");
        } else {
            res.sendRedirect("adminLogin.jsp?error=invalid");
        }
    }
}
