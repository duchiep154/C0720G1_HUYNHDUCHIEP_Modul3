import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet",urlPatterns = "/caculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Float number_1 = Float.parseFloat(request.getParameter("number1"));
        Float number_2 = Float.parseFloat(request.getParameter("number2"));
        String operator = request.getParameter("operator");
//        char operator = request.getParameter("operator").charAt(0);

        try {
            float result = Calculator.calculate(number_1, number_2, operator);
            request.setAttribute("calculate", number_1 + " " + operator + " " + number_2 + " = " + result);
        } catch (Exception ex) {
            request.setAttribute("calculate", "Error: " + ex.getMessage());
        }
        request.getRequestDispatcher("calculator.jsp").forward(request, response);

    }
}
