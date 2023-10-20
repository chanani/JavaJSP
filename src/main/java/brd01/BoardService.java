package brd01;

import java.util.Arrays;
import java.util.List;

public class BoardService {
    BoardDAO boardDAO;

    public BoardService(){
        boardDAO = new BoardDAO();
    }

    public List<ArticleVO> listArticles(){
        List<ArticleVO> articlesList = boardDAO.selectAllArticles();
        System.out.println("list.size() : " + articlesList.size());
        return articlesList;
    }

    public void addArticle(ArticleVO article){
        boardDAO.insertNewArticle(article);
    }

    public ArticleVO viewArticle(int articleNO){
        ArticleVO article = null;
        article = boardDAO.selectArticle(articleNO);
        return article;
    }

    public void modArticle(ArticleVO article){
        boardDAO.updateArticle(article);
    }

    public int addReply(ArticleVO article){
        return boardDAO.insertNewArticle(article);
    }
}
