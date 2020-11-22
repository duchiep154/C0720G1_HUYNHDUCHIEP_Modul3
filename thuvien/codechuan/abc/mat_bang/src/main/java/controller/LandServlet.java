package controller;

import bo.LandBO;
import bo.LandBOImpl;
import model.Land;
import model.LandStatus;
import model.LandType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LandServlet", urlPatterns = {"","/land"})
public class LandServlet extends HttpServlet {
    LandBO landBO = new LandBOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String actionLand = request.getParameter("actionLand");
        if (actionLand == null) {
            actionLand = "";
        }
        switch (actionLand) {
            case "createNewLand":
                createNewLand(request, response);
                break;
            case "updateLand":
                updateLand(request, response);
                break;
            case "searchLand":
                searchLand(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String actionLand = request.getParameter("actionLand");
        if (actionLand == null) {
            actionLand = "";
        }
        switch (actionLand) {
            case "showCreateNewLand":
                showCreateNewLand(request, response);
                break;
            case "showEditLand":
                showEditLand(request, response);
                break;
            case "deleteLand":
                deleteLand(request, response);
                break;
            case "showDetailLand":
                showDetailLand(request, response);
            default:
                listLand(request, response);
        }
    }

    private void listLand(HttpServletRequest request, HttpServletResponse response) {
        List<Land> landList = this.landBO.findAllLand();
        List<LandType> landTypeList = this.landBO.findAllLandType();
        List<LandStatus> landStatusList = this.landBO.findAllLandStatus();
        request.setAttribute("landList", landList);
        request.setAttribute("landTypeList", landTypeList);
        request.setAttribute("landStatusList", landStatusList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list-land.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateNewLand(HttpServletRequest request, HttpServletResponse response) {
        List<LandType> landTypeList = this.landBO.findAllLandType();
        request.setAttribute("landTypeList", landTypeList);

        List<LandStatus> landStatusList = this.landBO.findAllLandStatus();
        request.setAttribute("landStatusList", landStatusList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create-new-land.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewLand(HttpServletRequest request, HttpServletResponse response) {
        Land land = informationLand(request);

        String message = this.landBO.save(land);

        if (!message.equals("Create Complete !")) {
            request.setAttribute("land", land);
            request.setAttribute("messageComplete", "Wrong Validate Create !");

            String[] messages = message.split(",");
            for (String element : messages) {
                if (element.contains("ID")) {
                    request.setAttribute("messageID", element);
                }
                if (element.contains("area")) {
                    request.setAttribute("messageArea", element);
                }
                if (element.contains("floor")) {
                    request.setAttribute("messageFloor", element);
                }
                if (element.contains("price")) {
                    request.setAttribute("messagePrice", element);
                }
                if (element.contains("date")) {
                    request.setAttribute("messageDate", element);
                }
            }

        } else {
            request.setAttribute("messageComplete", message);
        }
        //Create chuyển trang
        //showCreateNewLand(request, response);

        // Create Modal
        listLand(request, response);
    }

    private Land informationLand(HttpServletRequest request) {
        String id = request.getParameter("id");
        String area = request.getParameter("area");
        String floor = request.getParameter("floor");
        String price = request.getParameter("price");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String idLandType = request.getParameter("idLandType");
        String idLandStatus = request.getParameter("idLandStatus");

        return new Land(id, area, floor, price, startDate, endDate, idLandType, idLandStatus);
    }

    private void showEditLand(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Land land = this.landBO.findByID(id);
        request.setAttribute("land", land);

        List<LandType> landTypeList = this.landBO.findAllLandType();
        request.setAttribute("landTypeList", landTypeList);

        List<LandStatus> landStatusList = this.landBO.findAllLandStatus();
        request.setAttribute("landStatusList", landStatusList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit-land.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateLand(HttpServletRequest request, HttpServletResponse response) {
        Land land = informationLand(request);

        String message = this.landBO.update(land);

        if (!message.equals("Update Complete !")) {
            String[] messages = message.split(",");
            for (String element : messages) {
                if (element.contains("area")) {
                    request.setAttribute("messageArea", element);
                }
                if (element.contains("floor")) {
                    request.setAttribute("messageFloor", element);
                }
                if (element.contains("price")) {
                    request.setAttribute("messagePrice", element);
                }
                if (element.contains("date")) {
                    request.setAttribute("messageDate", element);
                }
            }

            request.setAttribute("land", land);
            request.setAttribute("messageComplete", "Wrong Validate Edit !");
        } else {
            request.setAttribute("messageComplete", message);
        }
        listLand(request, response);
    }

    private void deleteLand(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        this.landBO.delete(id);
        listLand(request, response);
    }

    private void searchLand(HttpServletRequest request, HttpServletResponse response) {
        String floor = request.getParameter("floorLand");
        String price = request.getParameter("priceLand");
        String landType = request.getParameter("landTypeLand");

        if (price.equals("")&&landType.equals("")) {
            List<Land> landList = this.landBO.findByFloor(floor);
            request.setAttribute("landList", landList);
        } else if (floor.equals("")&&landType.equals("")){
            List<Land> landList = this.landBO.findByPrice(price);
            request.setAttribute("landList", landList);
        } else if (price.equals("")&&floor.equals("")){
            List<Land> landList = this.landBO.findByLandType(landType);
            request.setAttribute("landList", landList);
        } else {
            List<Land> landList = this.landBO.findByFloorAndPriceAndLandType(floor, price,landType);
            request.setAttribute("landList", landList);
        }

        List<LandType> landTypeList = this.landBO.findAllLandType();
        request.setAttribute("landTypeList", landTypeList);

        List<LandStatus> landStatusList = this.landBO.findAllLandStatus();
        request.setAttribute("landStatusList", landStatusList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list-land.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDetailLand(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Land land = this.landBO.findByID(id);
        request.setAttribute("land", land);

        List<LandType> landTypeList = this.landBO.findAllLandType();
        request.setAttribute("landTypeList", landTypeList);

        List<LandStatus> landStatusList = this.landBO.findAllLandStatus();
        request.setAttribute("landStatusList", landStatusList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/view-detail-land.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
