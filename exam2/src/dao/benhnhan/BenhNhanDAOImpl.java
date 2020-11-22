package dao.benhnhan;

import dao.DBConnection;
import model.BenhNhan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BenhNhanDAOImpl implements BenhNhanDAO{
    private static final String SELECT_ALL_BENHNHAN = "select * from benhnhan";

    @Override
    public List<BenhNhan> getALLBenhNhan() {
        List<BenhNhan> benhNhanList = new ArrayList<>();
        try{
            Connection connection= DBConnection.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_BENHNHAN);
            ResultSet resultSet=preparedStatement.executeQuery();
            System.out.println(resultSet);
            BenhNhan benhNhan;
            while (resultSet.next()) {
                String maBenhNhan = resultSet.getString("mabenhnhan");
                String tenBenhNhan = resultSet.getString("tenbenhnhan");

                benhNhan = new BenhNhan(maBenhNhan, tenBenhNhan);
                benhNhanList.add(benhNhan);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally {
            DBConnection.close();
        }
        return benhNhanList;

    }
}
