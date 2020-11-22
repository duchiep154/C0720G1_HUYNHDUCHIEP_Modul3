package service.hoc_sinh;

import model.HocSinh;

import java.util.List;
import java.util.Map;

public interface HocSinhService {
    Map<Integer, HocSinh> selectAllHocSinh();
}
