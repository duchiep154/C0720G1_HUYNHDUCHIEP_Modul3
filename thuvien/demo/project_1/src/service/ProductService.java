package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> getAllProduct();

    void saveProduct(Product product);

    Product findProductById(int id);

    void updateProduct(Product product);

    void deleteProductById(int id);

    List<Product> findProductByName(String name);
}
