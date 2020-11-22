package repository;

import model.Category;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepoImp implements ProductRepo{
    private static final String SELECT_ALL_PRODUCTS = "select * from product";
    private static final String SEARCH_BY_NAME = "SELECT * FROM product WHERE name LIKE ?;";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where product_id = ?";
    private static final String SELECT_ALL_CATEGORY = "select * from category";
    private static final String FIND_BY_NAME_AND_PRICE = "SELECT * FROM product where price = ? and product_name LIKE ?";
    private static final String CREATE_NEW_PRODUCT = "insert into product (product_name,product_price,product_quantity,product_color,product_description,category_id) values (?, ?, ?, ?, ?, ?)";
    private static final String DELETE_WHERE_ID="delete from product where product_id = ?;";
    private static final String UPDATE_WHERE_ID="update product set product_name=?,product_price=?,product_quantity=?,product_color=?,product_description=?,category_id=? where product_id=?";
    private static final String SELECT_PRODUCTS_BY_NAME = "select * from product where product_name like ?";
    private static final String SEARCH_PRODUCTS_PRICE ="select * from product where product_price like ?";
    private static final String SEARCH_PRODUCTS_QUANTITY="select * from product where product_quantity like ?";



    @Override
    public List<Product> getListProduct() throws SQLException {
        List<Product> productList=new ArrayList<>();
        try(Connection connection=DBConnection.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_PRODUCTS)){
            System.out.println(preparedStatement);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                int id=resultSet.getInt("product_id");
                String name=resultSet.getString("product_name");
                String price=resultSet.getString("product_price");
                String quantity=resultSet.getString("product_quantity");
                String color=resultSet.getString("product_color");
                String description=resultSet.getString("product_description");
                int idCategory=resultSet.getInt("category_id");
                Product product=new Product(id,name,price,quantity,color,description,idCategory);
                productList.add(product);
            }


        }catch (SQLException ex) {
            printSQLException(ex);
        }finally {
            DBConnection.close();
        }
        return productList;
    }
    @Override
    public List<Category> findAllCategory() {

        List<Category> categoryList = new ArrayList<>();
        try{
            Connection connection=DBConnection.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet resultSet=preparedStatement.executeQuery();
            System.out.println(resultSet);
            Category category;
            while (resultSet.next()) {
                int idCategory = resultSet.getInt("category_id");
                String name = resultSet.getString("category_name");

                category = new Category(idCategory, name);
                categoryList.add(category);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally {
            DBConnection.close();
        }
        return categoryList;
    }

    @Override
    public List<Product> search(String search, String findBy) {
        Connection connection =DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Product> productList = new ArrayList<>();
        if (connection != null) {
            try {
                switch (findBy) {
                    case "byPrice":
                        preparedStatement = connection.prepareStatement(SEARCH_PRODUCTS_PRICE);
                        break;
                    case "byQuantity":
                        preparedStatement = connection.prepareStatement(SEARCH_PRODUCTS_QUANTITY);
                        break;
                    case "byName":
                        preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_NAME);
                }

                preparedStatement.setString(1, "%" + search +"%");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id=resultSet.getInt("product_id");
                    String name=resultSet.getString("product_name");
                    String price=resultSet.getString("product_price");
                    String quantity=resultSet.getString("product_quantity");
                    String color=resultSet.getString("product_color");
                    String description=resultSet.getString("product_description");
                    int idCategory=resultSet.getInt("category_id");
                    Product product=new Product(id,name,price,quantity,color,description,idCategory);
                    productList.add(product);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    public List<Product> findByName(String nameNeedSearch) {

        List<Product> productList = new ArrayList<>();


        try {
           Connection connection=DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_NAME);
            preparedStatement.setString(1, '%' + nameNeedSearch + '%');
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
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close();
        }
        return productList;
    }


    @Override
    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection=DBConnection.getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement(DELETE_WHERE_ID);
        preparedStatement.setInt(1,id);
        System.out.println(preparedStatement);
        rowDeleted= preparedStatement.executeUpdate() > 0 ;
        System.out.println(rowDeleted);
        return rowDeleted;
    }

    @Override
    public String editProduct(Product product) throws SQLException {
        boolean rowUpdate;

        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_WHERE_ID);) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getPrice());
            statement.setString(3, product.getQuantity());
            statement.setString(4, product.getColor());
            statement.setString(5, product.getDescription());
            statement.setInt(6, product.getIdCategory());
            statement.setInt(7, product.getId());

             rowUpdate=statement.executeUpdate() >0;
        }
        if (rowUpdate){
            return "update completed !";
        }
        else return "fall";
    }

    @Override
    public Product findByID(int id) {
        Product product=null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);) {
            preparedStatement.setInt(1, id);

            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                 id = resultSet.getInt("product_id");
                System.out.println(id);
                String name = resultSet.getString("product_name");
                System.out.println(name);
                String price = resultSet.getString("product_price");
                String quantity = resultSet.getString("product_quantity");
                String color = resultSet.getString("product_color");
                String description = resultSet.getString("product_description");
               int idCategory = resultSet.getInt("category_id");
               product = new Product(id, name, price, quantity, color, description, idCategory);
            }
        } catch (SQLException ex) {
            printSQLException(ex);
        }
        return product;
    }



    @Override
    public String save(Product product) {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_NEW_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getPrice());
            preparedStatement.setString(3, product.getQuantity());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setInt(6, product.getIdCategory());
            preparedStatement.executeUpdate();
            System.out.println(preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.close();
        }
        return "create complete";
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

