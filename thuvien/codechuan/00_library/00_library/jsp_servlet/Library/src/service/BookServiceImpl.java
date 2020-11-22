package service;

import model.Book;
import repository.BookRepository;
import repository.BookRepositoryImpl;

import java.util.List;

public class BookServiceImpl implements BookService {
    BookRepository bookRepository = new BookRepositoryImpl();

    @Override
    public List<Book> selectAllBook() {
        return bookRepository.selectAllBook();
    }

    @Override
    public List<Book> selectAllBookUseLimit(int page, int record) {
        return bookRepository.selectAllBookUseLimit(page, record);
    }

    @Override
    public List<Book> selectAllBookOrderBy(String action) {
        return bookRepository.selectAllBookOrderBy(action);
    }

    @Override
    public List<Book> selectBookByCategoryId(int categoryId) {
        return bookRepository.selectBookByCategoryId(categoryId);
    }

    @Override
    public List<Book> selectBookByNameOrCategoryId(String name, int categoryId) {
        return bookRepository.selectBookByNameOrCategory(name, categoryId);
    }

    @Override
    public Book selectBookById(int id) {
        return bookRepository.selectBookById(id);
    }

    @Override
    public List<Book> selectAllBookByName() {
        return bookRepository.selectAllBookByName();
    }

    @Override
    public boolean insertBook(Book book) {
        return bookRepository.insertBook(book);
    }

    @Override
    public boolean deleteBookById(int id) {
        return bookRepository.deleteBookById(id);
    }

    @Override
    public boolean updateBook(Book book) {
        return bookRepository.updateBook(book);
    }

    @Override
    public int countBook() {
        return bookRepository.countBook();
    }
}
