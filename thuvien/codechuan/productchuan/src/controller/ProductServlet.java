package controller;

import common.Validation;
import model.Category;
import model.Product;
import service.CategoryService;
import service.CategoryServiceImp;
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
import java.sql.SQLOutput;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = "/home")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService productService=new ProductServiceImp();
    CategoryService categoryService=new CategoryServiceImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                edit(request, response);
                break;
            case "search" :
                search(request,response);
        }

    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
//        String name = request.getParameter("name");
//        List<Product> productList = productService.findByName(name);
//        request.setAttribute("productList", productList);
//        List<Category> categoryList = productService.findAllCategory();
//        request.setAttribute("categoryList", categoryList);
//        System.out.println(productList);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }

        String search = request.getParameter("search");
        String findBy = request.getParameter("findBy");
        List<Product> productList = productService.search(search, findBy);
        request.setAttribute("productList", productList);
        List<Category> categoryList = productService.findAllCategory();
        request.setAttribute("categoryList", categoryList);
        System.out.println(productList);


        try {
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int idCategory=Integer.parseInt(request.getParameter("category"));
        Product product=new Product(name, price, quantity, color, description, idCategory);
        String message = null;

        message = this.productService.save(product);
        System.out.println(message);
        if (!message.equals("create complete")) {
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

            List<Category> categoryList = this.productService.findAllCategory();
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("product", product);

            RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("messageComplete", message);
            try {
                listProduct(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
   }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int idCategory=Integer.parseInt(request.getParameter("category"));
        Product product=new Product(id, name, price, quantity, color, description, idCategory);

        String message = null;
        try {
            message = productService.editProduct(product);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (!message.equals("update completed !")) {

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

            RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("messageComplete", message);
            try {
                listProduct(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showCreate":
                showNewForm(request, response);
                break;
            case "showEdit":
                showEditForm(request, response);
                break;
            case "delete":
                try {
                    deleteProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "detail":
                showDetail(request,response);
            default:
                try {
                    listProduct(request, response);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                break;
        }

    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) {
        int id =Integer.parseInt(request.getParameter("id")) ;
        Product product = productService.findByID(id);
        request.setAttribute("product", product);

        List<Category> categoryList = productService.findAllCategory();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("detail.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> productList = productService.getListProduct();
        request.setAttribute("productList", productList);
        List<Category> categoryList=productService.findAllCategory();
        request.setAttribute("categoryList",categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        dispatcher.forward(request, response);

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            this.productService.deleteProduct(id);
            listProduct(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = null;
        try {
            product =productService.findByID(id);
            request.setAttribute("product", product);
            List<Category> categoryList =productService.findAllCategory();
            request.setAttribute("categoryList", categoryList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
            dispatcher.forward(request, response);

        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categoryList = this.productService.findAllCategory();
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        dispatcher.forward(request, response);

    }
    private Product informationProduct(HttpServletRequest request){

        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int idCategory=Integer.parseInt(request.getParameter("category"));
        Product product=new Product( name, price, quantity, color, description, idCategory);
        return product;
    }

}
