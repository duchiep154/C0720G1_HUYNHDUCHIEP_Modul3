package dao;

import model.Category;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {
    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM product;";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM product WHERE product_id = ?;";
    private static final String EDIT_PRODUCT_INFO = "UPDATE product SET product_name = ?, product_price = ?, product_amount = ?, " +
            "product_color = ?, product_description = ?, product_category_id = ? WHERE product_id = ?;";
    private static final String DELETE_PRODUCT_BY_ID = "DELETE FROM product WHERE product_id = ?;";
    private static final String CREATE_NEW_PRODUCT = "insert into product(product_name,product_price,product_quantity,product_color,product_description,category_id) values ( ?, ?, ?, ?, ?, ?)";

    private static final String SEARCH_PRODUCT = "SELECT * FROM product WHERE product_id LIKE ?" +
            "OR product_name LIKE ?;";
    private static final String SELECT_ALL_CATEGORY = "SELECT * FROM category;";

    @Override
    public List<Product> findAllProduct() throws SQLException {
        Connection connection = DBConnection.getConnection();
        List<Product> productList = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
        ResultSet resultSet = preparedStatement.executeQuery();
        Product product;
        while (resultSet.next()) {
            int id = resultSet.getInt("product_id");
            String name = resultSet.getString("product_name");
            String price = resultSet.getString("product_price");
            String quantity = resultSet.getString("product_quantity");
            String color = resultSet.getString("product_color");
            String description = resultSet.getString("product_description");
            int idCategory = resultSet.getInt("category_id");

            product = new Product(id, name, price, quantity, color, description, idCategory);
            productList.add(product);
        }
        try {
            preparedStatement.close();
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DBConnection.close();
        return productList;
    }



    @Override
    public Product findProductById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Product product = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("product_name");
                    String price = resultSet.getString("product_price");
                    String amount = resultSet.getString("product_quantity");
                    String color = resultSet.getString("product_color");
                    String description = resultSet.getString("product_description");
                    int categoryId = resultSet.getInt("category_id");
                    product = new Product(id, name, price, amount, color, description, categoryId);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return product;
    }

    @Override
    public boolean editProductInfo(Product product) {
        return false;
    }

    @Override
    public String  deleteProduct(int id) {
        Connection connection=DBConnection.getConnection();
        String message="";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DELETE_PRODUCT_BY_ID);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
            message+="complete";

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.close();
        }
        return message;
    }

    @Override
    public String create(Product product) {
        Connection connection=DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(CREATE_NEW_PRODUCT);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setString(2,product.getPrice());
            preparedStatement.setString(3,product.getQuantity());
            preparedStatement.setString(4,product.getColor());
            preparedStatement.setString(5,product.getDescription());
            preparedStatement.setInt(6,product.getIdCategory());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.close();
        }
        return "Create Complete !";

    }

    @Override
    public List<Product> search(String search) {
        return null;
    }

    @Override
    public List<Category> findAllCategory() {
        Connection connection = DBConnection.getConnection();
        List<Category> categoryList = new ArrayList<>();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        try {
            preparedStatement=connection.prepareStatement(SELECT_ALL_CATEGORY);
            resultSet = preparedStatement.executeQuery();
            Category category;
            while (resultSet.next()) {
                int idCategory = resultSet.getInt("category_id");
                String categoryName = resultSet.getString("category_name");

                category = new Category(idCategory, categoryName);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }

        return categoryList;
    }
}
