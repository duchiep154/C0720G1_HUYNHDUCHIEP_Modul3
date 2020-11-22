package service;

import repository.CategoryRepository;
import repository.CategoryRepositoryImpl;

import java.util.Map;

public class CategoryServiceImpl implements CategoryService {
    CategoryRepository categoryRepository = new CategoryRepositoryImpl();

    @Override
    public Map<Integer, String> selectAllCategory() {
        return categoryRepository.selectAllCategory();
    }
}
