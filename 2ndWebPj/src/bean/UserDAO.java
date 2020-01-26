package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	DBConnectionMgr mgr = DBConnectionMgr.getInstance();

	public void Insert(UserDTO dto) throws Exception {
		Connection con = mgr.getConnection();
		String sql = "insert into usermember values(default,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getPhone());
		ps.setString(5, dto.getEmail());
		ps.executeUpdate();

	}

	public int Select(String id) throws Exception {
		Connection con = mgr.getConnection();
		String sql = "select * from usermember where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return 0;
		} else {
			return 1;
		}

	}

	public int Check(String id, String pw) throws Exception {
		Connection con = mgr.getConnection();
		String sql = "select pw from usermember where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		int result = 0;
		if (rs.next()) {
			if (rs.getString("pw").equals(pw)) {
				result = 1; // 로그인성공
			} else {
				result = 2; // 비번불일치
			}
		} else {
			result = 3; // 아이디존재하지않음
		}
		ps.close();
		con.close();
		return result;
	}

	public UserDTO getUserInfo(String id) throws Exception {
		Connection con = mgr.getConnection();
		String sql = "select * from usermember where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		UserDTO dto2 = null;
		dto2 = new UserDTO();
		if (rs.next()) {
			dto2.setId(rs.getString(2));
			dto2.setPw(rs.getString(3));
			dto2.setName(rs.getString(4));
			dto2.setPhone(rs.getString(5));
			dto2.setEmail(rs.getString(6));
		}
		System.out.println("id: " +  dto2.getId());
		System.out.println("pw: " +  dto2.getPw());
		ps.close();
		con.close();
		return dto2;
	}
	
	public void UpdateAll(String pw, String phone, String email,String id) throws Exception {
		Connection con = mgr.getConnection();
		String sql = "update usermember set pw = ?, phone = ?, email = ? where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, pw);
		ps.setString(2, phone);
		ps.setString(3, email);
		ps.setString(4, id);
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	public void Delete(String id) throws Exception {
		Connection con = mgr.getConnection();
		String sql = "delete from usermember where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		ps.close();
		con.close();
	}

}