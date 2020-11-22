package controller;

import bo.service.ServiceBO;
import bo.service.ServiceBOImp;
import model.service.RentType;
import model.service.Service;
import model.service.ServiceType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = {"/service"})
public class ServiceServlet extends HttpServlet {
    private ServiceBO serviceBO = new ServiceBOImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String actionFurama = request.getParameter("actionFurama");
        if (actionFurama.equals("createNewService")) {
            createNewService(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String actionFurama = request.getParameter("actionFurama");
        if (actionFurama.equals("addNewService")) {
            addNewService(request, response);
        }
    }

    private void addNewService(HttpServletRequest request, HttpServletResponse response) {
        List<RentType> rentTypes = this.serviceBO.findAllRentType();
        request.setAttribute("rentTypes", rentTypes);

        List<ServiceType> serviceTypes = this.serviceBO.findAllServiceType();
        request.setAttribute("serviceTypes", serviceTypes);

        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/service/create-new-service.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewService(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String area = request.getParameter("area");
        String cost = request.getParameter("cost");
        String maxPeople = request.getParameter("maxPeople");
        String rentTypeId = request.getParameter("rentTypeId");
        String serviceTypeId = request.getParameter("serviceTypeId");
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        String poolArea = request.getParameter("poolArea");
        String numberOfFloors = request.getParameter("numberOfFloors");

        Service service = new Service(id, name, area, cost, maxPeople, rentTypeId, serviceTypeId, standardRoom, descriptionOtherConvenience,
                poolArea, numberOfFloors);

        String message = this.serviceBO.saveService(service);
        request.setAttribute("message", message);
        if (!message.equals("Create Complete !")) {
            request.setAttribute("service", service);
        }

        addNewService(request, response);
    }
}
