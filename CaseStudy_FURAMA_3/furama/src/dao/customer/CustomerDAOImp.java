package dao.customer;

import dao.BaseDAO;
import model.customer.Customer;
import model.customer.TypeCustomer;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAOImp implements CustomerDAO {
    BaseDAO baseDAO = new BaseDAO();
    private static final String SELECT_ALL_CUSTOMERS = "select customer_id, customer_name, customer_birthday, customer_gender, customer_email, " +
            "customer_address from customer";

    private static final String SELECT_ALL_TYPE_CUSTOMER = "select * from customer_type";

    private static final String CREATE_NEW_CUSTOMER = "insert into customer values (?,?,?,?,?,?,?,?,?)";

    private static final String SEARCH_CUSTOMERS = "select customer_id, customer_name, customer_birthday, customer_gender, " +
            "customer_email, customer_address from customer where customer_name like ?";

    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(SELECT_ALL_CUSTOMERS);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()) {
                String id = resultSet.getString("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");

                customer = new Customer(id, name, birthday, gender, email, address);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List<TypeCustomer> findAllTypeCustomer() {
        List<TypeCustomer> typeCustomers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(SELECT_ALL_TYPE_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            TypeCustomer typeCustomer;
            while (resultSet.next()) {
                String id = resultSet.getString("customer_type_id");
                String name = resultSet.getString("customer_type_name");

                typeCustomer = new TypeCustomer(id, name);
                typeCustomers.add(typeCustomer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return typeCustomers;
    }

    @Override
    public String saveCustomer(Customer customer) {
        try {
            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(CREATE_NEW_CUSTOMER);
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setString(9, customer.getType());
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Create Complete";
    }

    public Customer findCustomerById(String idNeedFind) {
        Customer customer = null;
        try {
            CallableStatement callableStatement = this.baseDAO.getConnection().prepareCall("call find_customer_by_id(?)");
            callableStatement.setString(1, idNeedFind);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phoneNumber = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                String typeOfCustomer = resultSet.getString("customer_type_id");

                customer = new Customer(id, name, birthday, gender, idCard, phoneNumber, email, address, typeOfCustomer);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public void deleteCustomer(String idNeedDelete) {
        try {
            CallableStatement callableStatement = this.baseDAO.getConnection().prepareCall("call delete_customer(?)");
            callableStatement.setString(1, idNeedDelete);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String updateCustomer(Customer customer) {
        try {
            CallableStatement callableStatement = this.baseDAO.getConnection().prepareCall("call update_customer(?,?,?,?,?,?,?,?,?)");
            callableStatement.setString(1, customer.getId());
            callableStatement.setString(2, customer.getName());
            callableStatement.setString(3, customer.getBirthday());
            callableStatement.setString(4, customer.getGender());
            callableStatement.setString(5, customer.getIdCard());
            callableStatement.setString(6, customer.getPhone());
            callableStatement.setString(7, customer.getEmail());
            callableStatement.setString(8, customer.getAddress());
            callableStatement.setString(9, customer.getType());

            callableStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Update Complete !";
    }

    @Override
    public List<Customer> findByName(String nameNeedSearch) {
        List<Customer> customerList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(SEARCH_CUSTOMERS);
            preparedStatement.setString(1, '%' + nameNeedSearch + '%');

            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()) {
                String id = resultSet.getString("customer_id");
                String name = resultSet.getString("customer_name");
                String birthDay = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");

                customer = new Customer(id, name, birthDay, gender, email, address);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }
}
