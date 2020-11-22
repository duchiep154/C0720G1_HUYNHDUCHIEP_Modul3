package service;

import repository.StudentRepository;
import repository.StudentRepositoryImpl;
import model.Student;

import java.util.List;

public class StudentServiceImpl implements StudentService {
    private StudentRepository studentRepository = new StudentRepositoryImpl();

    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public void save(Student student) {
        studentRepository.save(student);
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public void update(int id, Student student) {

    }

    @Override
    public void remove(int id) {

    }

    @Override
    public boolean validateStudent() {
        return false;
    }
}
