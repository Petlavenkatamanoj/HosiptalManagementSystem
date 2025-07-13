package hospitalmanagementsystem.doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/doctor")
public class DoctorServlet extends HttpServlet {
    private DoctorDAO obj=null;
    public void init(){
        obj=new DoctorDAO();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           int k=obj.addData(request);
        PrintWriter out= response.getWriter();
           if(k>0){
               out.println("Added Successfully");
           }else{
               out.println("Unsuccessfully");
           }
    }

}
