import java.sql.*;

public class OracleJDBCSelectTest {

    public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:xe";
    public static final String DBUSER = "hr";
    public static final String DBPASS = "hr";

    public static void main(String[] args) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Oracle JDBC 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle 데이터베이스에 연결
            con = DriverManager.getConnection(DBURL, DBUSER, DBPASS);

            // 연결 성공 시 출력
            if (con != null) {
                System.out.println("데이터베이스에 연결되었습니다!");
            } else {
                System.out.println("데이터베이스 연결에 실패하였습니다.");
                return;
            }

            // SQL 쿼리 실행
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM Employees");

            // 결과 출력
            while (rs.next()) {
                System.out.println(rs.getInt("employee_id") + "\t" +
                        rs.getString("first_name") + "\t" +
                        rs.getString("last_name") + "\t" +
                        rs.getString("email") + "\t" +
                        rs.getString("phone_number") + "\t" +
                        rs.getDate("hire_date") + "\t" +
                        rs.getString("job_id") + "\t" +
                        rs.getInt("salary") + "\t" +
                        rs.getDouble("commission_pct") + "\t" +
                        rs.getInt("manager_id") + "\t" +
                        rs.getInt("department_id"));
            }

        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC 드라이버를 찾을 수 없습니다.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("연결 실패! 콘솔 출력을 확인하세요");
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
