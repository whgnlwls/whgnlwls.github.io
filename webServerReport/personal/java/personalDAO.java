package personal;
import java.sql.*;
import java.util.*;
import personal.*;

public class personalDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public personalDAO() {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		url="jdbc:postgresql://localhost:5432/mydb";
		user="studx";
		pass="gkrtod123A!";
	}
	
	public int insertUser(String userId, String userPasswd, String userName, String userPhone, String userEmail,
			String userGender, String[] userHobby) throws SQLException {
		String sql="insert into personal (userId, userPasswd, userName, userPhone, userEmail, userGender, userHobby1, userHobby2, userHobby3, userRegdate)"
				+ " values (?,?,?,?,?,?,?,?,?,?);";
		
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String userRegdate = formatter.format(new java.util.Date());
			ps.setString(1, userId);
			ps.setString(2, userPasswd);
			ps.setString(3, userName);
			ps.setString(4, userPhone);
			ps.setString(5, userEmail);
			ps.setString(6, userGender);
			ps.setString(7, userHobby[0]);
			ps.setString(8, userHobby[1]);
			ps.setString(9, userHobby[2]);
			ps.setString(10, userRegdate);
			
			int rec_no = ps.executeUpdate();
			return rec_no;
		}finally {
			if(ps != null) ps.close();
			if(conn !=null) conn.close();
		}
	}
	
	public int removeUser(String userId) throws Exception {
		String sql="delete from personal where userId=?";
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			
			int rec_no = ps.executeUpdate();
			return rec_no;
		} finally {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}
	}
	
	public boolean checkId(String userId) throws Exception {
		boolean flag = false;
		String sql="select * from personal where userId=?";
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} finally {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}
		return flag;
	}
	
	public boolean checkPwd(String userId, String userPasswd) throws SQLException {
		boolean flag = false;
		String sql="select * from personal where userId=?";
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				if(userId.equals(rs.getString("userId").trim()) 
				&& userPasswd.equals(rs.getString("userPasswd").trim())) {
					flag = true;
				}else {
					flag = false;
				}
			}
		} finally {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}
		return flag;
	}
	
	public List<personalDTO> findAllUser(String userSearch) throws SQLException {
		String sql = "select * from personal where userId=? or userName=? or userPhone=? or userEmail=? or userGender=? or userHobby1=? or userHobby2=? or userHobby3=? or userRegdate=?;";
		List<personalDTO> list = new ArrayList<personalDTO>();
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, userSearch);
			ps.setString(2, userSearch);
			ps.setString(3, userSearch);
			ps.setString(4, userSearch);
			ps.setString(5, userSearch);
			ps.setString(6, userSearch);
			ps.setString(7, userSearch);
			ps.setString(8, userSearch);
			ps.setString(9, userSearch);
			ResultSet rs = ps.executeQuery();
			list = makelist(rs);
			return list;
		} finally {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
			if(rs !=null) rs.close();
		}
	}
	
	public List<personalDTO> findHobbyUser(String userSearch) throws SQLException {
		String sql = "select * from personal where userHobby1=? or userHobby2=? or userHobby3=?;";
		List<personalDTO> list = new ArrayList<personalDTO>();
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, userSearch);
			ps.setString(2, userSearch);
			ps.setString(3, userSearch);
			ResultSet rs = ps.executeQuery();
			list = makelist(rs);
			return list;
		} finally {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
			if(rs !=null) rs.close();
		}
	}
	
	public List<personalDTO> findNameUser(String userSearch, String searchSelect) throws SQLException {
		String sql = "select * from personal where " + searchSelect + "=?;";
		List<personalDTO> list = new ArrayList<personalDTO>();
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, userSearch);
			ResultSet rs = ps.executeQuery();
			list = makelist(rs);
			return list;
		} finally {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
			if(rs !=null) rs.close();
		}
	}
	
	public List<personalDTO> makelist(ResultSet rs) throws SQLException {
		List<personalDTO> list = new ArrayList<personalDTO>();
		while(rs.next()) {
			personalDTO dto = new personalDTO();
			dto.setUserId(rs.getString("userId"));
			dto.setUserName(rs.getString("userName"));
			dto.setUserPhone(rs.getString("userPhone"));
			dto.setUserEmail(rs.getString("userEmail"));
			dto.setUserGender(rs.getString("userGender"));
			
			String shobby[] = {"", "", ""};
			shobby[0] = rs.getString("userHobby1");
			shobby[1] = rs.getString("userHobby2");
			shobby[2] = rs.getString("userHobby3");
			if(shobby[0] == null) shobby[0] = "";
			if(shobby[1] == null) shobby[1] = "";
			if(shobby[2] == null) shobby[2] = "";
			dto.setUserHobby(shobby);
			dto.setUserRegdate(rs.getString("userRegdate"));
			list.add(dto);
		}
		return list;
	}
	
}
