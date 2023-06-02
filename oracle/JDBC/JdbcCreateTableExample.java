import java.sql.*;

public class JdbcCreateTableExample {
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");

            // Disable auto commit
            conn.setAutoCommit(false);

            String createTableSql = "CREATE TABLE Student (id NUMBER, name VARCHAR2(100), phoneNumber VARCHAR2(15))";
            pstmt = conn.prepareStatement(createTableSql);
            pstmt.execute();

            String insertSql = "INSERT INTO Student(id, name, phoneNumber) VALUES(?, ?, ?)";
            pstmt = conn.prepareStatement(insertSql);
            pstmt.setInt(1, 1);
            pstmt.setString(2, "홍길동");
            pstmt.setString(3, "010-111-1111");
            pstmt.executeUpdate();

            // Commit the transaction
            conn.commit();

            System.out.println("테이블 생성 및 데이터 삽입이 완료되었습니다.");

        } catch (Exception e) {
            try {
                // Rollback the transaction in case of any error
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                // Close resources in the finally block
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
