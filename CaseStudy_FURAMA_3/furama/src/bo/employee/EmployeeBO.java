package bo.employee;

import model.employee.*;

import java.util.List;

public interface EmployeeBO {
    String saveEmployee (Employee employee);

    List<Employee> findAll();

    Employee findEmployeeById(String id);

    List<Position> findAllPosition();

    List<Division> findAllDivision();

    List<EducationDegree> findAllEducationDegree();

    List<User> findAllUser();

    List<Employee> findByName(String name);

    String updateEmployee(Employee employee);

    void deleteEmployee(String id);
}
