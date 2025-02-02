package controller;

import service.StudentService;
import service.StudentServiceImpl;
import model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"", "/student"})
public class StudentServlet extends HttpServlet {
    private StudentService studentService = new StudentServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "view":
                break;
            case "update":
                break;
            case "delete":
                System.out.println("Da thuc hien chuc nang xoa");
                showListStudent(request, response);
                break;
            default:
                showListStudent(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createStudent(request, response);
                break;
            case "update":
                break;
            default:
                showListStudent(request, response);
        }
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("studentName");
        String address = request.getParameter("studentAddress");

        Student student = new Student(name, address);
        studentService.save(student);

//        request.setAttribute("student", student);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/complete.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        showListStudent(request, response);
    }


    private void showListStudent(HttpServletRequest request, HttpServletResponse response) {
        List<Student> studentList = studentService.findAll();
        request.setAttribute("studentListServlet", studentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("student/create.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
