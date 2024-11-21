package dao;

import dto.LoginDTO;
import model.User;
import service.DatabaseConnection;
import util.PasswordUtil;
import vo.Email;

import java.sql.*;

public class UserDAO {
    public User createUser(User user) {
        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                    INSERT INTO "users" 
                        (name, email, password, birth_date) 
                    VALUES (?, ?, ?, ?)
                    RETURNING id, name, email, password, birth_date, created_at, updated_at, deleted_at
                    """;

                ps = connection.prepareStatement(sql);
                ps.setString(1, user.getName());
                ps.setString(2, user.getEmail().toString());
                ps.setString(3, user.getPassword());
                ps.setDate(4, Date.valueOf(user.getBirthDate()));

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // Mapeando o resultado para o modelo User
                    User createdUser = new User();
                    createdUser.setId(rs.getInt("id"));
                    createdUser.setName(rs.getString("name"));
                    createdUser.setEmail(new Email(rs.getString("email")));
                    createdUser.setBirthDate(rs.getDate("birth_date").toLocalDate());
                    createdUser.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                    createdUser.setUpdatedAt(rs.getTimestamp("updated_at") != null ? rs.getTimestamp("updated_at").toLocalDateTime() : null);
                    createdUser.setDeletedAt(rs.getTimestamp("deleted_at") != null ? rs.getTimestamp("deleted_at").toLocalDateTime() : null);

                    return createdUser;
                } else {
                    return null;
                }
            } else {
                return null;
            }
        } catch (SQLException erro) {
            System.out.println("Exceção causada na inserção: " + erro);
            return null;
        }
    }

    public User verifyCredentials(LoginDTO dto) {
        PasswordUtil passwordUtil = new PasswordUtil();
        User user = new User();

        try {
            Connection con = new DatabaseConnection().getConnection();

            if (con != null) {
                PreparedStatement ps;
                String sql = """
                            SELECT
                            	password, name, id
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
                        user.setName(rs.getString("name"));
                        user.setId(rs.getInt("id"));
                    }
                }

                return user;
            } else {
                return user;
            }
        } catch (SQLException error) {
            System.out.println("Exception on verifying credentials was registered: " + error);
            return user;
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
