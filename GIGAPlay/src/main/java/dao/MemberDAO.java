/* CREATE TABLE activist (
       activist_id          VARCHAR2(20)  PRIMARY KEY,
       name                 VARCHAR2(20) NULL,
       password             VARCHAR2(20) NULL,
       major                VARCHAR2(50) NULL
);  */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDTO;
import util.DBUtil;

public class MemberDAO {
	
       // insert query 날리는 함수
		public static boolean addMember(MemberDTO member) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("insert into member(mid, pw, name, birth, groups, phone, email) values(?, ?, ?, str_to_date(?, '%Y-%m-%d'), ?, ?, ?)");
				pstmt.setString(1, member.getMid());
				pstmt.setString(2, member.getPw());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getBirth());
				pstmt.setString(5, member.getGroups());
				pstmt.setString(6, member.getPhone());
				pstmt.setString(7, member.getEmail());
				int result = pstmt.executeUpdate();
			
				if(result == 1){
					return true;
				}
			}finally{
				DBUtil.close(con, pstmt);
			}
			return false;
		}
		
	       // update query 날리는 함수(비밀번호변경)
		public static boolean updateMember(String mid, String pw) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				
				pstmt = con.prepareStatement("update member set pw=? where mid=?");
				pstmt.setString(1, pw);
				pstmt.setString(2, mid);

				
				
				int result = pstmt.executeUpdate();
				if(result == 1){
					return true;
				}
			}finally{
				DBUtil.close(con, pstmt);
			}
			return false;
		}

		// delete query 날리는 함수
		public static boolean deleteMember(String mid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("delete from member where mid=?");
				pstmt.setString(1, mid);
				int result = pstmt.executeUpdate();
				if(result == 1){
					return true;
				}
			}finally{
				DBUtil.close(con, pstmt);
			}
			return false;
		}
	
		// select query 날리는 함수
		public static MemberDTO getMembers(String mid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			MemberDTO member = null;
			
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from member where mid=?");
				pstmt.setString(1, mid);
				rset = pstmt.executeQuery();
				if(rset.next()){
					member = new MemberDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7), 0, null);
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return member;
		}

		// select query 날리는 함수(모든값 가져옴)
		//sql - select * from activist
		public static ArrayList<MemberDTO> getAllMembers() throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<MemberDTO> list = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from member");
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
