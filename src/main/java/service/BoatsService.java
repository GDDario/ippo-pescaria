package service;

import dao.BoatDAO;
import model.Boat;

import java.util.ArrayList;

public class BoatsService {
    private BoatDAO dao = new BoatDAO();

    public ArrayList<Boat> getHotBoats() {
        ArrayList<Boat> boatsList = this.dao.findHotBoats();

        return boatsList;
    }
}
