package dao.service;

import bo.service.ServiceBO;
import dao.BaseDAO;
import model.service.RentType;
import model.service.Service;
import model.service.ServiceType;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAOImp implements ServiceDAO {
    private static final String CREATE_NEW_SERVICE = "insert into service values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_RENT_TYPE = "select * from rent_type";
    private static final String SELECT_ALL_SERVICE_TYPE = "select * from service_type";
    private static final String SELECT_ALL_ID_SERVICE = "select service_id from service";

    @Override
    public String saveService(Service service) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(CREATE_NEW_SERVICE);
            preparedStatement.setString(1, service.getId());
            preparedStatement.setString(2, service.getName());
            preparedStatement.setString(3, service.getArea());
            preparedStatement.setString(4, service.getCost());
            preparedStatement.setString(5, service.getMaxPeople());
            preparedStatement.setString(6, service.getStandardRoom());
            preparedStatement.setString(7, service.getDescriptionOtherConvenience());
            preparedStatement.setString(8, service.getPoolArea());
            preparedStatement.setString(9, service.getNumberOfFloors());
            preparedStatement.setString(10, service.getRentTypeId());
            preparedStatement.setString(11, service.getServiceTypeId());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Create Complete !";
    }

    @Override
    public List<RentType> findAllRentType() {
        BaseDAO baseDAO = new BaseDAO();
        List<RentType> rentTypes = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_RENT_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            RentType rentType;
            while (resultSet.next()) {
                String id = resultSet.getString("rent_type_id");
                String name = resultSet.getString("rent_type_name");

                rentType = new RentType(id, name);
                rentTypes.add(rentType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rentTypes;
    }

    @Override
    public List<ServiceType> findAllServiceType() {
        BaseDAO baseDAO = new BaseDAO();
        List<ServiceType> serviceTypes = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_SERVICE_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            ServiceType serviceType;
            while (resultSet.next()) {
                String id = resultSet.getString("service_type_id");
                String name = resultSet.getString("service_type_name");

                serviceType = new ServiceType(id, name);
                serviceTypes.add(serviceType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return serviceTypes;
    }

    @Override
    public List<String> findAllIDService() {
        BaseDAO baseDAO = new BaseDAO();
        List<String> listID = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_ID_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            String id;
            while (resultSet.next()) {
                id = resultSet.getString("service_id");
                listID.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listID;
    }
}
