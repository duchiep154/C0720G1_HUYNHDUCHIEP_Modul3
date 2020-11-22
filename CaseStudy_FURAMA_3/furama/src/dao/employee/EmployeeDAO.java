package dao.employee;

import model.employee.*;

import java.util.List;

public interface EmployeeDAO {
    String saveEmployee (Employee employee);

    List<Employee> findAll();

    List<Position> findAllPosition();

    List<Division> findAllDivision();

    List<EducationDegree> findAllEducationDegree();

    List<User> findAllUser();

    Employee findEmployeeById(String id);

    List<Employee> findByName(String name);

    String updateEmployee(Employee employee);

    void deleteEmployee(String id);
}
