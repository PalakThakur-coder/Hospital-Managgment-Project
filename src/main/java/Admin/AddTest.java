package Admin;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;


import javax.servlet.http.*;

import connect.Connect;

import javax.servlet.RequestDispatcher;
public class AddTest extends HttpServlet {

    
	int i = 0;
    PreparedStatement ps;
     
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
    	Connect cn= new Connect ();
		cn.DataConnection();
        PrintWriter pw = response.getWriter();
        try {
			ps = cn.c.prepareStatement("insert into tests (test_name)values(?)");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
            String test_name = request.getParameter("testname");
           
          
            
            try { 
            ps.setString(1, test_name);
          
            i = ps.executeUpdate();
            if (i > 0) {
                
            	 pw.println("<script type=\"text/javascript\">");
            
                 pw.println("window.location.href = \"Admin/ViewTest.jsp\";");
                 pw.println("</script>");
            } 
            else {
            	 pw.println("<script type=\"text/javascript\">");
                
                 pw.println("window.location.href = \"Admin/AdddTest.jsp\";");
                 pw.println("</script>");
            }

        } catch (SQLException e) {
              System.out.println(e); 
        }

    }

}
