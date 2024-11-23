package service;

import dao.RentDAO;
import dto.RentDateRangeDTO;
import dto.UserRentDTO;

import java.util.ArrayList;

public class RentService {
    private RentDAO dao = new RentDAO();

    public ArrayList<RentDateRangeDTO> getUnavailableDatesToRent(String boatUuid) {
        ArrayList<RentDateRangeDTO> unavailableDates = this.dao.findUnavailableDates(boatUuid);

        return unavailableDates;
    }

    public boolean registerRent(RentDateRangeDTO dto, String description, int userId, String boatUuid) {
        return this.dao.create(dto, description, userId, boatUuid);
    }

    public ArrayList<UserRentDTO> getUserRents(int userId) {
        return this.dao.findByUserId(userId);
    }
}
