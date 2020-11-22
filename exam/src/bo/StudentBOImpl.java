package bo;

import dao.StudentDAO;
import dao.StudentDAOImpl;
import model.Student;

import java.util.List;

public class StudentBOImpl implements StudentBO {

    StudentDAO studentDAO=new StudentDAOImpl();
    @Override
    public List<Student> getAllStudent() {
        return studentDAO.getAllStudent();
    }
}
