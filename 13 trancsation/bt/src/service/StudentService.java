package service;

import model.Student;

import java.util.List;

public interface StudentService {
    List<Student> findAll();

    void save(Student student);

    Student findById(int id);

    boolean update( Student student);

     boolean remove(int id);

    List<Student> search(String search, String searchBy);


}
