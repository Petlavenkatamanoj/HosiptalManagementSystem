package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DoctorCon {
    public static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Doctor", // This must match your database name
                    "root",                                // MySQL username
                    "Manoj2782003"                         // MySQL password
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
