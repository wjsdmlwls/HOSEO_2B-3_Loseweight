package file;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class FileDAO {
	private Connection conn;
	
	public FileDAO() {
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
	    	String dbId="jspid";
	    	String dbPass="jsppass";	
	    	Class.forName("com.mysql.jdbc.Driver");
	    	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int uplode(String fileName,String fileRealName) {
		String sql="insert into file values(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}return -1;
	}
	

}
