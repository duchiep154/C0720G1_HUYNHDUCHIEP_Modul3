package bo;

import dao.CategoryDAO;
import dao.CategoryDAOImpl;
import model.Category;

import java.util.List;

public class CategoryBOImpl implements CategoryBO {
    CategoryDAO categoryDAO=new CategoryDAOImpl();
    @Override
    public List<Category> findAllCategory() {
        return categoryDAO.findAllCategory();
    }
}
