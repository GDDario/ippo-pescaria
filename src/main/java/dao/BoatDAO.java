package dao;

import model.Boat;
import model.Category;
import service.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

public class BoatDAO {
    public ArrayList<Boat> findHotBoats() {
        ArrayList<Boat> boats = new ArrayList<>();

        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                        SELECT
                        	boats.uuid, boats.name, boats.length, boats.capacity, 
                        	boats.engine_power, boats.price_per_day, 
                        	categories.name AS category_name
                        FROM
                        	boats
                        	INNER JOIN categories ON categories.id = boats.category_id
                        ORDER BY
                        	RANDOM()
                        LIMIT 8;
                        """;

                ps = connection.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Category category = new Category(
                            rs.getString("category_name")
                    );

                    Boat boat = new Boat(
                            UUID.fromString(rs.getString("uuid")),
                            rs.getString("name"),
                            rs.getDouble("length"),
                            rs.getInt("capacity"),
                            rs.getDouble("engine_power"),
                            rs.getDouble("price_per_day"),
                            category
                    );

                    boats.add(boat);
                }
            }
        } catch (SQLException error) {
            System.out.println("Exception on verifying if email was registered: " + error);
        }

        System.out.println("Boats " + boats.size());

        return boats;
    }
}
