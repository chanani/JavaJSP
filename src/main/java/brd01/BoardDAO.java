package brd01;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    // private Statement stmt;
    private PreparedStatement pstmt;
    private Connection con;
    private DataSource dataFactory;

    public BoardDAO(){

    }

    public List<ArticleVO> selectAllArticles(){
        List<ArticleVO> articlesList = new ArrayList<>();
        try {
            connDB();
            String query = "SELECT " +
                    "CASE " +
                    "WHEN parentNO = 0 THEN 1 " +
                    "ELSE 2 " +
                    "END AS level, " +
                    "articleNO, " +
                    "parentNO, " +
                    "title, " +
                    "content, " +
                    "writeDate, " +
                    "id " +
                    "FROM t_board " +
                    "ORDER BY " +
                    "CASE " +
                    "WHEN parentNO = 0 THEN articleNO " +
                    "ELSE parentNO " +
                    "END, articleNO";
            System.out.println(query);
            pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                int level = rs.getInt("level");
                int articleNO = rs.getInt("articleNO");
                int parentNO = rs.getInt("parentNO");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String id = rs.getString("id");
                Date writeDate = rs.getDate("writeDate");
                ArticleVO article = new ArticleVO();
                article.setLevel(level);
                article.setId(id);
                article.setArticleNO(articleNO);
                article.setParentNO(parentNO);
                article.setTitle(title);
                article.setContent(content);
                article.setWriteDate(writeDate);
                articlesList.add(article);
            }
            rs.close();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return articlesList;
    }

    public ArticleVO selectArticle(int articleNO){
        ArticleVO article = new ArticleVO();

        try {
            connDB();
            String query = "select * from t_board where articleNO = ?";
            System.out.println(query);
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, articleNO);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int _articleNO = rs.getInt("articleNO");
            int parentNO = rs.getInt("parentNO");
            String title = rs.getString("title");
            String content = rs.getString("content");
            String id = rs.getString("id");
            Date writeDate = rs.getDate("writeDate");

            article.setArticleNO(_articleNO);
            article.setParentNO(parentNO);
            article.setTitle(title);
            article.setContent(content);
            article.setId(id);
            article.setWriteDate(writeDate);
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return article;
    }

    private int getNewArticleNO(){
        try {
            connDB();
            String query = "select max(articleNO) from t_board";
            System.out.println(query);
            pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()){
                return(rs.getInt(1) + 1);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public int insertNewArticle(ArticleVO article){
        int articleNO = getNewArticleNO();
        try {
            connDB();
            int parentNO = article.getParentNO();
            String title = article.getTitle();
            String content = article.getContent();
            String id = article.getId();
            String query = "INSERT INTO t_board (articleNO, parentNO, title, content, id) ";
            query += "values (?, ?, ?, ?, ?)";
            System.out.println(query);

            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, articleNO);
            pstmt.setInt(2, parentNO);
            pstmt.setString(3, title);
            pstmt.setString(4, content);
            pstmt.setString(5, id);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public void updateArticle(ArticleVO article){
        int articleNO = article.getArticleNO();
        String title = article.getTitle();
        String content = article.getContent();
        try {
            connDB();
            String query = "update t_board set title = ?, content = ?";
            query += " where articleNO = ?";
            System.out.println("articleNO : " + articleNO);

            pstmt = con.prepareStatement(query);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, articleNO);
            pstmt.executeUpdate();
            con.close();
            pstmt.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public void deleteArticle(int articleNO){
        try {
            connDB();
            String query = "delete From t_board where articleNO = ?";
            System.out.println(query);
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, articleNO);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteArticle2(int articleNO){
        try {
            connDB();
            String query = "delete From t_board where parentNO = ?";
            System.out.println(query);
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, articleNO);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }



    private void connDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/JSP";
            String user = "JSP";
            String pwd = "JSP";
            System.out.println("mysql 드라이버 로딩 성공");
            con = DriverManager.getConnection(url, user, pwd);
            System.out.println("connection 생성 성공");
//            stmt = con.createStatement();
//            System.out.println("Statement 생성 성공");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
