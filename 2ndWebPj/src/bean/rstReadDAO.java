package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
//selectRow-ok
//selectAll-ok
// selectDistrict-ok
//selectPart-not(검색바)

public class rstReadDAO {

	public rstDTO selectRow(String rstId) throws Exception {
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("2. db연결 ok!!");
		
		String sql = "select * from rstdb where rstid =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, rstId);
		System.out.println("3. sql문 객체화 ok!!");
	
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 실행 요청 ok!!");
		
		rstDTO dto2 = null;
		while(rs.next()) {
			dto2 = new rstDTO();
			dto2.setRstid(rs.getString(1));
			dto2.setRstname(rs.getString(2));
			dto2.setDistrict(rs.getString(3));
			dto2.setWorkingtime(rs.getString(4));
			dto2.setTel(rs.getString(5));
			dto2.setAddr(rs.getString(6));
			dto2.setDesc(rs.getString(7));
			dto2.setImg1(rs.getString(8));
			dto2.setImg2(rs.getString(9));
			dto2.setWriter(rs.getString(10));
		}
		ps.close();
		con.close();
		return dto2;
	}

	public rstDTO selectRst(int rstId) throws Exception {
			
			DBConnectionMgr mgr = DBConnectionMgr.getInstance();
			Connection con = mgr.getConnection();
			System.out.println("2. db연결 ok!!");
			
			String sql = "select * from rstdb where rstid =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,rstId);
			System.out.println("3. sql문 객체화 ok!!");
		
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 실행 요청 ok!!");
			
			rstDTO dto2 = null;
			while(rs.next()) {
				dto2 = new rstDTO();
				dto2.setRstid(rs.getString(1));
				dto2.setRstname(rs.getString(2));
				dto2.setDistrict(rs.getString(3));
				dto2.setWorkingtime(rs.getString(4));
				dto2.setTel(rs.getString(5));
				dto2.setAddr(rs.getString(6));
				dto2.setDesc(rs.getString(7));
				dto2.setImg1(rs.getString(8));
				dto2.setImg2(rs.getString(9));
				dto2.setWriter(rs.getString(10));
			}
			ps.close();
			con.close();
			return dto2;
}


	
    public ArrayList<rstDTO> selectAll() throws Exception {
      
        DBConnectionMgr mgr = DBConnectionMgr.getInstance();
        Connection con = mgr.getConnection();
        System.out.println("2. DB연결 ok..");
        String sql = "select * from rstdb";
        PreparedStatement ps = con.prepareStatement(sql);
        System.out.println("3. SQL문 객체화 ok...");

        ResultSet rs = ps.executeQuery();
        System.out.println("4. SQL문 실행 요청 ok...");
        
        rstDTO dto2=null;
        ArrayList<rstDTO>list=new ArrayList<rstDTO>();
        while (rs.next()) {
          	dto2 = new rstDTO();
            dto2.setRstid(rs.getString(1));
            dto2.setRstname(rs.getString(2));
            dto2.setDistrict(rs.getString(3));
            dto2.setWorkingtime(rs.getString(4));
            dto2.setTel(rs.getString(5));
            dto2.setAddr(rs.getString(6));
            dto2.setDesc(rs.getString(7));
            dto2.setImg1(rs.getString(8));
            dto2.setImg2(rs.getString(9));
            dto2.setWriter(rs.getString(10));
            list.add(dto2);
        }
        ps.close();
        con.close();
        return list;
    }
    
    public ArrayList<rstDTO> selectDistrict(String district) throws Exception {
        
        DBConnectionMgr mgr = DBConnectionMgr.getInstance();
        Connection con = mgr.getConnection();
        System.out.println("2. DB연결 ok.."+ district);
        String sql = "select * from rstdb where district = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, district);
        System.out.println("3. SQL문 객체화 ok...");
        System.out.println(ps + "sql쿼리확인");
        ResultSet rs = ps.executeQuery();
        System.out.println("4. SQL문 실행 요청 ok...");
        
        
        ArrayList<rstDTO>list=new ArrayList<rstDTO>();
        while (rs.next()) {
          	rstDTO dto2 = new rstDTO();
            dto2.setRstid(rs.getString(1));
            dto2.setRstname(rs.getString(2));
            dto2.setDistrict(rs.getString(3));
            dto2.setWorkingtime(rs.getString(4));
            dto2.setTel(rs.getString(5));
            dto2.setAddr(rs.getString(6));
            dto2.setDesc(rs.getString(7));
            dto2.setImg1(rs.getString(8));
            dto2.setImg2(rs.getString(9));
            dto2.setWriter(rs.getString(10));
            list.add(dto2);
        }
        ps.close();
        con.close();
        return list;
    }
    
  public ArrayList<rstDTO> selectSearch(String keyword) throws Exception {
        
        DBConnectionMgr mgr = DBConnectionMgr.getInstance();
        Connection con = mgr.getConnection();
        System.out.println("2. DB연결 ok.."+ keyword);
        String sql = "SELECT * FROM rstdb WHERE rstname LIKE concat('%',?,'%')";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, keyword); 
        System.out.println("3. SQL문 객체화 ok...");
        System.out.println(ps + "sql쿼리확인");
        ResultSet rs = ps.executeQuery();
        System.out.println("4. SQL문 실행 요청 ok...");
        
        
        ArrayList<rstDTO>list=new ArrayList<rstDTO>();
        while (rs.next()) {
          	rstDTO dto2 = new rstDTO();
            dto2.setRstid(rs.getString(1));
            dto2.setRstname(rs.getString(2));
            dto2.setDistrict(rs.getString(3));
            dto2.setWorkingtime(rs.getString(4));
            dto2.setTel(rs.getString(5));
            dto2.setAddr(rs.getString(6));
            dto2.setDesc(rs.getString(7));
            dto2.setImg1(rs.getString(8));
            dto2.setImg2(rs.getString(9));
            dto2.setWriter(rs.getString(10));
            list.add(dto2);
        }
        ps.close();
        con.close();
        return list;
    }
}
