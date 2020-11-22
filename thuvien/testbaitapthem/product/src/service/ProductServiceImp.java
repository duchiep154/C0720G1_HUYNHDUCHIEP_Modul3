package service;

import Common.Validation;
import model.Category;
import model.Product;
import repository.ProductRepository;
import repository.ProductRepositoryImp;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImp implements ProductService{
    ProductRepository repository =new ProductRepositoryImp();
    @Override
    public List<Product> findAllProduct() throws SQLException {
        return this.repository.findAllProduct();
    }

    @Override
    public Product findByID(String id) throws SQLException {
        return this.repository.findByID(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return this.repository.findByName(name);
    }

    @Override
    public String save(Product product) {
        boolean check = true;
        String message = "";

        if (testID(product.getId())) {
            check = false;
            message += "Invalid ID ! ID is exists ! Please input ID other ,";
        } else if (Validation.regexID(product.getId())) {
            check = false;
            message += "Invalid ID ! Format id is SP-XXX with X is number from 0 to 9 ,";
        }
        if (Validation.regexPositiveNumbers(product.getPrice())) {
            check = false;
            message += "Invalid price ! Price must be a positive number and greater than or equal to 0 ,";
        }
        if (Validation.regexPositiveIntegers(product.getQuantity())) {
            check = false;
            message += "Invalid quantity ! Quantity must be a positive integer and greater than or equal to 0 !";
        }

        if (check){
            message = this.repository.save(product);
        }

        return message;

    }

    @Override
    public String update(Product product) {
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
            message = this.repository.update(product);
        }

        return message;
    }

    @Override
    public void delete(String id) {
        repository.delete(id);

    }

    @Override
    public List<Category> findAllCategory() {
        return this.repository.findAllCategory();
    }
    private boolean testID(String id) {
        List<String> listID = this.repository.findAllIDProduct();
        for (String idExist : listID) {
            if (idExist.equals(id)) {
                return true;
            }
        }
        return false;
    }
}
