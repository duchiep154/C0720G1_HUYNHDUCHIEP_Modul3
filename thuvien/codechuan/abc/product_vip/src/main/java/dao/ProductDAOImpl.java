package dao;

import model.Category;
import model.Color;
import model.Product;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {
    private static final String SELECT_ALL_PRODUCT = "select * from product";
    private static final String SELECT_PRODUCT_BY_NAME = "select * from product where product_name like ?";
    private static final String SELECT_PRODUCT_BY_PRICE = "select * from product where price like ?";
    private static final String SELECT_PRODUCT_BY_NAME_AND_PRICE = "select * from product where product_name like ? and price like ?";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where product_id = ?";
    private static final String SELECT_ALL_CATEGORY = "select * from category";
    private static final String SELECT_ALL_COLOR = "select * from color";
    private static final String CREATE_NEW_PRODUCT = "insert into product values (null, ?, ?, ?, ?, ?,?)";
    private static final String SELECT_ALL_ID_PRODUCT = "select product_id from product";

    @Override
    public List<Product> findAllProduct() {
        BaseDAO baseDAO = new BaseDAO();
        List<Product> productList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            Product product;
            while (resultSet.next()) {
                String id = resultSet.getString("product_id");
                String name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String quantity = resultSet.getString("quantity");
                String idColor = resultSet.getString("color_id");
                String description = resultSet.getString("description");
                String idCategory = resultSet.getString("category_id");

                product = new Product(id, name, price, quantity, idColor,description, idCategory);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public Product findByID(String idNeedFind) {
        BaseDAO baseDAO = new BaseDAO();
        Product product = null;

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setString(1, idNeedFind);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("product_id");
                String name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String quantity = resultSet.getString("quantity");
                String idColor = resultSet.getString("color_id");
                String description = resultSet.getString("description");
                String idCategory = resultSet.getString("category_id");

                product = new Product(id, name, price, quantity, idColor,description, idCategory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return product;
    }

    @Override
    public List<Product> findByName(String nameNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Product> productList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_PRODUCT_BY_NAME);
            preparedStatement.setString(1, '%' + nameNeedSearch + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Product product;
            while (resultSet.next()) {
                String id = resultSet.getString("product_id");
                String name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String quantity = resultSet.getString("quantity");
                String idColor = resultSet.getString("color_id");
                String description = resultSet.getString("description");
                String idCategory = resultSet.getString("category_id");

                product = new Product(id, name, price, quantity, idColor,description, idCategory);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public List<Product> findByPrice(String priceNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Product> productList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_PRODUCT_BY_PRICE);
            preparedStatement.setString(1, '%' + priceNeedSearch + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Product product;
            while (resultSet.next()) {
                String id = resultSet.getString("product_id");
                String name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String quantity = resultSet.getString("quantity");
                String idColor = resultSet.getString("color_id");
                String description = resultSet.getString("description");
                String idCategory = resultSet.getString("category_id");

                product = new Product(id, name, price, quantity, idColor,description, idCategory);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public List<Product> findByNameAndPrice(String nameNeedSearch, String priceNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Product> productList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_PRODUCT_BY_NAME_AND_PRICE);
            preparedStatement.setString(1, '%' + nameNeedSearch + '%');
            preparedStatement.setString(2, '%' + priceNeedSearch + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Product product;
            while (resultSet.next()) {
                String id = resultSet.getString("product_id");
                String name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String quantity = resultSet.getString("quantity");
                String idColor = resultSet.getString("color_id");
                String description = resultSet.getString("description");
                String idCategory = resultSet.getString("category_id");

                product = new Product(id, name, price, quantity, idColor,description, idCategory);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public String save(Product product) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(CREATE_NEW_PRODUCT);
//            preparedStatement.setString(1, product.getId());
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getPrice());
            preparedStatement.setString(3, product.getQuantity());
            preparedStatement.setString(4, product.getIdColor());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getIdCategory());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Create Complete !";
    }

    @Override
    public String update(Product product) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call update_product(?, ?,?,?,?,?,?)");
            callableStatement.setString(1, product.getId());
            callableStatement.setString(2, product.getName());
            callableStatement.setString(3, product.getPrice());
            callableStatement.setString(4, product.getQuantity());
            callableStatement.setString(5, product.getIdColor());
            callableStatement.setString(6, product.getDescription());
            callableStatement.setString(7, product.getIdCategory());

            callableStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Update Complete !";
    }

    @Override
    public void delete(String idNeedDelete) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call delete_product(?)");
            callableStatement.setString(1, idNeedDelete);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Category> findAllCategory() {
        BaseDAO baseDAO = new BaseDAO();
        List<Category> categoryList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            Category category;
            while (resultSet.next()) {
                String id = resultSet.getString("category_id");
                String name = resultSet.getString("category_name");

                category = new Category(id, name);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return categoryList;
    }

    @Override
    public List<Color> findAllColor() {
        BaseDAO baseDAO = new BaseDAO();
        List<Color> colorList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_COLOR);
            ResultSet resultSet = preparedStatement.executeQuery();
            Color color;
            while (resultSet.next()) {
                String id = resultSet.getString("color_id");
                String name = resultSet.getString("color_name");

                color = new Color(id, name);
                colorList.add(color);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return colorList;
    }

    @Override
    public List<String> findAllIDProduct() {
        BaseDAO baseDAO = new BaseDAO();
        List<String> listID = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_ID_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            String id;
            while (resultSet.next()) {
                id = resultSet.getString("product_id");
                listID.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listID;
    }
}
