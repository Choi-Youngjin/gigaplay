package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ClubDTO;
import dto.MemberDTO;
import util.DBUtil;

public class ClubApplyDAO {
	public static boolean addClubApply(String amid, String cid) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into applymember(amid, cid) values(?, ?)");
			pstmt.setString(1, amid);
			pstmt.setString(2, cid);

			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	public static boolean applyNo(String amid, String cid) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from applymember where amid=? and cid=?");
			pstmt.setString(1, amid);
			pstmt.setString(2, cid);

			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	public static ArrayList<MemberDTO> getAppliedMemberOfClub(int cid) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MemberDTO> list = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select m.mid, m.pw, m.name, m.birth, m.groups, m.phone, m.email, m.`point`, m.department from member as m, club as c, applymember as am where c.cid=? and m.mid = am.amid and c.cid = am.cid");
			pstmt.setInt(1, cid);
			rset = pstmt.executeQuery();
			list = new ArrayList<MemberDTO>();
			while(rset.next()){
				list.add(new MemberDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7), 0, null));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
