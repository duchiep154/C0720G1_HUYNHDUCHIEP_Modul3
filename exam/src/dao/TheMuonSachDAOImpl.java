package dao;

import model.TheMuonSach;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TheMuonSachDAOImpl implements TheMuonSachDAO {
    private static final String SELECT_FROM_THEMUONSACH ="SELECT * FROM themuonsach";
    @Override
    public List<TheMuonSach> getAllTheMuonSach() {
        List<TheMuonSach> theMuonSachList=new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_FROM_THEMUONSACH);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maMuonSach=resultSet.getString("mamuonsach");
                int idBook=resultSet.getInt("masach");
                int idStudent=resultSet.getInt("mahocsinh");
                String trangThai=resultSet.getString("trangthai");
                String ngayMuon=resultSet.getString("ngaymuon");
                String ngayTra=resultSet.getString("ngaytra");

                TheMuonSach theMuonSach=new TheMuonSach(maMuonSach,idBook,idStudent,trangThai,ngayMuon,ngayTra);
                theMuonSachList.add(theMuonSach);
                System.out.println(theMuonSachList);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return theMuonSachList;
    }
}
