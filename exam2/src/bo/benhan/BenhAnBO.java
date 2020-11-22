package bo.benhan;

import model.BenhAn;

import java.sql.SQLException;
import java.util.List;

public interface BenhAnBO {
    List<BenhAn> getALLBenhAn();
    boolean deleteBenhAn(String maBenhAn) throws SQLException;
    String editBenhAn(BenhAn benhAn);
    BenhAn findByID(String maBenhAn);
}
