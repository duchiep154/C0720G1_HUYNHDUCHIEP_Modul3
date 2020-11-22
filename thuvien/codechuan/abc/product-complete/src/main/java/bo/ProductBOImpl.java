package bo;

import common.Validation;
import dao.ProductDAO;
import dao.ProductDAOImpl;
import model.Category;
import model.Product;

import java.util.List;

public class ProductBOImpl implements ProductBO {
    ProductDAO productDAO = new ProductDAOImpl();

    @Override
    public List<Product> findAllProduct() {
        return this.productDAO.findAllProduct();
    }

    @Override
    public Product findByID(String id) {
        return this.productDAO.findByID(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return this.productDAO.findByName(name);
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
            message = this.productDAO.save(product);
        }

        return message;

//        return this.productDAO.save(product);
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
            message = this.productDAO.update(product);
        }

        return message;

//        return this.productDAO.update(product);
    }

    @Override
    public void delete(String id) {
        this.productDAO.delete(id);
    }

    @Override
    public List<Category> findAllCategory() {
        return this.productDAO.findAllCategory();
    }

    private boolean testID(String id) {
        List<String> listID = this.productDAO.findAllIDProduct();
        for (String idExist : listID) {
            if (idExist.equals(id)) {
                return true;
            }
        }
        return false;
    }
}
