package bo.benhnhan;

import dao.benhnhan.BenhNhanDAO;
import dao.benhnhan.BenhNhanDAOImpl;
import model.BenhNhan;

import java.util.List;

public class BenhNhanBOImpl implements BenhNhanBO{
    BenhNhanDAO benhNhanDAO=new BenhNhanDAOImpl();
    @Override
    public List<BenhNhan> getALLBenhNhan() {
        return benhNhanDAO.getALLBenhNhan();
    }
}
