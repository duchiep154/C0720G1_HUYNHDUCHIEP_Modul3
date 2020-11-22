package service.sach;

import model.Sach;
import repository.sach.SachRepository;
import repository.sach.SachRepositoryImpl;

import java.util.List;
import java.util.Map;

public class SachServiceImpl implements SachService {
    SachRepository sachRepository = new SachRepositoryImpl();
    @Override
    public Map<Integer, Sach> selectAllSach() {
        return sachRepository.selectAllSach();
    }
}
