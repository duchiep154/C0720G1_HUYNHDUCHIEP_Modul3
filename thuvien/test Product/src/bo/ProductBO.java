package bo;

import model.Category;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductBO {
    List<Product> findAllProduct() throws SQLException;
    List<Category> findAllCategory();

    Product findProductById(int id);

    boolean editProductInfo(Product product);

    String deleteProduct(int id);

    String create(Product product);

    List<Product> search(String search);
}
