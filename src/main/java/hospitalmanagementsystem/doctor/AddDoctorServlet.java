package hospitalmanagementsystem.doctor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddDoctorServlet")
public class AddDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String email = request.getParameter("email");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String qualification = request.getParameter("qualification");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "yourpassword");

            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO doctoremp (name, gender, phone, city, email, age, address, qualification, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );

            pst.setString(1, name);
            pst.setString(2, gender);
            pst.setString(3, phone);
            pst.setString(4, city);
            pst.setString(5, email);
            pst.setInt(6, Integer.parseInt(age));
            pst.setString(7, address);
            pst.setString(8, qualification);
            pst.setString(9, password);

            pst.executeUpdate();
            response.sendRedirect("managementdoctor.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
