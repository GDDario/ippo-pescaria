package service;

import dao.CategoryDAO;
import model.Category;

import java.util.ArrayList;

public class CategoryService {
    private CategoryDAO dao = new CategoryDAO();

    public ArrayList<Category> getCategoriesForFilter() {
        ArrayList<Category> categories = this.dao.findAllCategiriesForFilter();

        return categories;
    }
}
