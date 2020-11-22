package controller;

import bo.StudentBO;
import bo.StudentBOImpl;
import model.ClassCodeGym;
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
    StudentBO studentBO = new StudentBOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String actionStudent = request.getParameter("actionStudent");
        if (actionStudent == null) {
            actionStudent = "";
        }
        switch (actionStudent) {
            case "createNewStudent":
                createNewStudent(request, response);
                break;
            case "updateStudent":
                updateStudent(request, response);
                break;
            case "searchStudent":
                searchStudent(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String actionStudent = request.getParameter("actionStudent");
        if (actionStudent == null) {
            actionStudent = "";
        }
        switch (actionStudent) {
            case "showCreateNewStudent":
                showCreateNewStudent(request, response);
                break;
            case "showEditStudent":
                showEditStudent(request, response);
                break;
            case "deleteStudent":
                deleteStudent(request, response);
                break;
            case "showDetailStudent":
                showDetailStudent(request, response);
            default:
                listStudent(request, response);
        }
    }

    private void listStudent(HttpServletRequest request, HttpServletResponse response) {
        List<Student> studentList = this.studentBO.findAllStudent();
        List<ClassCodeGym> classList = this.studentBO.findAllClass();
        request.setAttribute("studentList", studentList);
        request.setAttribute("classList", classList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list-student.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateNewStudent(HttpServletRequest request, HttpServletResponse response) {
        List<ClassCodeGym> classList = this.studentBO.findAllClass();
        request.setAttribute("classList", classList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create-new-student.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewStudent(HttpServletRequest request, HttpServletResponse response) {
        Student student = informationStudent(request);

        String message = this.studentBO.save(student);

        if (!message.equals("Create Complete !")) {
            request.setAttribute("student", student);

            String[] messages = message.split(",");
            for (String element : messages) {
                if (element.contains("ID")) {
                    request.setAttribute("messageID", element);
                }
                if (element.contains("age")) {
                    request.setAttribute("messageAge", element);
                }
                if (element.contains("email")) {
                    request.setAttribute("messageEmail", element);
                }
                if (element.contains("phone")) {
                    request.setAttribute("messagePhone", element);
                }
            }

        } else {
            request.setAttribute("messageComplete", message);
        }
        showCreateNewStudent(request, response);
        //listStudent(request, response);
    }

    private Student informationStudent(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String classCodeGym = request.getParameter("classCodeGym");

        return new Student(id, name, age, email, phone, address, classCodeGym);
    }

    private void showEditStudent(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Student student = this.studentBO.findByID(id);
        request.setAttribute("student", student);

        List<ClassCodeGym> classList = this.studentBO.findAllClass();
        request.setAttribute("classList", classList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit-student.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) {
        Student student = informationStudent(request);

        String message = this.studentBO.update(student);

        if (!message.equals("Update Complete !")) {

            String[] messages = message.split(",");
            for (String element : messages) {
                if (element.contains("age")) {
                    request.setAttribute("messageAge", element);
                }
                if (element.contains("email")) {
                    request.setAttribute("messageEmail", element);
                }
                if (element.contains("phone")) {
                    request.setAttribute("messagePhone", element);
                }
            }

            List<ClassCodeGym> classList = this.studentBO.findAllClass();
            request.setAttribute("classList", classList);

            request.setAttribute("student", student);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit-student.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("messageComplete", message);
            listStudent(request, response);
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        this.studentBO.delete(id);
        listStudent(request, response);
    }

    private void searchStudent(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameStudent");

        List<Student> studentList = this.studentBO.findByName(name);
        request.setAttribute("studentList", studentList);

        List<ClassCodeGym> classList = this.studentBO.findAllClass();
        request.setAttribute("classList", classList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/search-student.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDetailStudent(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Student student = this.studentBO.findByID(id);
        request.setAttribute("student", student);

        List<ClassCodeGym> classList = this.studentBO.findAllClass();
        request.setAttribute("classList", classList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/view-detail-student.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
