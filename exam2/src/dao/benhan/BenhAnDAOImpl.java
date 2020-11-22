package dao.benhan;

import dao.DBConnection;
import model.BenhAn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BenhAnDAOImpl implements BenhAnDAO {
    private static final String SELECT_ALL_BENHAN = "select * from benhan";
    private static final String DELETE="delete from benhan where mabenhan = ?;";
    private static final String UPDATE="update benhan set ngaynhapvien=?,ngayravien=?,lydo=?,phuongphaptri=?,bacsi=? where mabenhan=?";
    private static final String SELECT_BA_BY_ID = "select * from benhan where mabenhan = ?";
    @Override
    public List<BenhAn> getALLBenhAn() {
        List<BenhAn> benhAnList=new ArrayList<>();
        try(Connection connection= DBConnection.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_BENHAN)){
            System.out.println(preparedStatement);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                String maBenhAn=resultSet.getString("mabenhan");
                String maBenhNhan=resultSet.getString("mabenhnhan");
                String ngayNhapVien=resultSet.getString("ngaynhapvien");
                String ngayRaVien=resultSet.getString("ngayravien");
                String lyDo=resultSet.getString("lydo");
                String phuongPhapTri=resultSet.getString("phuongphaptri");
                String bacSi=resultSet.getString("bacsi");

                BenhAn benhAn=new BenhAn(maBenhAn,maBenhNhan,ngayNhapVien,ngayRaVien,lyDo,phuongPhapTri,bacSi);
                benhAnList.add(benhAn);
            }


        }catch (SQLException ex) {
            printSQLException(ex);
        }finally {
            DBConnection.close();
        }
        return benhAnList;


    }

    @Override
    public boolean deleteBenhAn(String maBenhAn) throws SQLException {
        boolean rowDeleted;
        Connection connection=DBConnection.getConnection();
        PreparedStatement preparedStatement= null;
        try {
            preparedStatement = connection.prepareStatement(DELETE);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        preparedStatement.setString(1,maBenhAn);
        System.out.println(preparedStatement);
        rowDeleted= preparedStatement.executeUpdate() > 0 ;
        System.out.println(rowDeleted);
        return rowDeleted;
    }

    @Override
    public String editBenhAn(BenhAn benhAn) {
        boolean rowUpdate = false;

        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE);) {
            statement.setString(1, benhAn.getNgayNhapVien());
            statement.setString(2, benhAn.getNgayRaVien());
            statement.setString(3, benhAn.getLyDo());
            statement.setString(4, benhAn.getPhuongPhapTri());
            statement.setString(5, benhAn.getBacSi());

            statement.setString(6, benhAn.getMaBenhAn());

            rowUpdate=statement.executeUpdate() >0;
            System.out.println(rowUpdate);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (rowUpdate=true){
            return "update completed !";
        }
        else return "fall";
    }

    @Override
    public BenhAn findByID(String maBenhAn) {
        BenhAn benhAn=null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BA_BY_ID);) {
            preparedStatement.setString(1, maBenhAn);

            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                maBenhAn = resultSet.getString("mabenhan");
                System.out.println(maBenhAn);
                String maBenhNhan = resultSet.getString("mabenhnhan");

                String ngayNhapVien = resultSet.getString("ngaynhapvien");
                String ngayRaVien = resultSet.getString("ngayravien");
                String lydo = resultSet.getString("lydo");
                String phuongPhapTri = resultSet.getString("phuongphaptri");
                String bacsi = resultSet.getString("bacsi");
                benhAn = new BenhAn(maBenhAn, maBenhNhan,ngayNhapVien,ngayRaVien,lydo,phuongPhapTri,bacsi);
            }
        } catch (SQLException ex) {
            printSQLException(ex);
        }
        return benhAn;
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
