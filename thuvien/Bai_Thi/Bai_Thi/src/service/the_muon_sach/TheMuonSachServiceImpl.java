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
    public boolean add(TheMuonSach theMuonSach) {
        return theMuonSachRepository.add(theMuonSach);
    }

    @Override
    public boolean delete(String id) {
        return theMuonSachRepository.traSach(id);
    }


}
