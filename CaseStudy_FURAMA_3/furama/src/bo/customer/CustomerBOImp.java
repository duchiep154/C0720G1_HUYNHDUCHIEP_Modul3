package bo.customer;

import common.Validation;
import dao.customer.CustomerDAO;
import dao.customer.CustomerDAOImp;
import model.customer.Customer;
import model.customer.TypeCustomer;

import java.util.List;

public class CustomerBOImp implements CustomerBO {
    CustomerDAO customerDAO = new CustomerDAOImp();
    @Override
    public List<Customer> findAll() {
        return this.customerDAO.findAll();
    }

    @Override
    public List<TypeCustomer> findAllTypeCustomer() {
        return this.customerDAO.findAllTypeCustomer();
    }

    @Override
    public List<Customer> findByName(String name) {
        return this.customerDAO.findByName(name);
    }

    @Override
    public String saveCustomer(Customer customer) {
        String message;
        if (!Validation.regexIDCustomer(customer.getId())) {
            message = "Invalid ID ! Format ID is KH-XXXX with X is number from 0 to 9 !";
        } else if (testID(customer.getId())) {
            message = "Invalid ID ! ID is exists ! Please input ID other !";
        } else if (Validation.regexIDCard(customer.getIdCard())) {
            message = "Invalid ID card ! Format ID Card is XXXXXXXXX or XXXXXXXXXXXX with X is number from 0 to 9 !";
        } else if (Validation.regexPhoneNumber(customer.getPhone())) {
            message = "Invalid phone number ! Format phone number is 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or " +
                    "(84)+91xxxxxxx with x is number from 0 to 9 !";
        } else if (Validation.regexEmail(customer.getEmail())) {
            message = "Invalid email ! Format email is abc@abc.abc !";
        } else message = this.customerDAO.saveCustomer(customer);

        return message;
    }

    @Override
    public Customer findCustomerById(String id) {
        return this.customerDAO.findCustomerById(id);
    }

    @Override
    public void deleteCustomer(String id) {
        this.customerDAO.deleteCustomer(id);
    }

    @Override
    public String updateCustomer(Customer customer) {
        String message;
        if (Validation.regexIDCard(customer.getIdCard())) {
            message = "Invalid ID card ! Format ID Card is XXXXXXXXX or XXXXXXXXXXXX with X is number from 0 to 9 !";
        } else if (Validation.regexPhoneNumber(customer.getPhone())) {
            message = "Invalid phone number ! Format phone number is 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or " +
                    "(84)+91xxxxxxx with x is number from 0 to 9 !";
        } else if (Validation.regexEmail(customer.getEmail())) {
            message = "Invalid email ! Format email is abc@abc.abc !";
        } else message = this.customerDAO.updateCustomer(customer);
        return message;
    }

    private boolean testID(String id) {
        List<Customer> customerList = findAll();
        for (Customer customer : customerList){
            if (customer.getId().equals(id)) {
                return true;
            }
        }
        return false;
    }
}
