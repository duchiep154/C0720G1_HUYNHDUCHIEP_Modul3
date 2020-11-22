package service;

import common.Validation;
import model.Category;
import model.Product;
import repository.ProductRepo;
import repository.ProductRepoImp;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImp implements ProductService {
    ProductRepo productRepo=new ProductRepoImp();
    @Override
    public List<Product> getListProduct() throws SQLException {
        return productRepo.getListProduct();
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
            return productRepo.deleteProduct(id);
    }

    @Override
    public String editProduct(Product product) throws SQLException {
        boolean check = true;
        String message = "";

        if (Validation.regexPositiveNumbers(product.getPrice())) {
            check = false;
            message += "Invalid price ! Price must be a positive number and greater than or equal to 0 ,";
        }
        if (Validation.regexPositiveIntegers(product.getQuantity())) {
            check = false;
            message += "Invalid quantity ! Quantity must be a positive integer and greater than or equal to 0 !";
        }

        if (check){
            message = this.productRepo.editProduct(product);
        }

        return message;
    }

    @Override
    public Product findByID(int id) {
        return productRepo.findByID(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepo.findByName(name);
    }

    @Override
    public String save(Product product) {
        boolean check = true;
        String message = "";


        if (Validation.regexPositiveNumbers(product.getPrice())) {
            check = false;
            message += "Invalid price ! Price must be a positive number and greater than or equal to 0 ,";
        }
        if (Validation.regexPositiveIntegers(product.getQuantity())) {
            check = false;
            message += "Invalid quantity ! Quantity must be a positive integer and greater than or equal to 0 !";
        }

        if (check){
            message = this.productRepo.save(product);
        }

        return message;
    }

    @Override
    public List<Category> findAllCategory() {
        return productRepo.findAllCategory();
    }

    @Override
    public List<Product> search(String search, String searchBy) {
        return productRepo.search(search,searchBy);
    }


}
