package common;

import model.Book;
import service.book.BookService;
import service.book.BookServiceImpl;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {
    private static Pattern pattern;
    private static Matcher matcher;

    private static final String REGEX_NAME = "^[A-Z][a-z]*(\\s[A-Z]?[a-z]*)*$";

    public static void regexId(int id) throws DuplicateIdException, NumberException {
        BookService bookService = new BookServiceImpl();

        for (Book book: bookService.selectAllBook()) {
            if (id == book.getId()) throw new DuplicateIdException("ERROR: DuplicateIdException!!!");
        }

        if (id < 0) throw new NumberException("ERROR: NameFormatException!!!");
    }

    public static void regexName(String name) throws NameFormatException {
        pattern = Pattern.compile(REGEX_NAME);
        matcher = pattern.matcher(name);

        if(!matcher.find()) throw new NameFormatException("ERROR: NameFormatException!!!");
    }

    public static void regexCost(double cost) throws NumberException {
        if (cost < 0) throw new NumberException("ERROR: NumberFormatException");
    }



}
