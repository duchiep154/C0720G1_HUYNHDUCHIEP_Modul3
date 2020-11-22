package bo;

import common.Validate;
import dao.ProductDAO;
import dao.ProductDAOImpl;
import model.Category;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductBOImpl implements ProductBO {
    ProductDAO productDAO=new ProductDAOImpl();

    @Override
    public List<Product> findAllProduct() throws SQLException {
       return productDAO.findAllProduct();
    }

    @Override
    public List<Category> findAllCategory() {
        return productDAO.findAllCategory();
    }

    @Override
    public Product findProductById(int id) {

        return productDAO.findProductById(id);
    }

    @Override
    public boolean editProductInfo(Product product) {
        return false;
    }

    @Override
    public String deleteProduct(int id) {

        return productDAO.deleteProduct(id);
    }

    @Override
    public String create(Product product) {
        boolean check = false;
        String message = "";


        if (Validate.checkPositiveNumber(product.getPrice())) {
            check = true;
            message += "Invalid price ! Price must be a positive number and greater than or equal to 0 ,";
        }
        if (Validate.checkPositiveInteger(product.getQuantity())) {
            check = true;
            message += "Invalid quantity ! Quantity must be a positive integer and greater than or equal to 0 !";
        }

        if (check){
            message = this.productDAO.create(product);
        }

        return message;

    }

    @Override
    public List<Product> search(String search) {
        return null;
    }
}
