import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "serverTimeServlet", value = "/index")
public class serverTimeServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
//        PrintWriter writer = resp.getWriter();
//        writer.println("<html>");
//        writer.println("<h1>Hello World</h1>");
//        writer.println("</html>");
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        Date today =  new Date();
        writer.println("<h1>" + today + "</h1>");
        writer.println("<html>");
    }
}
