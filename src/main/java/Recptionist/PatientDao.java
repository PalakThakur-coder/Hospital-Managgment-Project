package Recptionist;

import connect.Connect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PatientDao {
    private Connect cn;

    public PatientDao() {
        cn = new Connect();
        cn.DataConnection();
    }

    // Method to generate patient ID
    public String generatePatientID () throws SQLException{
        String id = "";
        try {
            PreparedStatement ps = cn.c.prepareStatement("SELECT MAX(id) FROM patienttable");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String maxId = rs.getString(1);
                if (maxId == null) {
                    id = "p1001";
                } else {
                    int n = Integer.parseInt(maxId.substring(1)) + 1;
                    id = "p" + n;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    // Method to check if a patient with the same name and phone number already exists
    public boolean isPatientExist(String name, String mobileNo) {
        try {
            PreparedStatement ps = cn.c.prepareStatement("SELECT id FROM patienttable WHERE name = ? AND mobileno = ?");
            ps.setString(1, name);
            ps.setString(2, mobileNo);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Returns true if a patient with the same name and phone number already exists
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to add a new patient to the database
    public boolean addPatient(String id, String name, String gender, String fatherName, String grandfatherName,
                              String mobileNo, String email, String houseNo, String street, String city, String state,
                              String date, String idName, String idNo, String age, String description, String idNameInput ,String patienttype) {
        try {
            PreparedStatement ps = cn.c.prepareStatement("INSERT INTO patienttable (id, name, gender, fathername, " +
                    "grandfathername, mobileno, email, houseno, street, city, state, date, idname, idno, age, description,patienttype) " +
                    "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, gender);
            ps.setString(4, fatherName);
            ps.setString(5, grandfatherName);
            ps.setString(6, mobileNo);
            ps.setString(7, email);
            ps.setString(8, houseNo);
            ps.setString(9, street);
            ps.setString(10, city);
            ps.setString(11, state);
            ps.setString(12, date);
            if ("Other".equals(idName)) {
                ps.setString(13, idNameInput);
            } else {
                ps.setString(13, idName);
            }
            ps.setString(14, idNo);
            ps.setString(15, age);
            ps.setString(16, description);
            ps.setString(17, patienttype);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
