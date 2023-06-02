
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

class OracleJdbcTest {
    public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:xe";
    public static final String DBUSER = "hr";
    public static final String DBPASS = "hr";

    public static void main(String[] args) {
        try {
            // Oracle JDBC 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle 데이터베이스에 연결
            Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASS);

            // 연결 성공 시 출력
            if (con != null) {
                System.out.println("데이터베이스에 연결되었습니다!");
            } else {
                System.out.println("데이터베이스 연결에 실패하였습니다.");
            }

            con.close();

        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC 드라이버를 찾을 수 없습니다.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("연결 실패! 콘솔 출력을 확인하세요");
            e.printStackTrace();
        }
    }
}
