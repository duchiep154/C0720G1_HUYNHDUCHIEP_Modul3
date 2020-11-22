package bo;

import model.Category;
import model.Color;
import model.Product;

import java.util.List;

public interface ProductBO {
    List<Product> findAllProduct();

    Product findByID(String id);

    List<Product> findByName(String name);

    List<Product> findByPrice(String price);

    List<Product> findByNameAndPrice(String name, String price);

    String save(Product product);

    String update(Product product);

    void delete(String id);

    List<Category> findAllCategory();

    List<Color> findAllColor();
}
