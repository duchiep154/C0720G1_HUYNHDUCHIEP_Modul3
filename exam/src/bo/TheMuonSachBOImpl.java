package bo;

import dao.TheMuonSachDAO;
import dao.TheMuonSachDAOImpl;
import model.TheMuonSach;

import java.util.List;

public class TheMuonSachBOImpl implements TheMuonSachBO {
    TheMuonSachDAO theMuonSachDAO=new TheMuonSachDAOImpl();
    @Override
    public List<TheMuonSach> getAllTheMuonSach() {
        return theMuonSachDAO.getAllTheMuonSach();
    }
}
