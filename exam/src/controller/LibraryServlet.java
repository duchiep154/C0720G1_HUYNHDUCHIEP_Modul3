package controller;

import bo.*;
import model.Book;
import model.Student;
import model.TheMuonSach;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LibraryServlet",urlPatterns = "/home")
public class LibraryServlet extends HttpServlet {
    BookBO bookBO=new BookBOImpl();
    StudentBO studentBO=new StudentBOImpl();
    TheMuonSachBO theMuonSachBO=new TheMuonSachBOImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showThe":
                showTheMuon(request, response);
                break;
//            case "showEdit":
//                showEditForm(request, response);
//                break;
//            case "delete":
//                try {
//                    deleteProduct(request, response);
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//                break;
//            case "detail":
//                showDetail(request,response);
            default:
                listBook(request, response);
                break;
        }

    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) {
        List<Book> bookList = bookBO.getAllBook();
        request.setAttribute("bookList", bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listSach.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showTheMuon(HttpServletRequest request, HttpServletResponse response) {
        List<TheMuonSach> theMuonSachList=theMuonSachBO.getAllTheMuonSach();
        request.setAttribute("theMuonSachList",theMuonSachList);
        List<Book> bookList = bookBO.getAllBook();
        request.setAttribute("bookList", bookList);
        List<Student> studentList=studentBO.getAllStudent();
        request.setAttribute("studentList",studentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("themuonsach.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
