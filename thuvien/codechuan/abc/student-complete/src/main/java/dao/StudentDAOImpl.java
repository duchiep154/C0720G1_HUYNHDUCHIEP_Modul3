package dao;

import model.ClassCodeGym;
import model.Student;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAOImpl implements StudentDAO {
    private static final String SELECT_ALL_STUDENTS = "select * from student";
    private static final String SELECT_STUDENTS_BY_NAME = "select * from student where student_name like ?";
    private static final String SELECT_STUDENT_BY_ID = "select * from student where student_id = ?";
    private static final String SELECT_ALL_CLASS = "select * from class_code_gym";
    private static final String CREATE_NEW_STUDENT = "insert into student values (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_ID_STUDENT = "select student_id from student";

    @Override
    public List<Student> findAllStudent() {
        BaseDAO baseDAO = new BaseDAO();
        List<Student> studentList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_STUDENTS);
            ResultSet resultSet = preparedStatement.executeQuery();
            Student student;
            while (resultSet.next()) {
                String id = resultSet.getString("student_id");
                String name = resultSet.getString("student_name");
                String age = resultSet.getString("age");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String idClass = resultSet.getString("class_id");

                student = new Student(id, name, age, email, phone, address, idClass);
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return studentList;
    }

    @Override
    public Student findByID(String idNeedFind) {
        BaseDAO baseDAO = new BaseDAO();
        Student student = null;

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_STUDENT_BY_ID);
            preparedStatement.setString(1, idNeedFind);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("student_id");
                String name = resultSet.getString("student_name");
                String age = resultSet.getString("age");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String idClass = resultSet.getString("class_id");

                student = new Student(id, name, age, email, phone, address, idClass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return student;
    }

    @Override
    public List<Student> findByName(String nameNeedSearch) {
        BaseDAO baseDAO = new BaseDAO();
        List<Student> studentList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_STUDENTS_BY_NAME);
            preparedStatement.setString(1, '%' + nameNeedSearch + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Student student;
            while (resultSet.next()) {
                String id = resultSet.getString("student_id");
                String name = resultSet.getString("student_name");
                String age = resultSet.getString("age");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String idClass = resultSet.getString("class_id");

                student = new Student(id, name, age, email, phone, address, idClass);
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return studentList;
    }

    @Override
    public String save(Student student) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(CREATE_NEW_STUDENT);
            preparedStatement.setString(1, student.getId());
            preparedStatement.setString(2, student.getName());
            preparedStatement.setString(3, student.getAge());
            preparedStatement.setString(4, student.getEmail());
            preparedStatement.setString(5, student.getPhone());
            preparedStatement.setString(6, student.getAddress());
            preparedStatement.setString(7, student.getIdClass());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Create Complete !";
    }

    @Override
    public String update(Student student) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call update_student(?, ?,?,?,?,?,?)");
            callableStatement.setString(1, student.getId());
            callableStatement.setString(2, student.getName());
            callableStatement.setString(3, student.getAge());
            callableStatement.setString(4, student.getEmail());
            callableStatement.setString(5, student.getPhone());
            callableStatement.setString(6, student.getAddress());
            callableStatement.setString(7, student.getIdClass());

            callableStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Update Complete !";
    }

    @Override
    public void delete(String idNeedDelete) {
        BaseDAO baseDAO = new BaseDAO();
        try {
            CallableStatement callableStatement = baseDAO.getConnection().prepareCall("call delete_student(?)");
            callableStatement.setString(1, idNeedDelete);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<ClassCodeGym> findAllClass() {
        BaseDAO baseDAO = new BaseDAO();
        List<ClassCodeGym> classList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_CLASS);
            ResultSet resultSet = preparedStatement.executeQuery();
            ClassCodeGym classCodeGym;
            while (resultSet.next()) {
                String id = resultSet.getString("class_id");
                String name = resultSet.getString("class_name");

                classCodeGym = new ClassCodeGym(id, name);
                classList.add(classCodeGym);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return classList;
    }

    @Override
    public List<String> findAllIDStudent() {
        BaseDAO baseDAO = new BaseDAO();
        List<String> listID = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseDAO.getConnection().prepareStatement(SELECT_ALL_ID_STUDENT);
            ResultSet resultSet = preparedStatement.executeQuery();
            String id;
            while (resultSet.next()) {
                id = resultSet.getString("student_id");
                listID.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                baseDAO.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listID;
    }
}
