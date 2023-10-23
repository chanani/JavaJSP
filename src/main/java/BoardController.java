import brd01.ArticleVO;
import brd01.BoardService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
    BoardService boardService;
    ArticleVO articleVO;
    private static String ARTICLE_IMAGE_REPO = "/Users/ichanhan/Desktop/aloneStudy/javaJSP/src/main/image";

    @Override
    public void init() throws ServletException {
        boardService = new BoardService();
        articleVO = new ArticleVO();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nextPage = "";
        HttpSession session;
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        String action = request.getPathInfo();
        System.out.println("action : " + action);

        try {
            List<ArticleVO> articleList = new ArrayList<ArticleVO>();
            if (action == null){
                articleList = boardService.listArticles();
                request.setAttribute("articlesList", articleList);
                nextPage = "/board02/listArticles.jsp";
            } else if(action.equals("/listArticles.do")){
                articleList = boardService.listArticles();
                request.setAttribute("articlesList", articleList);
                nextPage = "/board02/listArticles.jsp";
            } else if(action.equals("/articleForm.do")){
                nextPage = "/board02/articleForm.jsp";
            } else if(action.equals("/addArticle.do")){
                int articleNO = 0;
//                Map<String, String> articleMap = upload(request,response);
//                String title = articleMap.get("title");
//                String content = articleMap.get("content");
//                String imageFileName = articleMap.get("imageFileName");
                String title = request.getParameter("title");
                String content = request.getParameter("content");

                articleVO.setParentNO(0);
                articleVO.setId("123");
                articleVO.setTitle(title);
                articleVO.setContent(content);
                // articleVO.setImageFileName(imageFileName);
                boardService.addArticle(articleVO);
                nextPage = "/board/listArticles.do";
            } else if (action.equals("/viewArticle.do")){
                String articleNO = request.getParameter("articleNO");
                articleVO = boardService.viewArticle(Integer.parseInt(articleNO));
                request.setAttribute("article", articleVO);
                nextPage = "/board02/viewArticle.jsp";
            } else if(action.equals("/modArticle.do")){
                int articleNO = Integer.parseInt(request.getParameter("articleNO"));
                articleVO.setArticleNO(articleNO);
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                articleVO.setParentNO(0);
                articleVO.setId("123");
                articleVO.setTitle(title);
                articleVO.setContent(content);
                boardService.modArticle(articleVO);
                PrintWriter pw = response.getWriter();
                pw.print("<script>" + "alert('글을 수정했습니다.');" + " location.href='"
                + request.getContextPath() + "/board/viewArticle.do?articleNO=" + articleNO + "';" + "</script>");

                return;
            } else if(action.equals("/replyForm.do")){
                int parentNO = Integer.parseInt(request.getParameter("parentNO"));
                int articleNO = Integer.parseInt(request.getParameter("articleNO"));
                session = request.getSession();
                session.setAttribute("parentNO", parentNO);
                session.setAttribute("articleNO", articleNO);
                nextPage = "/board02/replyForm.jsp";
            }else if(action.equals("/addReply.do")){
                session = request.getSession();
                int parentNO = (Integer)session.getAttribute("parentNO");
                session.removeAttribute("parentNO");
                String title = request.getParameter("title");
                String content = request.getParameter("content");

                articleVO.setParentNO(parentNO);
                articleVO.setId("zxc");
                articleVO.setTitle(title);
                articleVO.setContent(content);
                int articleNO = Integer.parseInt(request.getParameter("articleNO"));
                boardService.addReply(articleVO);
                PrintWriter pw = response.getWriter();
                pw.print("<script>" + " alert('답글을 추가하였습니다.');" + " location.href='"
                        + request.getContextPath() + "/board/viewArticle.do?articleNO=" + articleNO + "';" + "</script>");

                return;
            } else if (action.equals("/removeArticle.do")){
                int articleNO = Integer.parseInt(request.getParameter("articleNO"));
                boardService.removeArticle(articleNO);
                PrintWriter pw = response.getWriter();
                pw.print("<script>" + " alert('글을 삭제했습니다.'); " + " location.href='" + request.getContextPath() + "/board/listArticles.do'"
                        + "</script>");
                return;
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /*private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> articleMap = new HashMap<String, String>();
        String encoding = "utf-8";
        File currentDirPath = new File(ARTICLE_IMAGE_REPO);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(currentDirPath);
        factory.setSizeThreshold(1024 * 1024);
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List items = upload.parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem fileItem = (FileItem) items.get(i);
                if (fileItem.isFormField()){
                    System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
                    articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
                } else {
                    System.out.println("파라미터 이름 : " + fileItem.getFieldName());
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }*/
}
