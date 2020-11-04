package dao;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class Manager {
    static List<Customer> customerList=new ArrayList<>();

    static {
        customerList.add(new Customer("huynh duc hiep","15/04/1990","da nang","image/image.jpg"));
        customerList.add(new Customer("huynh duc hiep2","15/04/1990","da nang","image/image.jpg"));
        customerList.add(new Customer("huynh duc hiep3","15/04/1990","da nang","image/image.jpg"));
        customerList.add(new Customer("huynh duc hiep4","15/04/1990","da nang","image/image.jpg"));
        customerList.add(new Customer("huynh duc hiep5","15/04/1990","da nang","image/image.jpg"));
        customerList.add(new Customer("huynh duc hiep6","15/04/1990","da nang","image/image.jpg"));
    }
    public static List<Customer> getCustomer() {
        return customerList;
    }
}
