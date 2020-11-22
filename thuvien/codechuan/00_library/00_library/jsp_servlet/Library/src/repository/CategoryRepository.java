package repository;

import model.Category;

import java.util.Map;

public interface CategoryRepository {
    Map<Integer, String> selectAllCategory();
}
