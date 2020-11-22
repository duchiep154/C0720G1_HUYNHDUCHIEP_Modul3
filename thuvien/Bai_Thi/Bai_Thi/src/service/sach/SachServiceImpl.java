package service.sach;

import model.Sach;
import repository.sach.SachRepository;
import repository.sach.SachRepositoryImpl;

import java.util.List;

public class SachServiceImpl implements SachService {
    SachRepository sachRepository = new SachRepositoryImpl();
    @Override
    public List<Sach> selectAllSach() {
        return sachRepository.selectAllSach();
    }
}
