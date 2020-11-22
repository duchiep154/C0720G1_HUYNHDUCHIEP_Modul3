package bo;

import model.ClassCodeGym;
import model.Student;

import java.util.List;

public interface StudentBO {
    List<Student> findAllStudent();

    Student findByID(String id);

    List<Student> findByName(String name);

    String save(Student student);

    String update(Student student);

    void delete(String id);

    List<ClassCodeGym> findAllClass();
}
