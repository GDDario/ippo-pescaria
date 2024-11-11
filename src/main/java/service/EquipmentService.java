package service;

import dao.EquipmentDAO;
import model.Equipment;

import java.util.ArrayList;

public class EquipmentService {
    private final EquipmentDAO dao = new EquipmentDAO();

    public ArrayList<Equipment> getAllEquipmentsForFilter() {
        ArrayList<Equipment> equipments = this.dao.findAllEquipmentsForFilter();

        return equipments;
    }
}
