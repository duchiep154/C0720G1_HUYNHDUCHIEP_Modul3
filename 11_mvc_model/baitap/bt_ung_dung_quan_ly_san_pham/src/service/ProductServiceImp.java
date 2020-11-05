package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImp implements ProductService {
    private static Map<Integer,Product> listProduct;

    static {
        listProduct = new HashMap<>();
        listProduct.put(1,new Product(1,"may giat",150000,"may giat samsumg","samsung"));
        listProduct.put(2,new Product(2,"dien thoai",150000,"may giat samsumg","samsung"));
        listProduct.put(3,new Product(3,"tu lanh",150000,"may giat samsumg","samsung"));
        listProduct.put(4,new Product(4,"tivi",150000,"may giat samsumg","samsung"));
        listProduct.put(5,new Product(5,"laptop",150000,"may giat samsumg","samsung"));
        listProduct.put(6,new Product(6,"ampli",150000,"may giat samsumg","samsung"));
    }

    @Override
    public List<Product> getAllProduct() {
        return new ArrayList<>(listProduct.values());
    }

    @Override
    public void saveProduct(Product product) {
        listProduct.put(product.getId(),product);

    }

    @Override
    public void deleteProduct(int id) {
        listProduct.remove(id);

    }

    @Override
    public void editProduct(int id, Product product) {

    }

    @Override
    public Product findById(int id) {
        return listProduct.get(id);
    }
}
