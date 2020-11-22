package repository.hoc_sinh;

import model.HocSinh;
import model.Sach;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HocSInhRepositoryImpl implements HocSInhRepository {

    private static final String SELECT_ALL_SACH = "SELECT * FROM hoc_sinh;";

    private static final String SEARCH = "SELECT * FROM hoc_sinh where hoc_sinh_ten like ?;";
    @Override
    public Map<Integer, HocSinh> selectAllHocSinh() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Map<Integer, HocSinh> hocSinhList = new HashMap<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_SACH);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("hoc_sinh_id");
                String ten = resultSet.getString("hoc_sinh_ten");
                String lop = resultSet.getString("hoc_sinh_lop");

                hocSinhList.put(id, new HocSinh(id, ten, lop));
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
        return hocSinhList;
    }

    @Override
    public List<HocSinh> search() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<HocSinh> hocSinhList = new ArrayList<>();

//        try {
//
//        }
        return null;
    }
}
