package repository;

import model.Book;

import java.util.List;

public interface BookRepository {
    List<Book> selectAllBook();

    List<Book> selectAllBookUseLimit(int page, int record);

    List<Book> selectAllBookOrderBy(String action);

    List<Book> selectBookByCategoryId(int categoryId);

    List<Book> selectBookByNameOrCategory(String name, int categoryId);

    Book selectBookById(int id);

    List<Book> selectAllBookByName();

    boolean insertBook(Book book);

    boolean deleteBookById(int id);

    boolean updateBook(Book book);

    int countBook();
}
