package repository.the_muon_sach;

import model.TheMuonSach;

import java.util.List;

public interface TheMuonSachRepository {
    List<TheMuonSach> selectAllTheMuonSach();

    boolean muonSach(TheMuonSach theMuonSach);

    boolean traSach(String id, int sachId);
}
