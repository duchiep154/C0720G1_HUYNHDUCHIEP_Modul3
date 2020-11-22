package service.the_muon_sach;

import model.TheMuonSach;

import java.util.List;

public interface TheMuonSachService {
    List<TheMuonSach> selectAllTheMuonSach();

    boolean muonSach(TheMuonSach theMuonSach);

    boolean traSach(String id, int sachId);
}
