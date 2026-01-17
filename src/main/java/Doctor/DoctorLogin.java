package Doctor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.Connect;

public class DoctorLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String enteredName = request.getParameter("doctorName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            DoctorDao doctorDao = new DoctorDao();
            if (doctorDao.DoctorExist(enteredName, username)) {
              
                HttpSession session = request.getSession();
                session.setAttribute("loggedInDoctor", enteredName);
                response.sendRedirect("Doctor/DoctorHome.jsp");
            } else {
            	out.println("<script type=\"text/javascript\">");
                out.println("alert('Username or Password is Incorrect..!');");
                out.println("window.location.href = \"Doctor/DoctorLogin.jsp\";");
                out.println("</script>");
            }

           
        } catch (Exception e) {
            out.println(e);
        }
    }
}
