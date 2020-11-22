package repository.category;

import model.Category;

import java.util.Map;

public interface CategoryRepository {
    Map<Integer, String> selectAllCategory();
}
