package dao;

import dto.LoginDTO;
import model.User;
import service.DatabaseConnection;
import util.PasswordUtil;

import java.sql.*;

public class UserDAO {
    public boolean createUser(User user) {
        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                        INSERT INTO "users" 
                             (name, email, password, birth_date) 
                        VALUES (?, ?, ?, ?)
                        """;

                ps = connection.prepareStatement(sql);
                ps.setString(1, user.getName());
                ps.setString(2, user.getEmail().toString());
                ps.setString(3, user.getPassword());
                ps.setDate(4, Date.valueOf(user.getBirthDate()));

                if (ps.executeUpdate() != 0) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException erro) {
            System.out.println("Exceção causada na inserção: " + erro);
            return false;
        }
    }

    public String verifyCredentials(LoginDTO dto) {
        PasswordUtil passwordUtil = new PasswordUtil();
        String name = "";

        try {
            Connection con = new DatabaseConnection().getConnection();

            if (con != null) {
                PreparedStatement ps;
                String sql = """
                            SELECT
                            	password, name
                            FROM
                            	"users"
                            WHERE
                                email = ?
                            LIMIT
                            	1;
                        """;
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getEmail().toString());

                ResultSet rs = ps.executeQuery();
                String passwordHash = "";

                while (rs.next()) {
                    passwordHash = rs.getString("password");

                    if (passwordUtil.verifyPassword(dto.getPassword(), passwordHash)) {
                        name = rs.getString("name");
                    }
                }

                return name;
            } else {
                return name;
            }
        } catch (SQLException error) {
            System.out.println("Exception on verifying if email was registered: " + error);
            return name;
        }
    }

    public boolean emailWasRegistered(String email) {
        try {
            Connection con = new DatabaseConnection().getConnection();

            if (con != null) {
                PreparedStatement ps;
                String sql = """
                            SELECT
                            	email
                            FROM
                            	"users"
                            WHERE
                                email = ?
                            LIMIT
                            	1;
                        """;
                ps = con.prepareStatement(sql);
                ps.setString(1, email);

                ResultSet rs = ps.executeQuery();

                return rs.next();
            } else {
                return false;
            }
        } catch (SQLException error) {
            System.out.println("Exception on verifying if email was registered: " + error);
            return false;
        }
    }
}
