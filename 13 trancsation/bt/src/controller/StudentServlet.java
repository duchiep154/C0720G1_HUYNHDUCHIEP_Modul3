package controller;

import model.Student;
import service.StudentService;
import service.StudentServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "StudentServlet",urlPatterns = "/student")
public class StudentServlet extends HttpServlet {
    private StudentService studentService = new StudentServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertStudent(request, response);
                showListStudent(request, response);
                break;
            case "edit":
                updateStudent(request, response);
                break;
            default:
                showListStudent(request, response);

        }

    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Student student = new Student(id, name, email, phone);
//
        studentService.update(student);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("student/edit.jsp");
//        dispatcher.forward(request, response);
        response.sendRedirect("/student");
    }

    private void insertStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

       Student student= new Student( name, email, phone);
        studentService.save(student);

    }

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
                searchStudent(request,response);
                break;
            case "update":
                showEditForm(request,response);
                break;
            case "delete":
                deleteStudent(request,response);

                break;
            default:
                showListStudent(request, response);
        }

    }

    private void searchStudent(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        String findBy = request.getParameter("findBy");
        List<Student> listStudent = studentService.search(search, findBy);

        request.setAttribute("listStudent", listStudent);
        try {
            request.getRequestDispatcher("student/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));


        Student existingStudent = studentService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/update.jsp");
        request.setAttribute("student", existingStudent);
        dispatcher.forward(request, response);

    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
//
        studentService.remove(id);


//
        response.sendRedirect("/student");

    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> listStudent = studentService.findAll();
        // day data ve JSP
        request.setAttribute("listStudent", listStudent);
        System.out.println(listStudent);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/list.jsp");
        dispatcher.forward(request, response);
    }


    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/create.jsp");
        dispatcher.forward(request, response);

//
        showListStudent(request, response);
    }


}
