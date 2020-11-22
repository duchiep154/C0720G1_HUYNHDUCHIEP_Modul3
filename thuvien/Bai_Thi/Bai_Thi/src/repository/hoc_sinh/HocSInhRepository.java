package repository.hoc_sinh;

import model.HocSinh;

import java.util.List;

public interface HocSInhRepository {
    List<HocSinh> selectAllHocSinh();

    List<HocSinh> search();
}
