package dao.benhan;

import model.BenhAn;
import model.BenhNhan;

import java.sql.SQLException;
import java.util.List;

public interface BenhAnDAO {
    List<BenhAn> getALLBenhAn();
    boolean deleteBenhAn(String maBenhAn) throws SQLException;
    String editBenhAn(BenhAn benhAn);
    BenhAn findByID(String maBenhAn);
}
