package controller;

import bo.CategoryBO;
import bo.CategoryBOImpl;
import bo.ProductBO;
import bo.ProductBOImpl;
import common.Validate;
import model.Category;
import model.Product;
import sun.plugin.com.Dispatcher;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns ="/view")
public class ProductServlet extends HttpServlet {
    private ProductBO productBO = new ProductBOImpl();
    private CategoryBO categoryBO=new CategoryBOImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        switch (action) {
            case "edit":
//                editProductInfo(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "create":
               createProduct(request, response);
                break;
            default:
                break;
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id=request.getParameter("id");
        String message=productBO.deleteProduct(Integer.parseInt(id));
       request.setAttribute("messageInform", message);
        try {
            showProductList(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        Product product = informationProduct(request);

        String message = this.productBO.create(product);

        if (!message.equals("Create Complete !")) {
            request.setAttribute("product", product);

            String[] messages = message.split(",");
            for (String element : messages) {

                if (element.contains("price")) {
                    request.setAttribute("messagePrice", element);
                }
                if (element.contains("quantity")) {
                    request.setAttribute("messageQuantity", element);
                }
            }
        } else {
            request.setAttribute("messageComplete", message);
            try {
                showProductList(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("view/view.jsp");
//        try {
//            dispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }


//        showProductCreateForm(request, response);
    }

    private Product informationProduct(HttpServletRequest request) {

        String name = request.getParameter("name");
        String price =request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int idCategory =Integer.parseInt(request.getParameter("category")) ;


        Product product= new Product( name, price, quantity, color, description, idCategory);
        System.out.println(product);

        return product;

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showProductEditForm(request, response);
                break;
            case "detail":
                showDetail(request, response);
                break;
            case "create":
                showProductCreateForm(request, response);
                break;
            case "search":
                showProductSearch(request, response);
                break;
            default:
                try {
                    showProductList(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }

    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showProductDeleteForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showProductCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categoryList = this.productBO.findAllCategory();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showProductSearch(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        List<Product> productList = this.productBO.findAllProduct();
        List<Category> categoryList = this.productBO.findAllCategory();
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showProductEditForm(HttpServletRequest request, HttpServletResponse response) {
    }
}
