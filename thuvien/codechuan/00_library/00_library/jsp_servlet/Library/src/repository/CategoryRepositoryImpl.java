package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class CategoryRepositoryImpl implements CategoryRepository {
    private static final String SELECT_ALL_CATEGORY = "SELECT * FROM category";

    @Override
    public Map<Integer, String> selectAllCategory() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Map<Integer, String> categoryList = new HashMap<Integer, String>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("category_id");
                String name = resultSet.getString("category_name");

                categoryList.put(id, name);
            }
        } catch (SQLException e) {
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
        return categoryList;
    }
}
