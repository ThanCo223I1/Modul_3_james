import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "TranslationServlet", value = "/translate")
public class TranslationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String , String > dictionary = new HashMap<>();
        dictionary.put("hello", "Xin Chào");
        dictionary.put("how", "Thế Nào");
        dictionary.put("book", "Quyển Vở");
        dictionary.put("computer", "Máy Tính");
        String search = req.getParameter("txtSearch");
        PrintWriter writer = resp.getWriter();

        writer.println("<html>");
        String result = dictionary.get(search);
        if(result != null){
            writer.println("Word: " + search);
            writer.println("Result: " + result);
        }else {
            writer.println("Not found");
        }
        writer.println("</html>");
    }
}
