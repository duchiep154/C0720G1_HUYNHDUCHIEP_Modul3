package service.the_muon_sach;

import model.TheMuonSach;

import java.util.List;

public interface TheMuonSachService {
    List<TheMuonSach> selectAllTheMuonSach();

    boolean add(TheMuonSach theMuonSach);

    boolean delete(String id);
}
