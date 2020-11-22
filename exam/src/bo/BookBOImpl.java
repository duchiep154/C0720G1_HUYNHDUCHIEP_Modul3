package bo;

import dao.BookDAO;
import dao.BookDAOImpl;
import model.Book;

import java.util.List;

public class BookBOImpl implements BookBO {

    BookDAO bookDAO=new BookDAOImpl();
    @Override
    public List<Book> getAllBook() {
        return bookDAO.getAllBook();
    }
}
