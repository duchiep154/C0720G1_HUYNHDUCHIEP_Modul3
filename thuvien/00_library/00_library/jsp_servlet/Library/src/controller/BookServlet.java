package controller;

import common.DuplicateIdException;
import common.NameFormatException;
import common.NumberException;
import common.Validate;
import model.Book;
import service.author.AuthorService;
import service.author.AuthorServiceImpl;
import service.book.BookService;
import service.book.BookServiceImpl;
import service.category.CategoryService;
import service.category.CategoryServiceImpl;
import service.publisher.PublisherService;
import service.publisher.PublisherServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookServlet", urlPatterns = "/books")
public class BookServlet extends HttpServlet {
    BookService bookService = new BookServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();
    AuthorService authorService = new AuthorServiceImpl();
    PublisherService publisherService = new PublisherServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertBook(request, response);
                selectAllBook(request, response);
                break;
            case "delete":
                deleteBook(request, response);
                selectAllBook(request, response);
                break;
            case "update":
                updateBook(request, response);
                selectAllBook(request, response);
            default:
                break;
        }
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) {
        String messageCost = null;

        boolean flag = true;

        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");
//        try {
//            name = request.getParameter("name");
//            System.out.println(name);
//            Validate.regexName(name);
//        } catch (NameFormatException e) {
//            messageName = e.getMessage();
//            flag = false;
//        }

        double cost = 0;
        try {
            cost = Double.parseDouble(request.getParameter("cost"));
            Validate.regexCost(cost);
        } catch (NumberFormatException e) {
            messageCost = "ERROR: NumberFormatException";
            flag = false;
        } catch (NumberException e) {
            messageCost = e.getMessage();
            flag = false;
        }

        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int authorId = Integer.parseInt(request.getParameter("authorId"));
        int publisherId = Integer.parseInt(request.getParameter("publisherId"));

        if (!flag) {
            request.setAttribute("flag", false);
            request.setAttribute("id",id);
            request.setAttribute("name",name);
            request.setAttribute("cost",cost);
            request.setAttribute("description",description);
            request.setAttribute("categoryId",categoryId);
            request.setAttribute("authorId",authorId);
            request.setAttribute("publisherId",publisherId);
            request.setAttribute("message", "Update failed");
            request.setAttribute("messageCost", messageCost);

            return;
        }

        Book book = new Book(id, name, cost, description, categoryId, authorId, publisherId);
        if (bookService.updateBook(book)) {
            request.setAttribute("message", "Update successfully");
        }

    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        boolean flag = bookService.deleteBookById(id);

        if (flag) {
            request.setAttribute("message", "Delete successfully");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createJSP(request, response);
                break;
            case "sort":
                selectAllBookOrderBy(request, response);
                break;
            case "search-by-category":
                selectBookByCategoryId(request, response);
                break;
            case "search":
                selectBookByNameOrCategoryId(request, response);
                break;
            default:
                selectAllBook(request, response);
                break;
        }
    }

    private void selectBookByNameOrCategoryId(HttpServletRequest request, HttpServletResponse response) {
        String nameOrId = request.getParameter("nameOrId");
        String message = null;
        int categoryId = 0;
        Map<Integer, String> authorList = authorService.selectAllAuthor();

        for (Integer key : authorList.keySet()) {
            if (nameOrId.equals(authorList.get(key))) {
                categoryId = key;
                break;
            }
        }

        List<Book> bookList = bookService.selectBookByNameOrCategoryId(nameOrId, categoryId);

        if (bookList.isEmpty()) {
            message = "Not Find";
            request.setAttribute("message", message);
        } else {
            request.setAttribute("bookList", bookList);
            request.setAttribute("categoryList", categoryService.selectAllCategory());
            request.setAttribute("authorList", authorService.selectAllAuthor());
            request.setAttribute("publisherList", publisherService.selectAllPublisher());
        }
        request.setAttribute("search","");
        try {
            request.getRequestDispatcher("book/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void selectBookByCategoryId(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("category-id"));

        List<Book> bookList = bookService.selectBookByCategoryId(id);

        request.setAttribute("categoryList", categoryService.selectAllCategory());
        request.setAttribute("authorList", authorService.selectAllAuthor());
        request.setAttribute("publisherList", publisherService.selectAllPublisher());
        request.setAttribute("bookList", bookList);

        try {
            request.getRequestDispatcher("book/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void selectAllBookOrderBy(HttpServletRequest request, HttpServletResponse response) {


        String sort = request.getParameter("sort");

        if (sort.equals("asc")) {
            sort = "desc";
        } else {
            sort = "asc";
        }

        List<Book> bookList = bookService.selectAllBookOrderBy(sort);

        request.setAttribute("categoryList", categoryService.selectAllCategory());
        request.setAttribute("authorList", authorService.selectAllAuthor());
        request.setAttribute("publisherList", publisherService.selectAllPublisher());
        request.setAttribute("sort", sort);
        request.setAttribute("bookList", bookList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


    }

    private void createJSP(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("categoryList", categoryService.selectAllCategory());
        request.setAttribute("authorList", authorService.selectAllAuthor());
        request.setAttribute("publisherList", publisherService.selectAllPublisher());
        try {
            request.getRequestDispatcher("book/create.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }

    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response) {
        String messageId = null;
        String messageName = null;
        String messageCost = null;

        boolean flag = true;

        int id = 0;

        try {
            id = Integer.parseInt(request.getParameter("id"));
            Validate.regexId(id);
        } catch (NumberFormatException e) {
            messageId = "ERROR: IDFormatException!!!";
            flag = false;
        } catch (DuplicateIdException | NumberException e) {
            messageId = e.getMessage();
            flag = false;
        }

        String name = null;
        try {
            name = request.getParameter("name");
            System.out.println(name);
            Validate.regexName(name);
        } catch (NameFormatException e) {
            messageName = e.getMessage();
            flag = false;
        }

        double cost = 0;
        try {
            cost = Double.parseDouble(request.getParameter("cost"));
            Validate.regexCost(cost);
        } catch (NumberFormatException e) {
            messageCost = "ERROR: NumberFormatException";
            flag = false;
        } catch (NumberException e) {
            messageCost = e.getMessage();
            flag = false;
        }

        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int authorId = Integer.parseInt(request.getParameter("authorId"));
        int publisherId = Integer.parseInt(request.getParameter("publisherId"));

        if (!flag) {
            request.setAttribute("messageId", messageId);
            request.setAttribute("messageName", messageName);
            request.setAttribute("messageCost", messageCost);

            createJSP(request, response);
            return;
        }

        Book book = new Book(id, name, cost, description, categoryId, authorId, publisherId);


        if (bookService.insertBook(book)) {
            request.setAttribute("message", "Create successfully");
        }
    }

    private void selectAllBook(HttpServletRequest request, HttpServletResponse response) {
        int page = 1;
        int record = 5;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<Book> bookList = bookService.selectAllBookUseLimit(page, record);
        double countBook = bookService.countBook();
        double totalPage = Math.ceil(countBook / record);

        request.setAttribute("currentPage", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("bookList", bookList);
        request.setAttribute("categoryList", categoryService.selectAllCategory());
        request.setAttribute("authorList", authorService.selectAllAuthor());
        request.setAttribute("publisherList", publisherService.selectAllPublisher());

        try {
            request.getRequestDispatcher("book/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}
