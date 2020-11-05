package controller;

import model.Product;
import service.ProductServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns ="/")
public class ProductServlet extends HttpServlet {
    private ProductServiceImp productService=new ProductServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action== null){
            action=" ";

        }
        switch (action){
            case "create":
                createProduct(request,response);
                break;
            case "edit":
                saveProduct(request,response);
                break;
            default:
                getAllProduct(request,response);

        }

    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = productService.getAllProduct().size() + 1;
       // List<Product> productList=productService.getAllProduct();
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, description, producer);
        productService.saveProduct(product);
        try {
            response.sendRedirect("/home");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = new Product(id,name,price,description,producer);
        productService.saveProduct(product);
        try {
            response.sendRedirect("/home");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action== null){
            action=" ";

        }
        switch (action){
            case "delete":
                deleteProduct(request,response);
                break;
            case "create":
                getPageCreate(request,response);
                break;
            case "edit":
                getPageEdit(request,response);
                break;
            case "search":
                findByName(request,response);
                break;
            default:
                getAllProduct(request,response);

        }

    }

    private void findByName(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = new ArrayList<>();
        String search = request.getParameter("search");
        for (Product product :productService.getAllProduct()){
            if (product.getName().contains(search)) {
                products.add(product);
            }
        }
        if(products.size() !=0 ) {
            request.setAttribute("productList", products);
        } else {
            request.setAttribute("message", "Not Found!!!");
        }

        try {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getPageCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getPageEdit(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        Product product=productService.findById(id);
        request.setAttribute("product",product);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        try {
            response.sendRedirect("/home");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList=productService.getAllProduct();
        request.setAttribute("productList",productList);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("index.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
