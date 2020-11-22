package repository.hoc_sinh;

import model.HocSinh;

import java.util.List;
import java.util.Map;

public interface HocSInhRepository {
    Map<Integer, HocSinh> selectAllHocSinh();

    List<HocSinh> search();
}
