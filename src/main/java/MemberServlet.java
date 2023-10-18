import ex04.MemberDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/mem")
public class MemberServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        String id = (String) request.getParameter("id");
        System.out.println("id : " + id);
        MemberDAO dao = new MemberDAO();
        boolean overlappedID = dao.overlappedID(id);
        if (overlappedID == true){
            out.println("not_usable");
        } else{
            out.println("usable");
        }

    }
}
