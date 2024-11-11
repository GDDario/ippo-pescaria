package dao;

import model.Boat;
import model.Category;
import model.Equipment;
import service.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

public class EquipmentDAO {
    public ArrayList<Equipment> findAllEquipmentsForFilter() {
        ArrayList<Equipment> equipments = new ArrayList<>();

        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                        SELECT
                        	uuid, name
                        FROM
                        	equipments
                        ORDER BY
                        	name;
                        """;

                ps = connection.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Equipment equipment = new Equipment(
                            UUID.fromString(rs.getString("uuid")),
                            rs.getString("name")
                    );

                    equipments.add(equipment);
                }
            }
        } catch (SQLException error) {
            System.out.println("Exception on getting equipments for filter: " + error);
        }

        return equipments;
    }
}
