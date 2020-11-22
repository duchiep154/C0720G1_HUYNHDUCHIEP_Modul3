package repository.sach;

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

public class SachRepositoryImpl implements SachRepository {
    private static final String SELECT_ALL_SACH = "SELECT * FROM sach;";
    @Override
    public Map<Integer, Sach> selectAllSach() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Map<Integer, Sach> sachList = new HashMap<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_SACH);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("sach_id");
                String ten = resultSet.getString("sach_ten");
                String tacGia = resultSet.getString("sach_tac_gia");
                String moTa = resultSet.getString("sach_mo_ta");
                int soLuong = resultSet.getInt("sach_so_luong");

                sachList.put(id, new Sach(id, ten, tacGia, moTa, soLuong));
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
        return sachList;
    }
}
