package Recptionist;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.Connect;


public class RecpLogin extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("pass");
        
            Connect cn= new Connect ();
    		cn.DataConnection();
    		
            String s = "select * from recp";
            Statement st = cn.c.createStatement();
            ResultSet rs = st.executeQuery(s);
            while (rs.next()) {
               String usernamedb = rs.getString(1);
               String passworddb= rs.getString(2);
              
            
            if (usernamedb.equals(username) && passworddb.equals(password)) {
        
        
               RequestDispatcher rd = request.getRequestDispatcher("Recp/RecpHome.jsp");
              rd.forward(request, response);
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Username or Password is Incorrect..!');");
                pw.println("window.location.href = \"Recp/RecpLogin.jsp\";");
                pw.println("</script>");
                //RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
                //rd.include(request, response);
            }
            }
        } catch (Exception e) {

        }

    }

}
