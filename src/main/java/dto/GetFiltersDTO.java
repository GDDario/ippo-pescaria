package dto;

import model.Category;
import model.Equipment;

import java.util.ArrayList;

public class GetFiltersDTO {
    private BoatsFiltersDTO boatsFiltersDTO;
    private ArrayList<Category> categoriesList;
    private ArrayList<Equipment> equipmentsList;

    public GetFiltersDTO() {
    }

    public GetFiltersDTO(BoatsFiltersDTO boatsFiltersDTO, ArrayList<Category> categoriesList, ArrayList<Equipment> equipmentsList) {
        this.boatsFiltersDTO = boatsFiltersDTO;
        this.categoriesList = categoriesList;
        this.equipmentsList = equipmentsList;
    }

    public BoatsFiltersDTO getBoatsFiltersDTO() {
        return boatsFiltersDTO;
    }

    public void setBoatsFiltersDTO(BoatsFiltersDTO boatsFiltersDTO) {
        this.boatsFiltersDTO = boatsFiltersDTO;
    }

    public ArrayList<Category> getCategoriesList() {
        return categoriesList;
    }

    public void setCategoriesList(ArrayList<Category> categoriesList) {
        this.categoriesList = categoriesList;
    }

    public ArrayList<Equipment> getEquipmentsList() {
        return equipmentsList;
    }

    public void setEquipmentsList(ArrayList<Equipment> equipmentsList) {
        this.equipmentsList = equipmentsList;
    }
}
