package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Doctor.Doctor;
import Doctor.DoctorDao;

public class AddDoctor extends HttpServlet {

    

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        String id = req.getParameter("id");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String qualification = req.getParameter("qualification");
		String specialisation = req.getParameter("specialist");
		String mobileno = req.getParameter("mobileno");
		String email = req.getParameter("email");
		String houseno = req.getParameter("houseno");
		String street = req.getParameter("street");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String date = req.getParameter("date");
		String idname = req.getParameter("idname");
		String idNameInput = req.getParameter("idname_input");
		String idno = req.getParameter("idno");
		String description = req.getParameter("description");

		// Create an instance of Doctor
		Doctor doctor = new Doctor();
		doctor.setId(id);
		doctor.setName(name);
		doctor.setAge(age);
		doctor.setGender(gender);
		doctor.setQualification(qualification);
		doctor.setSpecialisation(specialisation);
		doctor.setMobileNo(mobileno);
		doctor.setEmail(email);
		doctor.setHouseNo(houseno);
		doctor.setStreet(street);
		doctor.setCity(city);
		doctor.setState(state);
		doctor.setDate(date);
		doctor.setIdName(idname);
		doctor.setIdNo(idno);
		doctor.setDescription(description);

		// Create an instance of DoctorDao
		DoctorDao doctorDao = new DoctorDao();

		// Call addDoctor method of DoctorDao
		if (doctorDao.addDoctor(id, name, age, gender, qualification, specialisation, mobileno, email, houseno, street, city, state, date, idname, idno, description, idNameInput)) {
		    pw.println("<script type=\"text/javascript\">");
		    pw.println("alert('Data Added Successfully..!');");
		    pw.println("window.location.href = \"Admin/Dashboard.jsp\";");
		    pw.println("</script>");
		} else {
		    pw.println("<script type=\"text/javascript\">");
		    pw.println("alert('Failed to Add Data!');");
		    pw.println("window.location.href = \"Admin/addDoctor.jsp\";");
		    pw.println("</script>");
		}
    }
}
