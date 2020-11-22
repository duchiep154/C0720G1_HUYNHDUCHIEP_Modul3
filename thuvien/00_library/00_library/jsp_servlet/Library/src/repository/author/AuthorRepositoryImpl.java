package repository.author;

import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AuthorRepositoryImpl implements AuthorRepository {
    private static final String SELECT_ALL_AUTHOR = "SELECT * FROM author";

    @Override
    public Map<Integer, String> selectAllAuthor() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Map<Integer, String> authorList = new HashMap<Integer, String>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_AUTHOR);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("author_id");
                String name = resultSet.getString("author_name");

                authorList.put(id, name);
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
        return authorList;
    }
}
