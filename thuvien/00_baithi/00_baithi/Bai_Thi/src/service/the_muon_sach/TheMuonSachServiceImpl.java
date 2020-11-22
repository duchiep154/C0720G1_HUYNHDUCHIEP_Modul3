package service.the_muon_sach;

import model.TheMuonSach;
import repository.the_muon_sach.TheMuonSachRepository;
import repository.the_muon_sach.TheMuonSachRepositoryImpl;

import java.util.List;

public class TheMuonSachServiceImpl implements TheMuonSachService {
    TheMuonSachRepository theMuonSachRepository = new TheMuonSachRepositoryImpl();
    @Override
    public List<TheMuonSach> selectAllTheMuonSach() {
        return theMuonSachRepository.selectAllTheMuonSach();
    }

    @Override
    public boolean muonSach(TheMuonSach theMuonSach) {
        return theMuonSachRepository.muonSach(theMuonSach);
    }

    @Override
    public boolean traSach(String id, int sachId) {
        return theMuonSachRepository.traSach(id, sachId);
    }


}
