package com.kh.et.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.et.board.model.vo.Board;
import static com.kh.et.common.JDBCTemplate.*;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao(){
		String fileName = BoardDao.class.getResource("/sql/board/board.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//글 작성
	public int insertBoard(Connection con, Board b) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println("Dao : " +b.getBtitle());
		System.out.println("Dao :" + b.getbContent());
		
		String query = prop.getProperty("insertBoard");
		//insertBoard=INSERT INTO BOARD VALUES (SEQ_B_NO.NEXTVAL,1,'제목','내용', DEFAULT,'N', 0, 'Y',NULL);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBtitle());
			pstmt.setString(2, b.getbContent());
					
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	//페이징 처리
	/*public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		//
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBid(rset.getInt("BID"));
				b.setbType(rset.getInt("BTYPE"));
				b.setBno(rset.getInt("BNO"));
				b.setCategory(rset.getString("CNAME"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbContent(rset.getString("BCONTENT"));
				b.setbWriter(rset.getString("NICK_NAME"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setRefBid(rset.getInt("REF_BID"));
				b.setReplyLevel(rset.getInt("REPLY_LEVEL"));
				b.setbDate(rset.getDate("BDATE"));
				b.setStatus(rset.getString("STATUS"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		
		return list;
	}
*/
}
