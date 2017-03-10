package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.CommentDTO;
import util.DBUtil;

public class CommentDAO {
	
        // insert query 날리는 함수
		public static boolean addComment(CommentDTO comment) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("insert into comment(commid, bid, content, date) values(?, ?, ?, str_to_date(?, '%Y-%m-%d'))");
				pstmt.setString(1, comment.getCommid());
				pstmt.setString(2, comment.getBid());
				pstmt.setString(3, comment.getContent());
				pstmt.setString(4, comment.getDate());
				int result = pstmt.executeUpdate();
				if(result == 1){
					return true;
				}
			}finally{
				DBUtil.close(con, pstmt);
			}
			return false;
		}
		
        // update query 날리는 함수(컨텐츠변경 쿼리)
		public static boolean updateComment(String commid, String content, String date) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				
				pstmt = con.prepareStatement("update comment set content=? where commid=?");
				pstmt.setString(1, content);
				pstmt.setString(2, commid);

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
		public static boolean deleteComment(String commid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("delete from comment where commid=?");
				pstmt.setString(1, commid);
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
		public static CommentDTO getComment(String commid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			CommentDTO comment = null;
			
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from comment where commid=?");
				pstmt.setString(1, commid);
				rset = pstmt.executeQuery();
				if(rset.next()){
					comment = new CommentDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return comment;
		}

		// select query 날리는 함수(모든값 가져옴)
		//sql - select * from activist
		public static ArrayList<CommentDTO> getAllComments() throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<CommentDTO> list = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from commid");
				rset = pstmt.executeQuery();
				
				list = new ArrayList<CommentDTO>();
				while(rset.next()){
					list.add(new CommentDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
}