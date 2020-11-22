package controller;

import model.Category;
import model.Product;
import service.ProductService;
import service.ProductServiceImp;
import sun.plugin.com.Dispatcher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    ProductService productService=new ProductServiceImp();




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionProduct = request.getParameter("actionProduct");
        if (actionProduct == null) {
            actionProduct = "";
        }
        switch (actionProduct) {
            case "createNewProduct":
                createNewProduct(request, response);
                break;
            case "updateProduct":
                try {
                    updateProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "searchProduct":
                searchProduct(request, response);
                break;
        }

    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameProduct");
        List<Product> productList = this.productService.findByName(name);
        request.setAttribute("productList", productList);
        List<Category> categoryList = this.productService.findAllCategory();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/search-product.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        Product product = informationProduct(request);

        String message = this.productService.update(product);

        if (!message.equals("Update Complete !")) {

            String[] messages = message.split(",");
            for (String element : messages) {
                if (element.contains("price")) {
                    request.setAttribute("messagePrice", element);
                }
                if (element.contains("quantity")) {
                    request.setAttribute("messageQuantity", element);
                }
            }

            List<Category> categoryList = this.productService.findAllCategory();
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("product", product);

            RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit-product.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("messageComplete", message);
            listProduct(request, response);
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Product product = informationProduct(request);

        String message = this.productService.save(product);

        if (!message.equals("Create Complete !")) {
            request.setAttribute("product", product);

            String[] messages = message.split(",");
            for (String element : messages) {
                if (element.contains("ID")) {
                    request.setAttribute("messageID", element);
                }
                if (element.contains("price")) {
                    request.setAttribute("messagePrice", element);
                }
                if (element.contains("quantity")) {
                    request.setAttribute("messageQuantity", element);
                }
            }
        } else {
            request.setAttribute("messageComplete", message);
        }

//        showCreateNewProduct(request, response);
        //listProduct(request, response);
        response.sendRedirect("/product");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionProduct = request.getParameter("actionProduct");
        if (actionProduct == null) {
            actionProduct = "";
        }
        switch (actionProduct) {
            case "showCreateNewProduct":
                showCreateNewProduct(request, response);
                break;
            case "showEditProduct":
                showEditProduct(request, response);
                break;
            case "deleteProduct":
                deleteProduct(request, response);
                break;
            case "showDetailProduct":
                try {
                    showDetailProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                try {
                    listProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }

    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> productList = this.productService.findAllProduct();
        List<Category> categoryList = this.productService.findAllCategory();
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list-product.jsp");
        dispatcher.forward(request, response);

    }

    private void showDetailProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String id = request.getParameter("id");
        Product product = this.productService.findByID(id);
        request.setAttribute("product", product);

        List<Category> categoryList = this.productService.findAllCategory();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/detail-product.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        this.productService.delete(id);
        response.sendRedirect("/product");
    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Product product = null;
        try {
            product = this.productService.findByID(id);
            request.setAttribute("product", product);

            List<Category> categoryList = this.productService.findAllCategory();
            request.setAttribute("categoryList", categoryList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit-product.jsp");
            dispatcher.forward(request, response);

        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
        }
    }

    private void showCreateNewProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categoryList = this.productService.findAllCategory();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create-newproduct.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private Product informationProduct(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        return new Product(id, name, price, quantity, color, description, category);
    }

}
