package dao;

import dto.RentDateRangeDTO;
import service.DatabaseConnection;

import java.sql.*;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.UUID;

public class RentDAO {
    public ArrayList<RentDateRangeDTO> findUnavailableDates(String boatUuid) {
        ArrayList<RentDateRangeDTO> unavailableDates = new ArrayList<>();

        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                PreparedStatement ps;
                String sql = """
                        SELECT
                        	date_start, date_end
                        FROM
                        	rents
                        	INNER JOIN boats on rents.boat_id = boats.id
                        WHERE
                        	boats.uuid = ?;
                        """;

                ps = connection.prepareStatement(sql);
                ps.setObject(1, UUID.fromString(boatUuid));

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    RentDateRangeDTO dto = new RentDateRangeDTO(
                            rs.getDate("date_start").toLocalDate(),
                            rs.getDate("date_end").toLocalDate()
                    );

                    unavailableDates.add(dto);
                }
            }
        } catch (SQLException error) {
            System.out.println("Exception on getting unavailable dates: " + error);
        }

        return unavailableDates;
    }

    public boolean create(RentDateRangeDTO dto, String description, int userId, String boatUuid) {
        try {
            Connection connection = new DatabaseConnection().getConnection();

            if (connection != null) {
                String getPriceSql = "SELECT price_per_day FROM boats WHERE uuid = ?";
                PreparedStatement getPricePs = connection.prepareStatement(getPriceSql);
                getPricePs.setObject(1, UUID.fromString(boatUuid));
                ResultSet rs = getPricePs.executeQuery();

                if (rs.next()) {
                    double pricePerDay = rs.getDouble("price_per_day");

                    long daysDifference = ChronoUnit.DAYS.between(dto.getDateStart(), dto.getDateEnd()) + 1;

                    daysDifference = Math.max(daysDifference, 1);

                    double total = pricePerDay * daysDifference;

                    String insertSql = """
                        INSERT INTO "rents" 
                            (user_id, boat_id, user_description, date_start, date_end, total)
                        VALUES 
                            (?, (SELECT id FROM boats WHERE uuid = ?), ?, ?, ?, ?)
                        """;

                    PreparedStatement insertPs = connection.prepareStatement(insertSql);
                    insertPs.setInt(1, userId);
                    insertPs.setObject(2, UUID.fromString(boatUuid));
                    insertPs.setString(3, description);
                    insertPs.setDate(4, Date.valueOf(dto.getDateStart()));
                    insertPs.setDate(5, Date.valueOf(dto.getDateEnd()));
                    insertPs.setDouble(6, total);

                    return insertPs.executeUpdate() != 0;
                } else {
                    System.out.println("Barco não encontrado para o UUID fornecido.");
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
}
