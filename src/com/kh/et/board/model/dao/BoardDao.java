package com.kh.et.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	
	//전체 게시글 조회
	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;		
		String query = prop.getProperty("listCount");
		//listCount=SELECT COUNT(*) FROM BOARD WHERE B_TYPE= 0 AND B_STATUS='Y' AND b_title IS NOT NULL
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}	
		return listCount;
	}
	
	//페이징 처리 후 게시판 조회용 메소드 
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		//selectList=SELECT RNUM, B_NO, B_TITLE, B_CONTENT, B_DATE, m_id FROM (SELECT ROWNUM RNUM, B_NO, B_TITLE, B_CONTENT, B_DATE, m_id FROM (SELECT B.B_NO, B.B_TITLE, B.B_CONTENT, B.B_DATE, m.m_id FROM BOARD B JOIN MEMBER m ON(B.B_N_NO = m.m_no) WHERE b.b_type = '0' AND b.b_status = 'Y' )) WHERE RNUM BETWEEN ? AND ?
		
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
				
				b.setbNo (rset.getInt("B_NO"));
				b.setbWriter(rset.getString("M_ID")); //작성자
				b.setBtitle(rset.getString("B_TITLE"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbDate(rset.getDate("B_DATE"));
								
				list.add(b);
			}
			System.out.println(list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
}
