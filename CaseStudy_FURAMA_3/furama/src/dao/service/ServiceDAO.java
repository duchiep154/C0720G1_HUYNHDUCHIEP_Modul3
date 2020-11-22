package dao.service;

import model.service.RentType;
import model.service.Service;
import model.service.ServiceType;

import java.util.List;

public interface ServiceDAO {
    String saveService(Service service);

    List<RentType> findAllRentType();

    List<ServiceType> findAllServiceType();

    List<String> findAllIDService();
}
