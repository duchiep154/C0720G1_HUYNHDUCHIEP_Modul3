package service.sach;

import model.Sach;

import java.util.List;
import java.util.Map;

public interface SachService {
    Map<Integer, Sach> selectAllSach();
}
