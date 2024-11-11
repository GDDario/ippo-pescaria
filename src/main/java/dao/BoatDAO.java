package dao;

import dto.FindBoatsByFilterDTO;
import dto.FindFiltersDTO;
import model.Boat;
import model.Category;
import service.DatabaseConnection;

import java.sql.*;
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
            System.out.println("Exception on getting hot boats: " + error);
        }

        return boats;
    }

    public FindFiltersDTO findFilters() {
        FindFiltersDTO dto = new FindFiltersDTO();

        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                        SELECT
                        	MAX(boats.length) as max_boat_length,
                        	MAX(boats.price_per_day) as max_price_per_day,
                        	MAX(boats.capacity) as max_capacity,
                        	MAX(boats.engine_power) as max_engine_power,
                        	MAX(boats.cabins_number) as max_cabins_number,
                        	MAX(boats.manufacture_date) as manufacturer_end_date
                        FROM
                        	boats;
                        """;

                ps = connection.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();

                rs.next();

                dto.setMaxBoatLength(rs.getDouble("max_boat_length"));
                dto.setMaxPricePerDay(rs.getDouble("max_price_per_day"));
                dto.setMaxCapacity(rs.getInt("max_capacity"));
                dto.setMaxEnginePopwer(rs.getDouble("max_engine_power"));
                dto.setMaxCabinsNumber(rs.getInt("max_cabins_number"));
                dto.setManufacturerEndDate(rs.getDate("manufacturer_end_date").toLocalDate());
            }
        } catch (SQLException error) {
            System.out.println("Exception on getting hot boats: " + error);
        }

        return dto;
    }

    public ArrayList<Boat> findByFilters(FindBoatsByFilterDTO dto) {
        ArrayList<Boat> boats = new ArrayList<>();

        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                        SELECT boats.*, categories.uuid
                            FROM boats
                            JOIN categories ON categories.id = boats.category_id
                        WHERE
                            categories.uuid = ANY (?)
                            AND string_to_array(equipments, ', ') && ?
                            AND length > ? AND length < ?
                            AND price_per_day > ? AND price_per_day < ?
                            AND capacity > ? AND capacity < ?
                            AND engine_power > ? AND engine_power < ?
                            AND cabins_number >= ? AND cabins_number < ?
                            AND manufacture_date BETWEEN ? AND ?;
                        """;

                     PreparedStatement pstmt = connection.prepareStatement(sql);

                    Array uuidArray = connection.createArrayOf("UUID", dto.getCategoryUuids().toArray());
                    pstmt.setArray(1, uuidArray);

                    Array equipments = connection.createArrayOf("TEXT", dto.getEquipmentsArray().toArray());
                    pstmt.setArray(2, equipments);

                    pstmt.setDouble(3, dto.getMinLength());
                    pstmt.setDouble(4, dto.getMaxLength());
                    pstmt.setDouble(5, dto.getMinPricePerDay());
                    pstmt.setDouble(6, dto.getMaxPricePerDay());
                    pstmt.setInt(7, dto.getMinCapacity());
                    pstmt.setInt(8, dto.getMaxCapacity());
                    pstmt.setDouble(9, dto.getMinEnginePower());
                    pstmt.setDouble(10, dto.getMaxEnginePower());
                    pstmt.setInt(11, dto.getMinCabinsNumber());
                    pstmt.setInt(12, dto.getMaxCabinsNumber());

                    pstmt.setDate(13, Date.valueOf(dto.getManufacturerStartDate()));
                    pstmt.setDate(14, Date.valueOf(dto.getManufacturerEndDate()));

                    ResultSet rs = pstmt.executeQuery();
                    while (rs.next()) {
                        System.out.println("Boat ID: " + rs.getInt("id"));
                        System.out.println("Category UUID: " + rs.getString("uuid"));
                    }

            }
        } catch (SQLException error) {
            System.out.println("Exception on getting boats boats: " + error);
        }

        return boats;


    }
}
