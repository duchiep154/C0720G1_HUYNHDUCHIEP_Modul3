package bo;

import common.Validation;
import dao.ProductDAO;
import dao.ProductDAOImpl;
import model.Category;
import model.Color;
import model.Product;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    public List<Product> findByPrice(String price) {
        return this.productDAO.findByPrice(price);
    }

    @Override
    public List<Product> findByNameAndPrice(String name, String price) {
        return this.productDAO.findByNameAndPrice(name, price);
    }

    @Override
    public String save(Product product) {
        boolean check = true;
        String message = "";
        if (testID(product.getId())) {
            check = false;
            message += "Invalid ID ! ID is exists ! Please input ID other ,";
        } else if (Validation.regexPrice(product.getPrice())) {
            check = false;
            message += "Invalid price ! Price must be greater than 0 ,";
        }
        if (product.getName().equals("")) {
            check = false;
            message += "Invalid name ! Name cannot be left blank,";
        }
        if (Validation.regexPositiveIntegers(product.getQuantity())) {
            check = false;
            message += "Invalid quantity ! Quantity must be positive integer and greater than 0, ";
        }


        if (check) {
            message = this.productDAO.save(product);
        }

        return message;

//        return this.land.save(land);
    }

    @Override
    public String update(Product product) {

        boolean check = true;
        String message = "";

        if (product.getName().equals("")) {
            check = false;
            message += "Invalid name ! Name cannot be left blank,";
        }
        if (Validation.regexPrice(product.getPrice())) {
            check = false;
            message += "Invalid price ! Price must be greater than 0 ,";
        }
        if (Validation.regexPositiveIntegers(product.getQuantity())) {
            check = false;
            message += "Invalid quantity ! Quantity must be positive integer and greater than 0 ";
        }

        if (check) {
            message = this.productDAO.update(product);
        }
        return message;

//        return this.landDAO.update(land);
    }

    @Override
    public void delete(String id) {
        this.productDAO.delete(id);
    }

    @Override
    public List<Category> findAllCategory() {
        return this.productDAO.findAllCategory();
    }

    @Override
    public List<Color> findAllColor() {
        return this.productDAO.findAllColor();
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
