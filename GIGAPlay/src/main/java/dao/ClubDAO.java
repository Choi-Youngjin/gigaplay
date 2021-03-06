package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ClubDTO;
import util.DBUtil;

public class ClubDAO {
	
    // insert query 날리는 함수
		public static boolean addClub(ClubDTO club) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("insert into club(cid, cgroup, ctype, name, category, category2, price, point, intro, location, picture) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				pstmt.setString(1, club.getCid());
				pstmt.setString(2, club.getCgroup());
				pstmt.setString(3, club.getCtype());
				pstmt.setString(4, club.getName());
				pstmt.setString(5, club.getCategory());
				pstmt.setString(6, club.getCategory2());
				pstmt.setInt(7, club.getPrice());
				pstmt.setInt(8, club.getPoint());
				pstmt.setString(9, club.getIntro());
				pstmt.setString(10, club.getLocation());
				pstmt.setString(11, club.getPicture());

    			int result = pstmt.executeUpdate();
			
				if(result == 1){
					return true;
				}
			}finally{
				DBUtil.close(con, pstmt);
			}
			return false;
		}
		
		public static boolean addMemberToClub(int cid, String mid, String grade) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("insert into memberclub(cid, mid, grade) values(?, ?, ?)");
				pstmt.setInt(1, cid);
				pstmt.setString(2, mid);
				pstmt.setString(3, grade);
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
					public static int getLastAddedClub() throws SQLException{
						Connection con = null;
						PreparedStatement pstmt = null;
						ResultSet rset = null;
						int cid = 0;

						try{
							con = DBUtil.getConnection();
							pstmt = con.prepareStatement("select cid from club order by cid desc limit 1");
							rset = pstmt.executeQuery();
							
							if(rset.next()){
								cid = rset.getInt(1);
							}
						}finally{
							DBUtil.close(con, pstmt, rset);
						}
						return cid;
					}
		
	       // update query 날리는 함수(category, category2, location변경 쿼리)
		public static boolean updateClub(String cid, String category, String category2, String location) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				
				pstmt = con.prepareStatement("update club set category=?, category2=?, location=? where cid=?");
				pstmt.setString(1, category);
				pstmt.setString(2, category2);
				pstmt.setString(3, location);
				pstmt.setString(4, cid);
				
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
		public static boolean deleteClub(String cid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("delete from club where cid=?");
				pstmt.setString(1, cid);
				int result = pstmt.executeUpdate();
				if(result == 1){
					return true;
				}
			}finally{
				DBUtil.close(con, pstmt);
			}
			return false;
		}
		public static int getClubNum(String ctype) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int num = 0;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select count(*) from club where ctype=?");
				pstmt.setString(1, ctype);
				rset = pstmt.executeQuery();
				if(rset.next()){
					num = rset.getInt(1);
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return num;
		}
		
		public static int searchClubNum(String keyword, String ctype) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int num = 0;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select count(*) from club where name like concat('%', ?, '%') and ctype=?");
				pstmt.setString(1, keyword);
				pstmt.setString(2, ctype);
				rset = pstmt.executeQuery();
				if(rset.next()){
					num = rset.getInt(1);
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return num;
		}
		
		public static int getClubNumByCategory(String ctype, String category) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int num = 0;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select count(*) from club where ctype=? and category=?");
				pstmt.setString(1, ctype);
				pstmt.setString(2, category);
				rset = pstmt.executeQuery();
				if(rset.next()){
					num = rset.getInt(1);
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return num;
		}
		
		public static int searchClubNumByCategory(String keyword, String ctype, String category) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int num = 0;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select count(*) from club where name like concat('%', ?, '%') and ctype=? and category=?");
				pstmt.setString(1, keyword);
				pstmt.setString(2, ctype);
				pstmt.setString(3, category);
				rset = pstmt.executeQuery();
				if(rset.next()){
					num = rset.getInt(1);
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return num;
		}
		
		public static ClubDTO getClubByCid(int cid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ClubDTO club = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from club where cid=?");
				pstmt.setInt(1, cid);
				rset = pstmt.executeQuery();
				if(rset.next()){
					club = new ClubDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), 0, rset.getString(9), rset.getString(10), rset.getString(11));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return club;
		}
		
		public static boolean isMember(int cid, String mid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ClubDTO club = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select count(*) from memberclub where cid=? and mid=?");
				pstmt.setInt(1, cid);
				pstmt.setString(2, mid);
				rset = pstmt.executeQuery();
				if(rset.next()){
					if(rset.getInt(1) != 0) {
						return true;
					}
					else return false;
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return false;
		}
		
		
		// select query 날리는 함수
		public static ArrayList<ClubDTO> getClub(String ctype, int limit, int offset) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<ClubDTO> list = null;

			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from club where ctype=? order by cid desc limit ? offset ?");
				pstmt.setString(1, ctype);
				pstmt.setInt(2,  limit);
				pstmt.setInt(3, offset);
				rset = pstmt.executeQuery();
				list = new ArrayList<ClubDTO>();
				while(rset.next()){
					list.add(new ClubDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), 0, rset.getString(9), rset.getString(10), rset.getString(11)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
		
		public static ArrayList<ClubDTO> searchClub(String keyword, String ctype, int limit, int offset) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<ClubDTO> list = null;

			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from club where name like concat('%', ?, '%') and ctype=? order by cid desc limit ? offset ?");
				pstmt.setString(1, keyword);
				pstmt.setString(2, ctype);
				pstmt.setInt(3,  limit);
				pstmt.setInt(4, offset);
				rset = pstmt.executeQuery();
				list = new ArrayList<ClubDTO>();
				while(rset.next()){
					list.add(new ClubDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), 0, rset.getString(9), rset.getString(10), rset.getString(11)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
		
		public static ArrayList<ClubDTO> getClubByCategory(String ctype, String category, int limit, int offset) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<ClubDTO> list = null;

			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from club where ctype=? and category=? order by cid desc limit ? offset ?");
				pstmt.setString(1, ctype);
				pstmt.setString(2, category);
				pstmt.setInt(3,  limit);
				pstmt.setInt(4, offset);
				rset = pstmt.executeQuery();
				list = new ArrayList<ClubDTO>();
				while(rset.next()){
					list.add(new ClubDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), 0, rset.getString(9), rset.getString(10), rset.getString(11)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
		
		public static ArrayList<ClubDTO> searchClubByCategory(String keyword, String ctype, String category, int limit, int offset) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<ClubDTO> list = null;

			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from club where name like concat('%', ?, '%') and ctype=? and category=? order by cid desc limit ? offset ?");
				pstmt.setString(1, keyword);
				pstmt.setString(2, ctype);
				pstmt.setString(3, category);
				pstmt.setInt(4,  limit);
				pstmt.setInt(5, offset);
				rset = pstmt.executeQuery();
				list = new ArrayList<ClubDTO>();
				while(rset.next()){
					list.add(new ClubDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), 0, rset.getString(9), rset.getString(10), rset.getString(11)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
		
		// select query 날리는 함수(모든값 가져옴)
		public static ArrayList<ClubDTO> getAllClubs() throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<ClubDTO> list = null;
			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select * from club order by cid desc");
				rset = pstmt.executeQuery();
				
				list = new ArrayList<ClubDTO>();
				while(rset.next()){
					list.add(new ClubDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), 0, rset.getString(9), rset.getString(10), rset.getString(11)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
		
		// select query 날리는 함수
		public static ArrayList<ClubDTO> getClubName(String mid) throws SQLException{
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<ClubDTO> list = null;

			try{
				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select c.cid, c.cgroup, c.ctype, c.name, c.category, c.category2, c.price, c.`point`, c.intro, c.location, c.picture from memberclub as mc, club as c where mc.mid=? and mc.cid = c.cid");
				pstmt.setString(1, mid);
				rset = pstmt.executeQuery();
				list = new ArrayList<ClubDTO>();
				while(rset.next()){
					list.add(new ClubDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getInt(7), 0, rset.getString(9), rset.getString(10), rset.getString(11)));
				}
			}finally{
				DBUtil.close(con, pstmt, rset);
			}
			return list;
		}
				
}