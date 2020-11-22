package bo.benhan;

import dao.benhan.BenhAnDAO;
import dao.benhan.BenhAnDAOImpl;
import model.BenhAn;

import java.sql.SQLException;
import java.util.List;

public class BenhAnBOImpl implements BenhAnBO{
    BenhAnDAO benhAnDAO=new BenhAnDAOImpl();
    @Override
    public List<BenhAn> getALLBenhAn() {
        return benhAnDAO.getALLBenhAn();
    }

    @Override
    public boolean deleteBenhAn(String maBenhAn) throws SQLException {
        return benhAnDAO.deleteBenhAn(maBenhAn);
    }

    @Override
    public String editBenhAn(BenhAn benhAn) {
        return benhAnDAO.editBenhAn(benhAn);
    }

    @Override
    public BenhAn findByID(String maBenhAn) {
        return benhAnDAO.findByID(maBenhAn);
    }

}
