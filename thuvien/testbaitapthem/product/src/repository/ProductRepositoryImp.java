package repository;

import model.Category;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImp implements ProductRepository {
    private static final String SELECT_ALL_PRODUCTS = "select * from product;";
    private static final String SELECT_PRODUCTS_BY_NAME = "select * from product where product_name like ?;";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where product_id = ?;";
    private static final String SELECT_ALL_CATEGORY = "select * from category;";
    private static final String SELECT_ALL_ID_PRODUCT = "select product_id from product;";
    private static final String CREATE_NEW_PRODUCT = "insert into product values (?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_PRODUCT="{call update_product(?,?,?,?,?,?,?)}";

    @Override
    public List<Product> findAllProduct() throws SQLException {
        Connection connection = DBConnection.getConnection();
        List<Product> productList = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);
        ResultSet resultSet = preparedStatement.executeQuery();
        Product product;
        while (resultSet.next()) {
            String id = resultSet.getString("product_id");
            String name = resultSet.getString("product_name");
            String price = resultSet.getString("price");
            String quantity = resultSet.getString("quantity");
            String color = resultSet.getString("color");
            String description = resultSet.getString("description");
            String idCategory = resultSet.getString("category_id");

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
    public Product findByID(String idNeedFind) throws SQLException {
        Connection connection = DBConnection.getConnection();
        Product product = null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setString(1, idNeedFind);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("product_id");
                String name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String quantity = resultSet.getString("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String idCategory = resultSet.getString("category_id");
                product = new Product(id, name, price, quantity, color, description, idCategory);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return product;
    }

    @Override
    public List<Product> findByName(String nameNeedSearch) {
        Connection connection = DBConnection.getConnection();
        List<Product> productList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_NAME);
            preparedStatement.setString(1, '%' + nameNeedSearch + '%');
             resultSet = preparedStatement.executeQuery();
            Product product;
            while (resultSet.next()) {
                String id = resultSet.getString("product_id");
                String name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String quantity = resultSet.getString("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String idCategory = resultSet.getString("category_id");

                product = new Product(id, name, price, quantity, color, description, idCategory);
                productList.add(product);
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
        return productList;
    }

    @Override
    public String save(Product product) {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_NEW_PRODUCT);

            preparedStatement.setString(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getPrice());
            preparedStatement.setString(4, product.getQuantity());
            preparedStatement.setString(5, product.getColor());
            preparedStatement.setString(6, product.getDescription());
            preparedStatement.setString(7, product.getIdCategory());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.close();
        }
        return "create complete";
    }

    @Override
    public String update(Product product) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(UPDATE_PRODUCT);
            callableStatement.setString(1, product.getId());
            callableStatement.setString(2, product.getName());
            callableStatement.setString(3, product.getPrice());
            callableStatement.setString(4, product.getQuantity());
            callableStatement.setString(5, product.getColor());
            callableStatement.setString(6, product.getDescription());
            callableStatement.setString(7, product.getIdCategory());

            callableStatement.executeUpdate();
        } catch (SQLException e) {
           e.printStackTrace();
        }finally {
            try {
                callableStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return "update complete";
    }

    @Override
    public void delete(String idNeedDelete) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement=null;
        try {
            callableStatement=connection.prepareCall("call delete_product(?)");
            callableStatement.setString(1, idNeedDelete);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                callableStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }

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
                String id = resultSet.getString("category_id");
                String name = resultSet.getString("category_name");

                category = new Category(id, name);
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

    @Override
    public List<String> findAllIDProduct() {
        Connection connection=DBConnection.getConnection();
        List<String> listID = new ArrayList<>();
        PreparedStatement preparedStatement =null;
        ResultSet resultSet =null;
        try {
            preparedStatement =connection.prepareStatement(SELECT_ALL_ID_PRODUCT);
            resultSet = preparedStatement.executeQuery();
            String id;
            while (resultSet.next()) {
                id = resultSet.getString("product_id");
                listID.add(id);
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
        return listID;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
