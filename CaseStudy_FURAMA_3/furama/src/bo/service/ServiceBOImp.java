package bo.service;

import common.Validation;
import dao.service.ServiceDAO;
import dao.service.ServiceDAOImp;
import model.service.RentType;
import model.service.Service;
import model.service.ServiceType;

import java.util.List;

public class ServiceBOImp implements ServiceBO {
    ServiceDAO serviceDAO = new ServiceDAOImp();

    @Override
    public String saveService(Service service) {
        String message;

        if (!Validation.regexIDService(service.getId())) {
            message = "Format ID is DV-XXXX with X is number from 0 to 9 !";
        } else if (testID(service.getId())) {
            message = "ID is exists ! Please input ID other !";
        } else if (Validation.regexPositiveNumbers(service.getArea())) {
            message = "Invalid area ! Area must be a positive number !";
        } else if (Validation.regexPositiveNumbers(service.getCost())) {
            message = "Invalid cost ! Cost must be a positive number !";
        } else if (Validation.regexPositiveIntegers(service.getMaxPeople())) {
            message = "Invalid max people ! Max people must be a positive integer !";
        } else if (Double.parseDouble(service.getPoolArea()) < 0) {
            message = "Invalid pool area ! Pool area must be greater than or equal to 0 !";
        } else if (Validation.regexPositiveIntegers(service.getNumberOfFloors())) {
            message = "Invalid number of floor ! Number of floor must be a positive integer !";
        } else message = this.serviceDAO.saveService(service);

        return message;
    }

    @Override
    public List<RentType> findAllRentType() {
        return this.serviceDAO.findAllRentType();
    }

    @Override
    public List<ServiceType> findAllServiceType() {
        return this.serviceDAO.findAllServiceType();
    }

    private boolean testID(String id) {
        List<String> listID = this.serviceDAO.findAllIDService();
        for (String idExist : listID){
            if (idExist.equals(id)) {
                return true;
            }
        }
        return false;
    }
}
