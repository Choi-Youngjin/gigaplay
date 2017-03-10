package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.BoardDTO;
import util.DBUtil;

public class BoardDAO {
	
    // insert query 날리는 함수
		public static boolean addBoard(BoardDTO board) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("insert into board(bid, cid, member, title, content, category, hit, date) values(?, ?, ?, ?, ?, ?, ?, str_to_date(?, '%Y-%m-%d')");
				pstmt.setString(1, board.getBid());
				pstmt.setString(2, board.getCid());
				pstmt.setString(3, board.getMember());
				pstmt.setString(4, board.getTitle());
				pstmt.setString(5, board.getContent());
				pstmt.setString(6, board.getCategory());
				pstmt.setInt(7, board.getHit());
				pstmt.setString(8, board.getDate());
    			int result = pstmt.executeUpdate();
			
				if(result == 1){
					return true;
				}
			}finally{
				DBUtil.close(con, pstmt);
			}
			return false;
		}
		
	       // update query 날리는 함수(Title, content, category변경 쿼리)
		public static boolean updateBoard(String bid, String title, String content, String category) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				
				pstmt = con.prepareStatement("update board set title=?, content=?, category=? where bid=?");
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, category);
				pstmt.setString(4, bid);
				
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
		public static boolean deleteBoard(String bid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("delete from board where bid=?");
				pstmt.setString(1, bid);
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
		public static BoardDTO getBoard(String bid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			BoardDTO board = null;
			
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from board where bid=?");
				pstmt.setString(1, bid);
				rset = pstmt.executeQuery();
				if(rset.next()){
					board = new BoardDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), 0, rset.getString(8));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return board;
		}

		// select query 날리는 함수(모든값 가져옴)
		public static ArrayList<BoardDTO> getAllBoards() throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<BoardDTO> list = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from board");
				rset = pstmt.executeQuery();
				
				list = new ArrayList<BoardDTO>();
				while(rset.next()){
					list.add(new BoardDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), null, null, 0, null));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
}