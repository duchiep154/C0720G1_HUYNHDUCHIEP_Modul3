package repository;

import model.Category;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductRepository {
    List<Product> findAllProduct() throws SQLException;

    Product findByID(String id) throws SQLException;

    List<Product> findByName(String name);

    String save(Product product);

    String update(Product product);

    void delete(String id);

    List<Category> findAllCategory();

    List<String> findAllIDProduct();
}
