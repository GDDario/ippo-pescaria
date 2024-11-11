package dao;

import model.Category;
import service.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

public class CategoryDAO {
    public ArrayList<Category> findAllCategiriesForFilter() {
        ArrayList<Category> categories = new ArrayList<>();

        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                        SELECT
                        	uuid, name
                        FROM
                        	categories
                        ORDER BY
                        	name;
                        """;

                ps = connection.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Category category = new Category(
                            UUID.fromString(rs.getString("uuid")),
                            rs.getString("name")
                    );

                    categories.add(category);
                }
            }
        } catch (SQLException error) {
            System.out.println("Exception on getting categories for filter: " + error);
        }

        return categories;
    }
}
