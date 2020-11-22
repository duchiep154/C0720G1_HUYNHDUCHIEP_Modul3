package bo.employee;

import common.Validation;
import dao.employee.EmployeeDAO;
import dao.employee.EmployeeDAOImp;
import model.employee.*;

import java.util.List;

public class EmployeeBOImp implements EmployeeBO {
    EmployeeDAO employeeDAO = new EmployeeDAOImp();

    @Override
    public String saveEmployee(Employee employee) {
        String message;

        if (Validation.regexIDCard(employee.getIdCard())) {
            message = "Invalid ID card ! Format ID Card is XXXXXXXXX or XXXXXXXXXXXX with X is number from 0 to 9 !";
        } else if (Validation.regexPositiveNumbers(employee.getSalary())) {
            message = "Invalid salary ! Salary must be a positive number !";
        } else if (Validation.regexPhoneNumber(employee.getPhone())) {
            message = "Invalid phone number ! Format phone number is 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or " +
                    "(84)+91xxxxxxx with x is number from 0 to 9 !";
        } else if (Validation.regexEmail(employee.getEmail())) {
            message = "Invalid email ! Format email is abc@abc.abc !";
        } else message = this.employeeDAO.saveEmployee(employee);;
        return message;
    }

    @Override
    public List<Employee> findAll() {
        return this.employeeDAO.findAll();
    }

    @Override
    public Employee findEmployeeById(String id) {
        return this.employeeDAO.findEmployeeById(id);
    }

    @Override
    public List<Position> findAllPosition() {
        return this.employeeDAO.findAllPosition();
    }

    @Override
    public List<Division> findAllDivision() {
        return this.employeeDAO.findAllDivision();
    }

    @Override
    public List<EducationDegree> findAllEducationDegree() {
        return this.employeeDAO.findAllEducationDegree();
    }

    @Override
    public List<User> findAllUser() {
        return this.employeeDAO.findAllUser();
    }

    @Override
    public List<Employee> findByName(String name) {
        return this.employeeDAO.findByName(name);
    }

    @Override
    public String updateEmployee(Employee employee) {
        String message;
        if (Validation.regexIDCard(employee.getIdCard())) {
            message = "Invalid ID card ! Format ID Card is XXXXXXXXX or XXXXXXXXXXXX with X is number from 0 to 9 !";
        } else if (Validation.regexPositiveNumbers(employee.getSalary())) {
            message = "Invalid salary ! Salary must be a positive number !";
        } else if (Validation.regexPhoneNumber(employee.getPhone())) {
            message = "Invalid phone number ! Format phone number is 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or " +
                    "(84)+91xxxxxxx with x is number from 0 to 9 !";
        } else if (Validation.regexEmail(employee.getEmail())) {
            message = "Invalid email ! Format email is abc@abc.abc !";
        } else message = this.employeeDAO.updateEmployee(employee);
        return message;
    }

    @Override
    public void deleteEmployee(String id) {
        this.employeeDAO.deleteEmployee(id);
    }
}
