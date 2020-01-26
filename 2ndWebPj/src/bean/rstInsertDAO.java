package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class rstInsertDAO {

    public void insert(rstDTO dto) throws Exception {

        // 2. DB처리
        DBConnectionMgr mgr = DBConnectionMgr.getInstance();
        Connection con = mgr.getConnection();
        System.out.println("2. DB연결 ok..");

        // 3) SQL문 객체화
        String sql = "insert into rstdb values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, dto.getRstid());
        ps.setString(2, dto.getRstname());
        ps.setString(3, dto.getDistrict());
        ps.setString(4, dto.getWorkingtime());
        ps.setString(5, dto.getTel());
        ps.setString(6, dto.getAddr());
        ps.setString(7, dto.getDesc());
        ps.setString(8, dto.getImg1());
        ps.setString(9, dto.getImg2());
        ps.setString(10, dto.getWriter());
        System.out.println("3. sql문 객체화 ok..");

        // 4) SQL문 실행 요청
        ps.execute();
        System.out.println("4. sql문 실행 요청 ok..");

        ps.close();
        con.close();

    }

}