package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class PublisherRepositoryImpl implements PublisherRepository {
    private static final String SELECT_ALL_PUBLISHER = "SELECT * FROM publisher";

    @Override
    public Map<Integer, String> selectAllPublisher() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Map<Integer, String> publisherList = new HashMap<Integer, String>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_PUBLISHER);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("publisher_id");
                String name = resultSet.getString("publisher_name");

                publisherList.put(id, name);
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
        return publisherList;
    }
}
