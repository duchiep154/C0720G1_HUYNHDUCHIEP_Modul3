package repository;

import model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepositoryImpl implements BookRepository {
    private static final String SELECT_ALL_BOOK = "SELECT * FROM book";
    private static final String SELECT_ALL_BOOK_USE_LIMIT = "SELECT * FROM book LIMIT ?,?";
    private static final String COUNT_BOOK = "SELECT count(book_id) as count FROM book";
    private static final String INSERT_BOOK = "INSERT INTO book VALUES (?,?,?,?,?,?,?)";
    private static final String DELETE_BOOK_BY_ID = "DELETE FROM book WHERE book_id = ?";
    private static final String UPDATE_BOOK_BY_ID = "UPDATE book SET book_name = ?, book_cost = ?, description = ?, category_id = ?, author_id = ?, publisher_id = ? WHERE book_id = ?";
    private static final String SELECT_ALL_BOOK_ORDER_BY_COST_ASC = "SELECT * FROM book ORDER BY book_cost ASC ";
    private static final String SELECT_ALL_BOOK_ORDER_BY_COST_DESC = "SELECT * FROM book ORDER BY book_cost DESC";
    private static final String SELECT_BOOK_BY_CATEGORY_ID = "SELECT * FROM book WHERE category_id = ?";
    private static final String SELECT_BOOK_BY_NAME_OR_AUTHOR = "SELECT * FROM book WHERE book_name = ? OR author_id = ?";

    @Override
    public List<Book> selectAllBook() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Book> bookList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("book_id");
                String name = resultSet.getString("book_name");
                double cost = resultSet.getDouble("book_cost");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("category_id");
                int authorId = resultSet.getInt("author_id");
                int publisher = resultSet.getInt("publisher_id");

                bookList.add(new Book(id, name, cost, description, categoryId, authorId, publisher));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return bookList;
    }

    @Override
    public List<Book> selectAllBookUseLimit(int page, int record) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Book> bookList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK_USE_LIMIT);

            int start = --page * record;

            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, record);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("book_id");
                String name = resultSet.getString("book_name");
                double cost = resultSet.getDouble("book_cost");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("category_id");
                int authorId = resultSet.getInt("author_id");
                int publisher = resultSet.getInt("publisher_id");

                bookList.add(new Book(id, name, cost, description, categoryId, authorId, publisher));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return bookList;
    }

    @Override
    public List<Book> selectAllBookOrderBy(String action) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Book> bookList = new ArrayList<>();

        try {
            if (action.equals("asc")) {
                preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK_ORDER_BY_COST_ASC);
            } else {
                preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK_ORDER_BY_COST_DESC);
            }

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("book_id");
                String name = resultSet.getString("book_name");
                double cost = resultSet.getDouble("book_cost");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("category_id");
                int authorId = resultSet.getInt("author_id");
                int publisher = resultSet.getInt("publisher_id");

                bookList.add(new Book(id, name, cost, description, categoryId, authorId, publisher));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return bookList;
    }

    @Override
    public List<Book> selectBookByCategoryId(int categoryId) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Book> bookList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_CATEGORY_ID);

            preparedStatement.setInt(1, categoryId);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("book_id");
                String name = resultSet.getString("book_name");
                double cost = resultSet.getDouble("book_cost");
                String description = resultSet.getString("description");
                categoryId = resultSet.getInt("category_id");
                int authorId = resultSet.getInt("author_id");
                int publisher = resultSet.getInt("publisher_id");

                bookList.add(new Book(id, name, cost, description, categoryId, authorId, publisher));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return bookList;
    }

    @Override
    public List<Book> selectBookByNameOrCategory(String name, int categoryId) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Book> bookList = new ArrayList<>();

        try {
            preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_NAME_OR_AUTHOR);

            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, categoryId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("book_id");
                name = resultSet.getString("book_name");
                double cost = resultSet.getDouble("book_cost");
                String description = resultSet.getString("description");
                categoryId = resultSet.getInt("category_id");
                int authorId = resultSet.getInt("author_id");
                int publisher = resultSet.getInt("publisher_id");

                bookList.add(new Book(id, name, cost, description, categoryId, authorId, publisher));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return bookList;
    }

    @Override
    public Book selectBookById(int id) {
        return null;
    }

    @Override
    public List<Book> selectAllBookByName() {
        return null;
    }

    @Override
    public boolean insertBook(Book book) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean flag = false;

        try {
            preparedStatement = connection.prepareStatement(INSERT_BOOK);
            preparedStatement.setInt(1,book.getId());
            preparedStatement.setString(2, book.getName());
            preparedStatement.setDouble(3, book.getCost());
            preparedStatement.setString(4, book.getDescription());
            preparedStatement.setInt(5, book.getCategoryId());
            preparedStatement.setInt(6, book.getAuthorId());
            preparedStatement.setInt(7, book.getPublisherId());
            if (preparedStatement.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return flag;
    }

    @Override
    public boolean deleteBookById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean flag = false;

        try {
            preparedStatement = connection.prepareStatement(DELETE_BOOK_BY_ID);

            preparedStatement.setInt(1, id);

            if (preparedStatement.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return flag;
    }

    @Override
    public boolean updateBook(Book book) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean flag = false;
        try {
            preparedStatement = connection.prepareStatement(UPDATE_BOOK_BY_ID);
            preparedStatement.setString(1, book.getName());
            preparedStatement.setDouble(2, book.getCost());
            preparedStatement.setString(3, book.getDescription());
            preparedStatement.setInt(4, book.getCategoryId());
            preparedStatement.setInt(5, book.getAuthorId());
            preparedStatement.setInt(6, book.getPublisherId());
            preparedStatement.setInt(7, book.getId());

            if (preparedStatement.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return flag;
    }

    @Override
    public int countBook() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int count = 0;

        try {
            preparedStatement = connection.prepareStatement(COUNT_BOOK);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                count = resultSet.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
