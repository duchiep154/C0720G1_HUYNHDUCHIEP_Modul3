package service;

import model.Product;
import repository.ProductRepository;
import repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    ProductRepository repository = new ProductRepositoryImpl();
    @Override
    public List<Product> getAllProduct() {
        return repository.getAllProduct();
    }

    @Override
    public void saveProduct(Product product) {
        repository.saveProduct(product);
    }

    @Override
    public Product findProductById(int id) {
        return repository.findProductById(id);
    }

    @Override
    public void updateProduct(Product product) {
        repository.updateProduct(product);
    }

    @Override
    public void deleteProductById(int id) {
        repository.deleteProductById(id);
    }

    @Override
    public List<Product> findProductByName(String name) {
        return repository.findProductByName(name);
    }
}
