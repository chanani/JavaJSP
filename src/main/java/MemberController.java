import ex05.MemberDAO;
import ex05.MemberVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {

    private static final long seriaVersionUID = 1L;
    MemberDAO memberDAO;

    @Override
    public void init() throws ServletException {
        memberDAO = new MemberDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandle(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request,response);
    }

    private void doHandle (HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        String nextPage = null;
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        String action = request.getPathInfo(); // URL에서 요청명을 가져옵니다.
        System.out.println("action : " + action);

        if (action == null || action.equals("/listMembers.do")){
            List<MemberVO> memberList = memberDAO.listMembers();
            request.setAttribute("memberList", memberList);
            nextPage = "/mvc/listMembers.jsp";
        } else if (action.equals("/addMember.do")){
            String id = request.getParameter("id");
            String pwd = request.getParameter("pwd");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            MemberVO memberVO = new MemberVO(id, pwd, name, email);
            memberDAO.addMember(memberVO);
            request.setAttribute("msg", "addMember");
            nextPage = "/member/listMembers.do";
        } else if (action.equals("/memberForm.do")){
            nextPage = "/mvc/memberForm.jsp";
        } else if(action.equals("/modMemberForm.do")) {
            String id = request.getParameter("id");
            MemberVO memInfo = memberDAO.findMember(id);
            request.setAttribute("memInfo", memInfo);
            nextPage = "/mvc/modMemberForm.jsp";
        } else if(action.equals("/modMember.do")){
            String id = request.getParameter("id");
            String pwd = request.getParameter("pwd");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            MemberVO memberVO = new MemberVO(id, pwd, name, email);
            memberDAO.modMember(memberVO);
            request.setAttribute("msg", "modified");
            nextPage = "/member/listMember.do";
        } else if (action.equals("/delMember.do")) {
            String id = request.getParameter("id");
            memberDAO.delMember(id);

            request.setAttribute("msg", "deleted");
            nextPage = "/member/listMember.do";
        } else {
            List<MemberVO> memberList = memberDAO.listMembers();
            request.setAttribute("memberList", memberList);
            nextPage = "/mvc/listMembers.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
        dispatcher.forward(request, response);
    }
}
