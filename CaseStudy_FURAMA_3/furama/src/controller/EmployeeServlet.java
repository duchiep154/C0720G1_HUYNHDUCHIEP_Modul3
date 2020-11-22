package controller;

import bo.employee.EmployeeBO;
import bo.employee.EmployeeBOImp;
import model.employee.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/employee"})
public class EmployeeServlet extends HttpServlet {
    private EmployeeBO employeeBO = new EmployeeBOImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String actionFurama = request.getParameter("actionFurama");
        if (actionFurama == null) {
            actionFurama = "";
        }
        switch (actionFurama) {
            case "createNewEmployee":
                createNewEmployee(request, response);
                break;
            case "searchEmployee":
                searchEmployee(request, response);
                break;
            case "editEmployee":
                updateEmployee(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String actionFurama = request.getParameter("actionFurama");
        if (actionFurama == null) {
            actionFurama = "";
        }
        switch (actionFurama) {
            case "employeeList":
                employeeTable(request, response);
                break;
            case "showCreateNewEmployee":
                showCreateNewEmployee(request, response);
                break;
            case "showEditEmployee":
                showEditEmployee(request, response);
                break;
            case "deleteEmployee":
                deleteEmployee(request, response);
                break;
        }
    }

    private void employeeTable(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = this.employeeBO.findAll();
        request.setAttribute("employeeList", employeeList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/employee/show-employee-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        support(request);

        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/employee/create-new-employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = informationEmployee(request);

        String message = this.employeeBO.saveEmployee(employee);
        request.setAttribute("message", message);
        if (!message.equals("Create Complete !")) {
            request.setAttribute("employee", employee);
        }

        showCreateNewEmployee(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("idEmployee");
        this.employeeBO.deleteEmployee(id);

        employeeTable(request, response);
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameEmployee");
        List<Employee> employeeList = this.employeeBO.findByName(name);
        request.setAttribute("employeeList", employeeList);

       RequestDispatcher dispatcher = request.getRequestDispatcher("furama/employee/search-list-employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Employee employee = this.employeeBO.findEmployeeById(id);
        request.setAttribute("employee", employee);

        support(request);

        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("furama/employee/show-update-employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = informationEmployee(request);
        String id = request.getParameter("id");
        employee.setId(id);

        String message = this.employeeBO.updateEmployee(employee);
        request.setAttribute("message", message);
        if (!message.equals("Update Complete !")) {
            request.setAttribute("employee", employee);
            RequestDispatcher dispatcher;
            dispatcher = request.getRequestDispatcher("furama/employee/show-update-employee.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else employeeTable(request, response);
    }

    private Employee informationEmployee(HttpServletRequest request) {
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        String idCard = request.getParameter("idCard");
        String salary = request.getParameter("salary");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String position = request.getParameter("position");
        String educationDegree = request.getParameter("educationDegree");
        String division = request.getParameter("division");
        String userName = request.getParameter("user");

        return new Employee(name, birthDay, idCard, salary, phone, email, address, position, educationDegree, division, userName);
    }

    private void support(HttpServletRequest request) {
        List<Position> positions = this.employeeBO.findAllPosition();
        request.setAttribute("positions", positions);

        List<EducationDegree> educationDegrees = this.employeeBO.findAllEducationDegree();
        request.setAttribute("educationDegrees", educationDegrees);

        List<Division> divisions = this.employeeBO.findAllDivision();
        request.setAttribute("divisions", divisions);

        List<User> users = this.employeeBO.findAllUser();
        request.setAttribute("users", users);
    }
}
