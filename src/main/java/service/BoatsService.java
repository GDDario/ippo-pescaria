package service;

import dao.BoatDAO;
import dto.FindBoatsByFilterDTO;
import model.Boat;

import java.util.ArrayList;

public class BoatsService {
    private BoatDAO dao = new BoatDAO();

    public ArrayList<Boat> getHotBoats() {
        ArrayList<Boat> boatsList = this.dao.findHotBoats();

        return boatsList;
    }

    public ArrayList<Boat> getBoatsByFilters(FindBoatsByFilterDTO dto) {
        ArrayList<Boat> boatsList = this.dao.findByFilters(dto);

        return boatsList;
    }
}
