package hospitalmanagementsystem.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.MessageDigest;

import DB.DoctorCon;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class AdminRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DoctorCon.getCon()) {
            // Check if username already exists
            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM admin WHERE username = ?");
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Username already exists
                response.sendRedirect("adminRegister.jsp?error=username_exists");
            } else {
                // Hash the password
                String hashedPassword = hashPassword(password);

                // Insert user
                PreparedStatement ps = con.prepareStatement("INSERT INTO admin (username, password) VALUES (?, ?)");
                ps.setString(1, username);
                ps.setString(2, hashedPassword);
                int rowsInserted = ps.executeUpdate();

                if (rowsInserted > 0) {
                    response.sendRedirect("adminLogin.jsp?msg=registered");
                } else {
                    response.sendRedirect("adminRegister.jsp?error=insert_failed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminRegister.jsp?error=exception");
        }
    }

    // Password hashing method
    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashBytes = md.digest(password.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte b : hashBytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}
