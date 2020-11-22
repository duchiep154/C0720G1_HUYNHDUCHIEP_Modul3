package service.category;

import repository.category.CategoryRepository;
import repository.category.CategoryRepositoryImpl;

import java.util.Map;

public class CategoryServiceImpl implements CategoryService {
    CategoryRepository categoryRepository = new CategoryRepositoryImpl();

    @Override
    public Map<Integer, String> selectAllCategory() {
        return categoryRepository.selectAllCategory();
    }
}
