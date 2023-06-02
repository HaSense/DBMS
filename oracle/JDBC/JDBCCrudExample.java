import java.util.Scanner;

public class JDBCCrudExample {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("메뉴 : ");
            System.out.println("1. 데이터 삽입");
            System.out.println("2. 데이터 삭제");
            System.out.println("3. 데이터 조회");
            System.out.println("4. 데이터 수정");
            System.out.println("5. 종료");

            System.out.print("선택하세요: ");
            int menu = scanner.nextInt();

            switch (menu) {
                case 1:
                    // 데이터 삽입 로직
                    System.out.println("데이터 삽입을 선택했습니다.");
                    break;
                case 2:
                    // 데이터 삭제 로직
                    System.out.println("데이터 삭제를 선택했습니다.");
                    break;
                case 3:
                    // 데이터 조회 로직
                    System.out.println("데이터 조회를 선택했습니다.");
                    break;
                case 4:
                    // 데이터 수정 로직
                    System.out.println("데이터 수정을 선택했습니다.");
                    break;
                case 5:
                    // 프로그램 종료
                    System.out.println("프로그램을 종료합니다.");
                    System.exit(0);
                default:
                    System.out.println("잘못된 입력입니다. 다시 선택하세요.");
            }
        }
    }
}
