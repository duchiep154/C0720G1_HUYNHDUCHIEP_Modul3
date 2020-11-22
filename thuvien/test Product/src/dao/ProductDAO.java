package dao;

import model.Category;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDAO {
    List<Product> findAllProduct() throws SQLException;

    Product findProductById(int id);

    boolean editProductInfo(Product product);

    String deleteProduct(int id);

   String create(Product product);


    List<Product> search(String search);
    List<Category> findAllCategory();
}
