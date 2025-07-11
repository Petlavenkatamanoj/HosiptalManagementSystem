package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DoctorCon {
     private static Connection con=null;

        static {
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                 con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Doctor","root","Manoj2782003");
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        public static Connection getCon(){
            return con;
        }

}
