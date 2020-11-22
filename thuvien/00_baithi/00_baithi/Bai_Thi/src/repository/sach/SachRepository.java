package repository.sach;

import model.Sach;

import java.util.List;
import java.util.Map;

public interface SachRepository {
    Map<Integer, Sach> selectAllSach();
}
