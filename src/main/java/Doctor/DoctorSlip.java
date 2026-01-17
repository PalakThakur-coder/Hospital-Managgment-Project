package Doctor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.Connect;

public class DoctorSlip extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        String patientID = req.getParameter("pid");

        try {
            
            Connect cn = new Connect();
            cn.DataConnection();
            PreparedStatement updatePS = cn.c.prepareStatement("UPDATE offlineslip SET checkup_status = ? WHERE id = ?");
            updatePS.setString(1, "Completed"); 
            updatePS.setString(2, patientID);
            int updateResult = updatePS.executeUpdate();

          
            String sid = req.getParameter("sid");
            String id = req.getParameter("pid");
            String name = req.getParameter("name");
            String age = req.getParameter("age");
            String gender = req.getParameter("gender");
            String prescription = req.getParameter("prescription");
            String doctor = req.getParameter("doctor");
            String[] selectedTests = req.getParameterValues("tests");
            String otherTestValue = req.getParameter("otherTestValue");
            String date = req.getParameter("date");
            String selectedTestsString = "";

          
            if (otherTestValue != null && !otherTestValue.isEmpty()) {
                selectedTestsString += otherTestValue;

                if (selectedTests != null && selectedTests.length > 0) {
                    selectedTestsString += ", " + String.join(", ", selectedTests);
                }
            } else if (selectedTests != null && selectedTests.length > 0) {
                selectedTestsString = String.join(", ", selectedTests);
            }

           
            PreparedStatement ps = cn.c.prepareStatement("insert into doctorslip values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, sid);
            ps.setString(2, id);
            ps.setString(3, name);
            ps.setString(4, age);
            ps.setString(5, gender);
            ps.setString(6, prescription);
            ps.setString(7, selectedTestsString);
            ps.setString(8, doctor);
            ps.setString(9, date);

            int i = ps.executeUpdate();
            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Data Added Successfully..!');");
                pw.println("window.location.href = \"Doctor/DoctorHome.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Failed !!!!,try Again Later!');");
                pw.println("window.location.href = \"Doctor/PatientDetail.jsp\";");
                pw.println("</script>");
            }
        } catch (SQLException ex) {
            // Handle SQLException
        }
    }
}
