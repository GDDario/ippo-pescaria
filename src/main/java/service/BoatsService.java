package service;

import dao.BoatDAO;
import dao.CategoryDAO;
import dao.EquipmentDAO;
import dto.FindBoatsByFilterDTO;
import dto.BoatsFiltersDTO;
import dto.GetFiltersDTO;
import model.Boat;
import model.Category;
import model.Equipment;

import java.util.ArrayList;

public class BoatsService {
    private BoatDAO dao = new BoatDAO();
    private CategoryDAO categoryDAO = new CategoryDAO();
    private EquipmentDAO equipmentDAO = new EquipmentDAO();

    public ArrayList<Boat> getHotBoats() {
        ArrayList<Boat> boatsList = this.dao.findHotBoats();

        return boatsList;
    }

    public GetFiltersDTO getFilters() {
        BoatsFiltersDTO filterDto = this.dao.findFilters();
        ArrayList<Category> categoriesList = this.categoryDAO.findAllCategiriesForFilter();
        ArrayList<Equipment> equipmentsList = this.equipmentDAO.findAllEquipmentsForFilter();

        GetFiltersDTO dto = new GetFiltersDTO(
                filterDto,
                categoriesList,
                equipmentsList
        );

        return dto;
    }

    public ArrayList<Boat> getBoatsByFilters(FindBoatsByFilterDTO dto) {
        ArrayList<Boat> boatsList = this.dao.findByFilters(dto);

        return boatsList;
    }


    public Boat getBoatByUuid(String uuid) {
        Boat boat = this.dao.findByUuid(uuid);

        return boat;
    }
}
