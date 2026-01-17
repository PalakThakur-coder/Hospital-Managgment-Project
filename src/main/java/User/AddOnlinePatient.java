package User;
import java.io.*;


import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import connect.Connect;



public class AddOnlinePatient extends HttpServlet {
    PreparedStatement ps;
    Connect cn;
    ResultSet rs;
    String id = "";

    public void id() throws SQLException {
        ps = cn.c.prepareStatement("select MAX(id) from patienttable");
        rs = ps.executeQuery();
        while (rs.next()) {
            if (rs.getString("MAX(id)") == null) {
                id = "p" + 1001;
            } else {
                id = rs.getString(1);

                int n = Integer.parseInt(id.substring(1, 5));
                n++;
                id = "p" + String.valueOf(n);
            }
        }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        cn = new Connect();
        cn.DataConnection();

        try {
            id();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }

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
        
       
        try {
            ps = cn.c.prepareStatement("select id from Patienttable where name = ? and mobileno = ?");
            ps.setString(1, name);
            ps.setString(2, mobileno);

            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
            	res.setContentType("text/html");
            	
                PrintWriter slip = res.getWriter();
                slip.println("<p style='text-align: center;font-size: 30px;color:red'>Data with the same name and phone number already exists</p>");
              RequestDispatcher rd = req.getRequestDispatcher("AddPatient.jsp");
              rd.include(req, res);
            } else {
                try {
                    ps = cn.c.prepareStatement("insert into Patienttable (id, name, gender, fathername, " +
                            "grandfathername, mobileno, email, houseno, street, city, state, date, idname, idno, age, description) " +
                            "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

                    ps.setString(1, id);
                    ps.setString(2, name);
                    ps.setString(3, gender);
        			ps.setString(4, fathername);
        			ps.setString(5, grandfathername);
        			ps.setString(6, mobileno);
        			ps.setString(7, email);
        			ps.setString(8, houseno);
        			ps.setString(9, street);
        			ps.setString(10, city);
        			ps.setString(11, state);
        			ps.setString(12, date);

        			if ("Other".equals(idname)) {

        				ps.setString(13, idname_input);
        			} else {

        				ps.setString(13, idname);
        			}
        			ps.setString(14, idno);
        			ps.setString(15, age);
        			ps.setString(16, description);
                    

                    int i = ps.executeUpdate();

                    PrintWriter out = res.getWriter();

                    if (i > 0) {
                    	String createSlipURL = "OnlineSlip.jsp?id=" + id; 
                    	res.sendRedirect(createSlipURL);
                    } else {
                        out.println("Failed to insert record");
                    }
                } catch (SQLException e) {
                    System.out.println(e);
                }
            }
        } catch (Exception se) {
            System.out.println(se);
        }
    }
}


