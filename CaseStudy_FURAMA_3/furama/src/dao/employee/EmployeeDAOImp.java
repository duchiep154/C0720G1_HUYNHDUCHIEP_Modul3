package dao.employee;

import dao.BaseDAO;
import model.employee.*;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAOImp implements EmployeeDAO {
    private static final String CREATE_NEW_EMPLOYEE = "insert into employee values(null,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_EMPLOYEE = "select employee_id, employee_name, employee_salary, employee_phone, employee_email, " +
            "employee_address from employee";
    private static final String SEARCH_EMPLOYEE = "select employee_id, employee_name, employee_salary, employee_phone, employee_email, " +
            "employee_address from employee where employee_name like ?";
    private static final String SELECT_ALL_POSITION = "select * from position";
    private static final String SELECT_ALL_DIVISION = "select * from division";
    private static final String SELECT_ALL_EDUCATION_DEGREE = "select * from education_degree";
    private static final String SELECT_ALL_USER = "select user_name from user";

    @Override
    public String saveEmployee(Employee employee) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(CREATE_NEW_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthDay());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setString(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setString(8, employee.getIdPosition());
            preparedStatement.setString(9, employee.getIdEducationDegree());
            preparedStatement.setString(10, employee.getIdDivision());
            preparedStatement.setString(11, employee.getUserName());

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
    public List<Employee> findAll() {
        BaseDAO baseDAO = new BaseDAO();
        List<Employee> employeeList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()) {
                String id = resultSet.getString("employee_id");
                String name = resultSet.getString("employee_name");
                String salary = resultSet.getString("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");

                employee = new Employee(id, name, salary, phone, email, address);
                employeeList.add(employee);
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
        return employeeList;
    }

    @Override
    public List<Position> findAllPosition() {
        BaseDAO baseDAO = new BaseDAO();
        List<Position> positions = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_POSITION);
            ResultSet resultSet = preparedStatement.executeQuery();
            Position position;
            while (resultSet.next()) {
                String id = resultSet.getString("position_id");
                String name = resultSet.getString("position_name");

                position = new Position(id, name);
                positions.add(position);
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
        return positions;
    }

    @Override
    public List<Division> findAllDivision() {
        BaseDAO baseDAO = new BaseDAO();
        List<Division> divisions = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_DIVISION);
            ResultSet resultSet = preparedStatement.executeQuery();
            Division division;
            while (resultSet.next()) {
                String id = resultSet.getString("division_id");
                String name = resultSet.getString("division_name");

                division = new Division(id, name);
                divisions.add(division);
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
        return divisions;
    }

    @Override
    public List<EducationDegree> findAllEducationDegree() {
        BaseDAO baseDAO = new BaseDAO();
        List<EducationDegree> educationDegrees = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_EDUCATION_DEGREE);
            ResultSet resultSet = preparedStatement.executeQuery();
            EducationDegree educationDegree;
            while (resultSet.next()) {
                String id = resultSet.getString("education_degree_id");
                String name = resultSet.getString("education_degree_name");

                educationDegree = new EducationDegree(id, name);
                educationDegrees.add(educationDegree);
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
        return educationDegrees;
    }

    @Override
    public List<User> findAllUser() {
        BaseDAO baseDAO = new BaseDAO();
        List<User> users = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            User user;
            while (resultSet.next()) {
                String name = resultSet.getString("user_name");

                user = new User(name);
                users.add(user);
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
        return users;
    }

    @Override
    public Employee findEmployeeById(String idNeedFind) {
        BaseDAO baseDAO = new BaseDAO();
        Employee employee = null;
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call find_employee_by_id(?)");
            callableStatement.setString(1, idNeedFind);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("employee_id");
                String name = resultSet.getString("employee_name");
                String birthDay = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                String salary = resultSet.getString("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                String idPosition = resultSet.getString("position_id");
                String idEducationDegree = resultSet.getString("education_degree_id");
                String idDivision = resultSet.getString("division_id");
                String userName = resultSet.getString("user_name");

                employee = new Employee(id, name, birthDay, idCard, salary, phone, email, address, idPosition,
                        idEducationDegree, idDivision, userName);
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
        return employee;
    }

    @Override
    public List<Employee> findByName(String nameNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Employee> employeeListResult = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SEARCH_EMPLOYEE);
            preparedStatement.setString(1, '%' + nameNeedSearch + '%');

            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()) {
                String id = resultSet.getString("employee_id");
                String name = resultSet.getString("employee_name");
                String salary = resultSet.getString("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");

                employee = new Employee(id, name, salary, phone, email, address);
                employeeListResult.add(employee);
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
        return employeeListResult;
    }

    @Override
    public String updateEmployee(Employee employee) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call update_employee(?,?,?,?,?,?,?,?,?,?,?,?)");
            callableStatement.setString(1, employee.getId());
            callableStatement.setString(2, employee.getName());
            callableStatement.setString(3, employee.getBirthDay());
            callableStatement.setString(4, employee.getIdCard());
            callableStatement.setString(5, employee.getSalary());
            callableStatement.setString(6, employee.getPhone());
            callableStatement.setString(7, employee.getEmail());
            callableStatement.setString(8, employee.getAddress());
            callableStatement.setString(9, employee.getIdPosition());
            callableStatement.setString(10, employee.getIdEducationDegree());
            callableStatement.setString(11, employee.getIdDivision());
            callableStatement.setString(12, employee.getUserName());

            callableStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Update Complete !";
    }

    @Override
    public void deleteEmployee(String idNeedDelete) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call delete_employee(?)");
            callableStatement.setString(1, idNeedDelete);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
