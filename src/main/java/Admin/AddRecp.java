package Admin;
import Recptionist.RecpDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class AddRecp extends HttpServlet {
	

	   
	    public void doPost(HttpServletRequest req, HttpServletResponse res)
	            throws ServletException, IOException {
	        PrintWriter pw = res.getWriter();
	        String id = req.getParameter("id");
			String name = req.getParameter("name");
			String age= req.getParameter("age");
			String gender= req.getParameter("gender");
			String qualification = req.getParameter("qualification");
			String responsibility = req.getParameter("responsibility");
			String mobileno= req.getParameter("mobileno");
			String email= req.getParameter("email");
			String houseno= req.getParameter("houseno");
			String street= req.getParameter("street");
			String city= req.getParameter("city");
			String state= req.getParameter("state");
			String date= req.getParameter("date");
			String idname= req.getParameter("idname");
			String idname_input= req.getParameter("idname_input");
			String idno=req.getParameter("idno");
			String description =req.getParameter("description");
			
			 RecpDao recpDao = new RecpDao();
			// Call the addRecp method of RecpDao
			if (recpDao.addRecp(id, name, age, gender, qualification, responsibility, mobileno, email, houseno, street, city, state, date, idname, idno, description, idname_input)) {
			    pw.println("<script type=\"text/javascript\">");
			    pw.println("alert('Representator Added Successfully..!');");
			    pw.println("window.location.href = \"Admin/Dashboard.jsp\";");
			    pw.println("</script>");
			} else {
			    pw.println("<script type=\"text/javascript\">");
			    pw.println("alert('Failed to Add Representator!');");
			    pw.println("window.location.href = \"Admin/addRecp.jsp\";");
			    pw.println("</script>");
			}
	    }
	}