package ex05;

import ex02.MemberBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

    // private Statement stmt;
    private PreparedStatement pstmt;
    private Connection con;
    private DataSource dataFactory;


    public MemberDAO(){
      /*  try {
            Context ctx = new InitialContext();
            Context envContext = (Context) ctx.lookup("java:/comp/env");
            dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }*/
    }


    public List<MemberVO> listMembers(){
        List<MemberVO> memberList = new ArrayList<>();
        try {
            connDB();
            String query = "select * from t_member order by joinDate desc";
            System.out.println(query);
            pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                String id = rs.getString("id");
                String pwd = rs.getString("pwd");
                String name = rs.getString("name");
                String email = rs.getString("email");
                Date joinDate = rs.getDate("joinDate");
                MemberVO memberVO = new MemberVO(id, pwd, name, email, joinDate);
                memberList.add(memberVO);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return memberList;
    }

    public MemberVO findMember(String _id){
        MemberVO memInfo = null;
        try {
            connDB();
            String query = "select * from t_member where id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, _id);
            System.out.println(query);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            String id = rs.getString("id");
            String pwd = rs.getString("pwd");
            String name = rs.getString("name");
            String email = rs.getString("email");
            Date joinDate = rs.getDate("joinDate");
            memInfo = new MemberVO(id, pwd, name, email, joinDate);
            pstmt.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return memInfo;
    }

    public void modMember(MemberVO memberVO){
        String id = memberVO.getId();
        String pwd = memberVO.getPwd();
        String name = memberVO.getName();
        String email = memberVO.getEmail();

        try {
            connDB();
            String query = "update t_member set pwd = ?, name = ?, email = ? where id = ?";
            System.out.println(query);
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, pwd);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, id);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void delMember(String id){
        try {
            connDB();
            String query = "delete from t_member where id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            System.out.println(query);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void addMember(MemberVO vo) {
        try {
            connDB();
            String id = vo.getId();
            String pwd = vo.getPwd();
            String name = vo.getName();
            String email = vo.getEmail();

            String query = "insert into t_member";
            query += "(id, pwd, name, email)";
            query += "values(?,?,?,?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            pstmt.executeUpdate();
            pstmt.close();

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
