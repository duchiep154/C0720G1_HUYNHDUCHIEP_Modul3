package dao.contract;

import dao.BaseDAO;
import model.contract.Contract;
import model.customer.Customer;
import model.employee.Employee;
import model.service.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDAOImp implements ContractDAO {
    private static final String CREATE_NEW_CONTRACT = "insert into contract values (null, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_EMPLOYEE = "select employee_id, employee_name from employee";
    private static final String SELECT_ALL_CUSTOMER = "select customer_id, customer_name from customer";
    private static final String SELECT_ALL_SERVICE = "select service_id, service_name from service";

    @Override
    public String saveContract(Contract contract) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(CREATE_NEW_CONTRACT);
            preparedStatement.setString(1, contract.getStartDate());
            preparedStatement.setString(2, contract.getEndDate());
            preparedStatement.setString(3, contract.getDeposite());
            preparedStatement.setString(4, contract.getTotalMoney());
            preparedStatement.setString(5, contract.getIdEmployee());
            preparedStatement.setString(6, contract.getIdCustomer());
            preparedStatement.setString(7, contract.getIdService());

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
    public List<Employee> findAllEmployee() {
        BaseDAO baseDAO = new BaseDAO();
        List<Employee> employees = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()) {
                String id = resultSet.getString("employee_id");
                String name = resultSet.getString("employee_name");

                employee = new Employee(id, name);
                employees.add(employee);
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
        return employees;
    }

    @Override
    public List<Customer> findAllCustomer() {
        BaseDAO baseDAO = new BaseDAO();
        List<Customer> customers = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()) {
                String id = resultSet.getString("customer_id");
                String name = resultSet.getString("customer_name");

                customer = new Customer(id, name);
                customers.add(customer);
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
        return customers;
    }

    @Override
    public List<Service> findAllService() {
        BaseDAO baseDAO = new BaseDAO();
        List<Service> services = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            Service service;
            while (resultSet.next()) {
                String id = resultSet.getString("service_id");
                String name = resultSet.getString("service_name");

                service = new Service(id, name);
                services.add(service);
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
        return services;
    }
}
