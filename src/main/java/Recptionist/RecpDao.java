package Recptionist;

import java.sql.*;
import java.sql.SQLException;


import connect.Connect;

public class RecpDao {

    Connect cn = new Connect();

    public RecpDao() {
        cn.DataConnection();
    }

    public boolean addRecp(String id, String name, String age, String gender, String qualification,
            String responsibility, String mobileNo, String email, String houseNo, String street, String city,
            String state, String date, String idName, String idNo, String description, String idNameInput) {
        try {
            PreparedStatement ps = cn.c.prepareStatement(
                    "INSERT INTO recptable (id, name, age, gender, qualification, responsibility, mobileNo, email, houseNo, street, city, state, date, idName, idNo, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, age);
            ps.setString(4, gender);
            ps.setString(5, qualification);
            ps.setString(6, responsibility);
            ps.setString(7, mobileNo);
            ps.setString(8, email);
            ps.setString(9, houseNo);
            ps.setString(10, street);
            ps.setString(11, city);
            ps.setString(12, state);
            ps.setString(13, date);
            if ("Other".equals(idName)) {
                ps.setString(14, idNameInput);
            } else {
                ps.setString(14, idName);
            }
            ps.setString(15, idNo);
            ps.setString(16, description);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

  
}
