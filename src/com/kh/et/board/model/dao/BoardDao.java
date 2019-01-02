package com.kh.et.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.et.board.model.vo.Board;
import com.kh.et.tourBoard.model.vo.TourBoard;



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
		//insertBoard=INSERT INTO BOARD VALUES (SEQ_B_NO.NEXTVAL,'작성자','제목','내용', DEFAULT,'N', 0, 'Y',NULL);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getbWriter());
			pstmt.setString(2, b.getBtitle());
			pstmt.setString(3, b.getbContent());
					
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
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	//상세 글 보기 메소드
	public Board selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOne");
		//selectOne=SELECT B.B_NO, M.M_ID, B.B_TITLE, B.B_CONTENT, B.B_DATE FROM BOARD B JOIN MEMBER M ON(B.B_N_NO = M.M_NO) WHERE B.B_NO = ? AND B.B_STATUS = 'Y' AND B.B_TYPE=0
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setbNo(rset.getInt("B_NO"));
				b.setbWriter(rset.getString("M_ID"));
				b.setBtitle(rset.getString("B_TITLE"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbDate(rset.getDate("B_DATE"));
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		
		return b;
	}
	
	//수정 메소드
		public int updateBoard(Connection con, Board b) {
			System.out.println("수정 다오닷!");
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("updateBoard");
			//updateBoard=UPDATE Board SET b_title = ? , b_content = ? WHERE b_no= ? 

			try {
				pstmt = con.prepareStatement(query);		
				pstmt.setString(1, b.getBtitle());					
				pstmt.setString(2, b.getbContent());		
				
				pstmt.setInt(3, b.getbNo());
		
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;			
		}
		
		//게시글 삭제
		public int deleteBoard(Connection con, Board b) {
		System.out.println("식제 다오닷!");
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("deleteBoard");
			//deleteBoard=UPDATE Board SET b_status = 'N' WHERE b_no= ?
			System.out.println(query);

			try {
				pstmt = con.prepareStatement(query);		
				pstmt.setInt(1, b.getbNo() );							
		
				result = pstmt.executeUpdate();
				System.out.println(result);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;	
		}
		
		

		public ArrayList<Board> selectTopBoard(Connection con) {
		ArrayList<Board> boardList = null;
		String bitype = "좋아요";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectTopBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bitype);
			
			rset = pstmt.executeQuery();
			
			boardList = new ArrayList<Board>();
			while(rset.next()) {
				Board b = new Board();
				
				b.setbNo(rset.getInt("BI_B_NO"));
				b.setBtitle(rset.getString("B_TITLE"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbLike(rset.getInt("CNT"));
				
				boardList.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return boardList;
	}

	public ArrayList<Board> selectQnAList(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectQnAList");
		
		
		return null;
	}

	
	
	

}
