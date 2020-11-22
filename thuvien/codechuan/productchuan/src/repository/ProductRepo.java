package repository;

import model.Category;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductRepo {
    List<Product> getListProduct() throws SQLException;
    boolean deleteProduct(int id) throws SQLException;
    String editProduct(Product product) throws SQLException;
    Product findByID(int id);
    List<Product> findByName(String name);
    String save(Product product);
    List<Category> findAllCategory();
    List<Product> search(String search, String searchBy);




}
