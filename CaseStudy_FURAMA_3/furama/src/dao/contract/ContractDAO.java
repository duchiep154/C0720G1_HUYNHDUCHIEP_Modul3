package dao.contract;

import model.contract.Contract;
import model.customer.Customer;
import model.employee.Employee;
import model.service.Service;

import java.util.List;

public interface ContractDAO {
    String saveContract(Contract contract);

    List<Employee> findAllEmployee();

    List<Customer> findAllCustomer();

    List<Service> findAllService();
}
