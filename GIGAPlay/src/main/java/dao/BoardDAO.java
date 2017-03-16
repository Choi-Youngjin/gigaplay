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
				pstmt = con.prepareStatement("insert into board(cid, member, title, content, category, hit, date) values(?, ?, ?, ?, ?, 0, now())");
				pstmt.setInt(1, board.getCid());
				pstmt.setString(2, board.getMember());
				pstmt.setString(3, board.getTitle());
				pstmt.setString(4, board.getContent());
				pstmt.setString(5, board.getCategory());
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
		public static boolean updateBoard(String bid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				
				pstmt = con.prepareStatement("update board set hit=hit+1 where bid=?");
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

		// delete query 날리는 함수
		public static boolean deleteBoard(int cid, int bid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("delete from board where cid=? and bid=?");
				pstmt.setInt(1, cid);
				pstmt.setInt(2, bid);
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
		public static BoardDTO getBoard(String cid, String bid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			BoardDTO board = null;
			
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from board where cid=? and bid=?");
				pstmt.setString(1, cid);
				pstmt.setString(2, bid);
				rset = pstmt.executeQuery();
				if(rset.next()){
					board = new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), rset.getString(8));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return board;
		}

		// select query 날리는 함수(모든값 가져옴)
		public static ArrayList<BoardDTO> getAllBoards(int cid, int offset) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<BoardDTO> list = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from board where cid = ? order by bid desc limit 10 offset ?");
				pstmt.setInt(1, cid);
				pstmt.setInt(2, offset);
				rset = pstmt.executeQuery();
				
				list = new ArrayList<BoardDTO>();
				while(rset.next()){
					list.add(new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), rset.getString(8)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
		
		public static int getAllBoardsNum(int cid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int num = 0;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select count(*) from board where cid = ? ");
				pstmt.setInt(1, cid);
				rset = pstmt.executeQuery();
				
				if(rset.next()){
					num = rset.getInt(1);
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return num;
		}
		
		public static ArrayList<BoardDTO> getBoardsByMid(String mid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<BoardDTO> list = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select b.bid, b.cid, b.member, b.title, b.content, b.category, b.hit, b.`date` from memberclub as mc, club as c, board as b where mc.mid=? and mc.cid = c.cid and c.cid = b.cid order by b.bid desc limit 5 ");
				list = new ArrayList<BoardDTO>();
				pstmt.setString(1, mid);
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					list.add(new BoardDTO(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), rset.getString(8)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
}