package repository.the_muon_sach;

import model.TheMuonSach;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TheMuonSachRepositoryImpl implements TheMuonSachRepository {
    private static final String SELECT_ALL_THE_MUON_SACH = "SELECT * FROM the_muon_sach;";

    private static final String INSERT = "INSERT INTO the_muon_sach VALUES(?,?,?,?,?,?);";

    private static final String DELETE = "UPDATE sach SET sach_so_luong = sach_so_luong - 1 where sach_id = ?; ";

    private static final String ADD = "UPDATE sach SET sach_so_luong = sach_so_luong + 1 where sach_id = ?; ";

    private static final String TRA_SACH = "UPDATE the_muon_sach SET trang_thai = false where the_muon_sach_id = ?; ";

    @Override
    public List<TheMuonSach> selectAllTheMuonSach() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<TheMuonSach> theMuonSachList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_THE_MUON_SACH);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("the_muon_sach_id");
                int sachId = resultSet.getInt("sach_id");
                int hocSInhId = resultSet.getInt("hoc_sinh_id");
                boolean trangThai = resultSet.getBoolean("trang_thai");
                String ngayMuon = resultSet.getString("ngay_muon");
                String ngayTra = resultSet.getString("ngay_tra");

                theMuonSachList.add(new TheMuonSach(id, sachId, hocSInhId, trangThai, ngayMuon, ngayTra));
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
        return theMuonSachList;
    }

    @Override
    public boolean muonSach(TheMuonSach theMuonSach) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean flag = false;
        try {
            preparedStatement = connection.prepareStatement(INSERT);

            preparedStatement.setString(1, theMuonSach.getId());
            preparedStatement.setInt(2, theMuonSach.getSachId());
            preparedStatement.setInt(3, theMuonSach.getHocSinhId());
            preparedStatement.setBoolean(4, theMuonSach.isTrangThai());
            preparedStatement.setString(5, theMuonSach.getNgayMuon());
            preparedStatement.setString(6, theMuonSach.getNgayTra());

            if (preparedStatement.executeUpdate() > 0) {
                flag = true;
                preparedStatement = connection.prepareStatement(DELETE);

                preparedStatement.setInt(1,theMuonSach.getSachId());

                preparedStatement.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return flag;
    }

    @Override
    public boolean traSach(String id, int sachId) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean flag = false;

        try {
            preparedStatement = connection.prepareStatement(TRA_SACH);

            preparedStatement.setString(1, id);

            if (preparedStatement.executeUpdate() > 0) {
                flag = true;
                preparedStatement = connection.prepareStatement(ADD);

                preparedStatement.setInt(1,sachId);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            DBConnection.close();
        }
        return flag;
    }

}
