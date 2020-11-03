import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "calculaServlet",urlPatterns = "/product")
public class calculaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String product_description = request.getParameter("product_description");
        String list_price = request.getParameter("list_price");
        String discount_percent = request.getParameter("discount_percent");

        double discount_amount = Float.parseFloat(list_price) * Float.parseFloat(discount_percent) * 0.01;
        double price = Float.parseFloat(list_price) - discount_amount;
        request.setAttribute("discount","Lượng chiết khấu: " + discount_amount + " đồng" + " _ Giá sau khi chiết khấu: " + price + " đồng"
               );
        request.getRequestDispatcher("discount_product.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
