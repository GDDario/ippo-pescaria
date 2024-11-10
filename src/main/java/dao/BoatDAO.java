package dao;

import model.Boat;
import service.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoatDAO {
    public ArrayList<Boat> findHotBoats() {
        ArrayList<Boat> boats = new ArrayList<>();

        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                        SELECT
                        	name, uuid, length, engine_power, price_per_day
                        FROM
                        	boats
                        ORDER BY
                        	RANDOM()
                        LIMIT 10;
                        """;
            }
        } catch (SQLException error) {
            System.out.println("Exception on verifying if email was registered: " + error);
        }

        return boats;
    }
}
