package util;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/*
 * 	DB 연결, 연결 해제, 저장, 취소
 * 	static 메소드로 생성하여 언제 어디서든 객체 생성 없이 사용가능하도록 구현
 * 	유지보수가 용이해짐
 */
public class JdbcTemplate {
	
	private JdbcTemplate() {} // 객체 생성 방지

	public static Connection getConnection() {
		Connection con = null;
		String driver = "";
		String url = "";
		String id = "";
		String pw = "";
		
		Properties prop = new Properties();
		try {
			String path = JdbcTemplate.class.getResource("jdbc.properties").getPath();
			prop.load(new FileReader(path));
			
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
			id = prop.getProperty("user");
			pw = prop.getProperty("password");
			
			Class.forName(driver);
			
		} catch (ClassNotFoundException e) {
			System.out.println("[ERROR] 드라이버 등록 실패");
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(url, id, pw);
		} catch (SQLException e) {
			System.out.println("[ERROR] mysql 연결 실패");
			e.printStackTrace();
		}
		return con; // connection 객체 반환
	}

	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			System.out.println("[ERROR] commit 에러");
			e.printStackTrace();
		}
	}

	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			System.out.println("[ERROR] rollback 에러");
			e.printStackTrace();
		}
	}
}