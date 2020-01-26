package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	public void insert(BbsDTO dto, String userId) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "insert into board values(default,?,?,?,now(),?,?,?)";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, dto.getDistrict());
		ps.setString(2, dto.getRstName());
		ps.setString(3, userId);
		ps.setString(4, dto.getTitle());
		ps.setString(5, dto.getContent());
		ps.setDouble(6, dto.getRate());
		ps.executeUpdate();

		ps.close();
		con.close();
	}

	public ArrayList<BbsDTO> selectAll() throws Exception {
		ArrayList<BbsDTO> dist = new ArrayList();

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select distinct district from board ";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			BbsDTO dto = new BbsDTO();
			dto.setDistrict(rs.getString(1));
			dist.add(dto);
		}

		return dist;

	}

	public ArrayList<BbsDTO> selectList() throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select * from board";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		ArrayList<BbsDTO> list = new ArrayList();

		BbsDTO dto = null;
		while (rs.next()) {
			dto = new BbsDTO();
			dto.setNum(rs.getInt(1));
			dto.setDistrict(rs.getString(2));
			dto.setRstName(rs.getString(3));
			dto.setId(rs.getString(4));
			dto.setTitle(rs.getString(6));
			dto.setContent(rs.getString(7));
			dto.setRate(rs.getDouble(8));
			list.add(dto);
		}

		return list;

	}
	
	public BbsDTO selectDetail(int num) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		String sql = "select * from board where num = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, num);
		
		ResultSet rs = ps.executeQuery();
		
		BbsDTO dto2 = null;
		while (rs.next()) {
			dto2 = new BbsDTO();
			dto2.setNum(rs.getInt(1));
			dto2.setDistrict(rs.getString(2));
			dto2.setRstName(rs.getString(3));
			dto2.setId(rs.getString(4));
			dto2.setTitle(rs.getString(6));
			dto2.setContent(rs.getString(7));
			dto2.setRate(rs.getDouble(8));
			
		}
		
		return dto2;
		
	}
	

		
	public ArrayList<BbsDTO> selectRst(String dist) throws Exception {

		ArrayList<BbsDTO> rsts = new ArrayList();

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select distinct rstName from board where district = ?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, dist);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			BbsDTO dto = new BbsDTO();
			dto.setRstName(rs.getString(1));
			rsts.add(dto);
		}

		return rsts;

	}

	public void delete(int num) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "delete from board where num = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, num);
		ps.executeUpdate();
		
		ps.close();
		con.close();
	}

	public void update(int num, String content) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "update board set content = ? where num = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, content);
		ps.setInt(2, num);
		ps.executeUpdate();
		
		ps.close();
		con.close();
	}
	}