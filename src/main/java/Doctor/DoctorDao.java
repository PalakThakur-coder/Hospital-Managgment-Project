package Doctor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import connect.Connect;


public class DoctorDao{

	Connect cn=new Connect();
  

    public DoctorDao() {
        
        cn.DataConnection();
    }

    // Method to add a new doctor to the database
    public boolean addDoctor(String id, String name, String age, String gender, String qualification,
            String specialisation, String mobileno, String email, String houseno, String street, String city,
            String state, String date, String idName, String idno, String description, String idNameInput) {
        try {
            PreparedStatement ps = cn.c.prepareStatement(
                    "INSERT INTO doctortable (id, name, age, gender, qualification, specialisation, mobileNo, email, houseNo, street, city, state, date, idName, idNo, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, age);
            ps.setString(4, gender);
            ps.setString(5, qualification);
            ps.setString(6, specialisation);
            ps.setString(7, mobileno);
            ps.setString(8, email);
            ps.setString(9, houseno);
            ps.setString(10, street);
            ps.setString(11, city);
            ps.setString(12, state);
            ps.setString(13, date);
            if ("Other".equals(idName)) {
                ps.setString(14, idNameInput);
            } else {
                ps.setString(14, idName);
            }
            ps.setString(15, idno);
            ps.setString(16, description);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean DoctorExist(String name, String email) {
        try {
            String query = "SELECT * FROM doctortable WHERE name = ? AND email = ?";
            PreparedStatement ps = cn.c.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Return true if a doctor with the provided name and email exists
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to retrieve all doctors from the database
    public List<Doctor> getAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        try {
            PreparedStatement ps = cn.c.prepareStatement("SELECT * FROM doctortable");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Doctor doctor = new Doctor();
                
                doctor.setId(rs.getString("id"));
                doctor.setName(rs.getString("name"));
                doctor.setAge(rs.getString("age"));
                doctor.setGender(rs.getString("gender"));
                doctor.setQualification(rs.getString("qualification"));
                doctor.setSpecialisation(rs.getString("specialisation"));
                doctor.setMobileNo(rs.getString("mobileNo"));
                doctor.setEmail(rs.getString("email"));
                doctor.setHouseNo(rs.getString("houseNo"));
                doctor.setStreet(rs.getString("street"));
                doctor.setCity(rs.getString("city"));
                doctor.setState(rs.getString("state"));
                doctor.setDate(rs.getString("date"));
                doctor.setIdName(rs.getString("idName"));
                doctor.setIdNo(rs.getString("idNo"));
                doctor.setDescription(rs.getString("description"));
                doctors.add(doctor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctors;
    }

	

	

}
