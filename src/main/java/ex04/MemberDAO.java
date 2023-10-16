package ex04;

import ex01.MemberVO;
import ex02.MemberBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

    // private Statement stmt;
    private PreparedStatement pstmt;
    private Connection con;
    private DataSource dataFactory;


    public boolean overlappedID(String id){

        boolean result = false;
        try {
            connDB();
            String query = "select if(count(*) = 1, 'true', 'false') as result from t_member";
            query += " where id = ?";
            System.out.println("prepareStatement : " + query);
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            result = Boolean.parseBoolean(rs.getString("result"));
            pstmt.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return result;

    }



    public List<MemberVO> listMembers() {
        List list = new ArrayList<>();
        try {
            connDB();
            String query = "select * from t_member order by joinDate desc ";

            System.out.println("prepareStatement : " + query);
            pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String pwd = rs.getString("pwd");
                String name = rs.getString("name");
                String email = rs.getString("email");
                Date joinDate = rs.getDate("joinDate");
                MemberBean vo = new MemberBean();
                vo.setId(id);
                vo.setPwd(pwd);
                vo.setName(name);
                vo.setEmail(email);
                vo.setJoinDate(joinDate);
                list.add(vo);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public void addMember(MemberBean memberBean) {
        try {
            connDB();
            String id = memberBean.getId();
            String pwd = memberBean.getPwd();
            String name = memberBean.getName();
            String email = memberBean.getEmail();

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


    public void delMember(String id) {
        try {
            connDB();
            System.out.println("id : " + id);
            String query = "delete from t_member" + " where id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
            pstmt.close();
            System.out.println("delete 호출");
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

    public boolean isEisted(MemberVO vo) {
        boolean result = false;
        String id = vo.getId();
        String pwd = vo.getPwd();
        System.out.println("DAO : " + id + "," + pwd);
        try {
            connDB();
            String query = "select IF(count(*) = 1, 'true', 'false') as result from t_member ";
            query += "where id = ? and pwd = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            result = Boolean.parseBoolean(rs.getString("result"));
            System.out.println("result  : " + result);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return result;
    }


}
