package service.hoc_sinh;

import model.HocSinh;
import repository.hoc_sinh.HocSInhRepository;
import repository.hoc_sinh.HocSInhRepositoryImpl;

import java.util.List;
import java.util.Map;

public class HocSinhServiceImpl implements HocSinhService {
    HocSInhRepository hocSInhRepository = new HocSInhRepositoryImpl();
    @Override
    public Map<Integer, HocSinh> selectAllHocSinh() {
        return hocSInhRepository.selectAllHocSinh();
    }
}
