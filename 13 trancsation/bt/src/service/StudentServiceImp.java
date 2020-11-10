package service;

import model.Student;
import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentServiceImp implements StudentService{

    private static final String INSERT_STUDENT_SQL = "INSERT INTO student(name,email,phone) VALUES(?,?,?)";
    private static final String SEARCH_BY_NAME = "SELECT * FROM student WHERE name LIKE ?;";
    private static final String SEARCH_BY_ID = "SELECT * FROM student WHERE id LIKE ?;";


    private static final String SELECT_STUDENT_BY_ID = "select id,name,email,phone from student where id =?";
    private static final String SELECT_ALL_STUDENT = "select * from student;";
    private static final String DELETE_STUDENT_SQL = "delete from student where id = ?";
    private static final String UPDATE_STUDENT_SQL = "update student set name = ?,email= ?, phone=? where id = ?";

    @Override
    public List<Student> findAll() {
        Connection connection=DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Student> studentList = new ArrayList<>();
        if(connection!=null){
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENT);
                resultSet=preparedStatement.executeQuery();
                Student student=null;
                while (resultSet.next()){
                    student = new Student();
                    student.setId(resultSet.getInt("id"));
                    student.setName(resultSet.getString("name"));
                    student.setEmail(resultSet.getString("email"));
                    student.setPhone(resultSet.getString("phone"));
                    studentList.add(student);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    preparedStatement.close();
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return studentList;
    }

    @Override
    public void save(Student student) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection!=null){
            try {
                preparedStatement=connection.prepareStatement(INSERT_STUDENT_SQL);
                preparedStatement.setString(1,student.getName());
                preparedStatement.setString(2,student.getEmail());
                preparedStatement.setString(3,student.getPhone());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }

    }

    @Override
    public Student findById(int id) {
        Student student=null;
        Connection connection=DBConnection.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        try {
            preparedStatement=connection.prepareStatement(SELECT_STUDENT_BY_ID);
            preparedStatement.setInt(1,id);
            resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String phone=resultSet.getString("phone");
                student=new Student(id,"name","email","phone");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return student;
    }

    @Override
    public boolean update(Student student) {
        boolean rowUpdated = false;
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        try {
            connection=DBConnection.getConnection();
            preparedStatement=connection.prepareStatement(UPDATE_STUDENT_SQL);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setString(2,student.getEmail());
            preparedStatement.setString(3,student.getPhone());
            preparedStatement.setInt(4,student.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;

    }

    @Override
    public boolean remove(int id) {
        boolean rowDeleted = false;
        Connection connection=DBConnection.getConnection();
        PreparedStatement preparedStatement=null;
        try (PreparedStatement statement = connection.prepareStatement(DELETE_STUDENT_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;



    }

    @Override
    public List<Student> search(String search, String searchBy) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Student> studentList = new ArrayList<>();
        if (connection != null) {
            try {
                switch (searchBy) {
                    case "byName":
                        preparedStatement = connection.prepareStatement(SEARCH_BY_NAME);
                        break;
                    default:
                        preparedStatement = connection.prepareStatement(SEARCH_BY_ID);
                }

                preparedStatement.setString(1, "%" + search +"%");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String phone = resultSet.getString("phone");
                    studentList.add(new Student(id, name, email, phone));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return studentList;
    }
}
