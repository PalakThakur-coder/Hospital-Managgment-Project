package Recptionist;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddPatient extends HttpServlet {
    PatientDao patientDao;
    
    public void init() throws ServletException {
        patientDao = new PatientDao();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String id = patientDao.generatePatientID();
            String name = req.getParameter("name");
            String gender = req.getParameter("gender");
            String fathername = req.getParameter("fathername");
            String grandfathername = req.getParameter("grandfathername");
            String mobileno = req.getParameter("mobileno");
            String email = req.getParameter("email");
            String houseno = req.getParameter("houseno");
            String street = req.getParameter("street");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String date = req.getParameter("date");
            String idname = req.getParameter("idname");
            String idname_input = req.getParameter("idname_input");
            String idno = req.getParameter("idno");
            String age = req.getParameter("age");
            String description = req.getParameter("description");
            String patienttype = req.getParameter("patienttype");


            // Check if a patient with the same name and phone number already exists
            if (patientDao.isPatientExist(name, mobileno)) {
                res.setContentType("text/html");
                PrintWriter slip = res.getWriter();
                slip.println("<p style='text-align: center;font-size: 30px;color:red'>Data with the same name and phone number already exists</p>");
               // RequestDispatcher rd = req.getRequestDispatcher("Recp/AddPatient.jsp");
               // rd.include(req, res);
            } else {
                // Add the new patient
                if (patientDao.addPatient(id, name, gender, fathername, grandfathername, mobileno, email, houseno, street, city, state, date, idname, idno, age, description, idname_input,patienttype)) {
                    String createSlipURL = "Slips/CreateSlip2.jsp?id=" + id;
                    res.sendRedirect(createSlipURL);
                    
                } else {
                    PrintWriter out = res.getWriter();
                    out.println("Failed to insert record");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
