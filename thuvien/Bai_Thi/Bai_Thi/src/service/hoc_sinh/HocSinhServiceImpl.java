package service.hoc_sinh;

import model.HocSinh;
import repository.hoc_sinh.HocSInhRepository;
import repository.hoc_sinh.HocSInhRepositoryImpl;

import java.util.List;

public class HocSinhServiceImpl implements HocSinhService {
    HocSInhRepository hocSInhRepository = new HocSInhRepositoryImpl();
    @Override
    public List<HocSinh> selectAllHocSinh() {
        return hocSInhRepository.selectAllHocSinh();
    }
}
