package bo;

import model.Land;
import model.LandStatus;
import model.LandType;

import java.util.List;

public interface LandBO {
    List<Land> findAllLand();

    Land findByID(String id);

    List<Land> findByFloor(String floor);

    List<Land> findByPrice(String price);

    List<Land> findByLandType(String landType);

    List<Land> findByFloorAndPriceAndLandType(String floor, String area, String landType);

    String save(Land land);

    String update(Land land);

    void delete(String id);

    List<LandType> findAllLandType();

    List<LandStatus> findAllLandStatus();
}
