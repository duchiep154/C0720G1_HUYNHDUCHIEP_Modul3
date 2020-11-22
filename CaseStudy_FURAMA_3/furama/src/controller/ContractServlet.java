package controller;

import bo.contract.ContractBO;
import bo.contract.ContractBOImp;
import model.contract.Contract;
import model.customer.Customer;
import model.employee.Employee;
import model.service.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = {"/contract"})
public class ContractServlet extends HttpServlet {
    private ContractBO contractBO = new ContractBOImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String actionFurama = request.getParameter("actionFurama");
        if (actionFurama.equals("createNewContract")) {
            createNewContract(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String actionFurama = request.getParameter("actionFurama");
        if (actionFurama.equals("addNewContract")) {
            addNewContract(request, response);
        }
    }

    private void addNewContract(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employees = this.contractBO.findAllEmployee();
        request.setAttribute("employees", employees);

        List<Customer> customers = this.contractBO.findAllCustomer();
        request.setAttribute("customers", customers);

        List<Service> services = this.contractBO.findAllService();
        request.setAttribute("services", services);

       RequestDispatcher dispatcher = request.getRequestDispatcher("furama/contract/create-new-contract.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewContract(HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String deposit = request.getParameter("deposit");
        String totalMoney = request.getParameter("totalMoney");
        String idEmployee = request.getParameter("employee");
        String idCustomer = request.getParameter("customer");
        String idService = request.getParameter("service");

        Contract contract = new Contract(startDate, endDate, deposit, totalMoney, idEmployee, idCustomer, idService);

        String message = this.contractBO.saveContract(contract);
        request.setAttribute("message", message);

        addNewContract(request, response);
    }
}
