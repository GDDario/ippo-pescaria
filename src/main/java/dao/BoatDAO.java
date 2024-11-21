package dao;

import dto.BoatsFiltersDTO;
import dto.FindBoatsByFilterDTO;
import model.Boat;
import model.Category;
import service.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
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
                        	boats.engine_power, boats.price_per_day, boats.pictures,
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
                    boat.setPictures(convertPicturesArrayToArrayList(rs.getArray("pictures")));

                    boats.add(boat);
                }
            }
        } catch (SQLException error) {
            System.out.println("Exception on getting hot boats: " + error);
        }

        return boats;
    }

    public BoatsFiltersDTO findFilters() {
        BoatsFiltersDTO dto = new BoatsFiltersDTO();

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
                        	MIN(EXTRACT(YEAR FROM boats.manufacture_date)) as manufacturer_start_date,
                        	MAX(EXTRACT(YEAR FROM boats.manufacture_date)) as manufacturer_end_date
                        FROM
                        	boats;
                        """;

                ps = connection.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();

                rs.next();

                dto.setMaxBoatLength(rs.getDouble("max_boat_length"));
                dto.setMaxPricePerDay(rs.getDouble("max_price_per_day"));
                dto.setMaxCapacity(rs.getInt("max_capacity"));
                dto.setMaxEnginePower(rs.getDouble("max_engine_power"));
                dto.setMaxCabinsNumber(rs.getInt("max_cabins_number"));
                dto.setManufacturerStartDate(rs.getInt("manufacturer_start_date"));
                dto.setManufacturerEndDate(rs.getInt("manufacturer_end_date"));
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
                StringBuilder sqlBuilder = new StringBuilder("""
                        SELECT 
                            boats.uuid, boats.name, boats.length, boats.capacity, 
                            boats.engine_power, boats.price_per_day, boats.pictures,
                            categories.name AS category_name
                        FROM boats
                        JOIN categories ON categories.id = boats.category_id
                        WHERE
                            boats.name LIKE ?
                            AND length >= ? AND length <= ?
                            AND price_per_day >= ? AND price_per_day <= ?
                            AND capacity >= ? AND capacity <= ?
                            AND engine_power >= ? AND engine_power <= ?
                            AND cabins_number >= ? AND cabins_number <= ?
                            AND EXTRACT(YEAR FROM manufacture_date) >= ? AND EXTRACT(YEAR FROM manufacture_date) <= ?
                        """);

                if (!dto.getCategoryUuids().isEmpty()) {
                    sqlBuilder.append(" AND boats.category_id IN (SELECT id FROM categories WHERE uuid = ANY (?)) ");
                }

                if (!dto.getEquipmentsArray().isEmpty()) {
                    sqlBuilder.append("""
                                AND NOT EXISTS (
                                    SELECT 1
                                    FROM unnest(string_to_array(?, ',')) AS required_equipment
                                    WHERE lower(trim(required_equipment)) NOT IN (
                                        SELECT lower(trim(equipment))
                                        FROM unnest(string_to_array(boats.equipments, ',')) AS equipment
                                    )
                                )
                            """);
                }

                String sql = sqlBuilder.toString();

                PreparedStatement pstmt = connection.prepareStatement(sql);

                pstmt.setString(1, dto.getBoatName() + "%");
                pstmt.setDouble(2, dto.getMinLength());
                pstmt.setDouble(3, dto.getMaxLength());
                pstmt.setDouble(4, dto.getMinPricePerDay());
                pstmt.setDouble(5, dto.getMaxPricePerDay());
                pstmt.setInt(6, dto.getMinCapacity());
                pstmt.setInt(7, dto.getMaxCapacity());
                pstmt.setDouble(8, dto.getMinEnginePower());
                pstmt.setDouble(9, dto.getMaxEnginePower());
                pstmt.setInt(10, dto.getMinCabinsNumber());
                pstmt.setInt(11, dto.getMaxCabinsNumber());
                pstmt.setInt(12, dto.getManufacturerStartDate());
                pstmt.setInt(13, dto.getManufacturerEndDate());

                int paramIndex = 14;
                if (!dto.getCategoryUuids().isEmpty()) {
                    Array categoryUuidsArray = connection.createArrayOf("UUID", dto.getCategoryUuids().toArray(new UUID[0]));
                    pstmt.setArray(paramIndex++, categoryUuidsArray);
                }

                if (!dto.getEquipmentsArray().isEmpty()) {
                    String equipments = String.join(",", dto.getEquipmentsArray());
                    pstmt.setString(paramIndex++, equipments);
                }

                ResultSet rs = pstmt.executeQuery();
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
                    boat.setPictures(convertPicturesArrayToArrayList(rs.getArray("pictures")));

                    boats.add(boat);
                }

            }
        } catch (SQLException error) {
            System.out.println("Exception on getting filtered boats: " + error);
        }

        return boats;
    }

    public Boat findByUuid(String uuid) {
        Boat boat = new Boat();

        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                String sql = """
                            SELECT
                                boats.*,
                                categories.uuid as category_uuid,
                                categories.name as category_name
                            FROM
                                boats
                                INNER JOIN categories ON categories.id = boats.category_id
                            WHERE
                                boats.uuid = ?
                        """;

                PreparedStatement pstmt = connection.prepareStatement(sql);

                pstmt.setObject(1, UUID.fromString(uuid));

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    Category category = new Category(
                            rs.getString("category_name")
                    );

                    boat = new Boat(
                            UUID.fromString(rs.getString("uuid")),
                            rs.getString("name"),
                            rs.getDouble("length"),
                            rs.getInt("capacity"),
                            rs.getDouble("engine_power"),
                            rs.getDouble("price_per_day"),
                            category
                    );
                    boat.setEquipments(rs.getString("equipments"));
                    boat.setManufactureDate(rs.getDate("manufacture_date").toLocalDate());
                    boat.setCabinsNumber(rs.getInt("cabins_number"));
                    boat.setPictures(convertPicturesArrayToArrayList(rs.getArray("pictures")));

                    boat.setDescription(rs.getString("description"));
                }

            }
        } catch (SQLException error) {
            System.out.println("Exception on getting filtered boats: " + error);
        }

        return boat;
    }

    private ArrayList<String> convertPicturesArrayToArrayList(Array sqlArray) throws SQLException {
        String[] javaArray = (String[]) sqlArray.getArray();

        return new ArrayList<>(Arrays.asList(javaArray));
    }
}
