
package conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
	public static Connection connect() throws Exception {
		
		String id = "root";
		String pass = "apmsetup";
		String url = "jdbc:mysql://localhost:3306/Project1?useUnicode=true&characterEncoding=utf8";
		//접속 드라이브 연결
		Class.forName("com.mysql.jdbc.Driver");
		//DB 접속(로그인) 정보
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		return conn;
		
	}
}
