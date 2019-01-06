package com.kh.et.board.model.dao;

import static com.kh.et.common.JDBCTemplate.close;

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
import com.kh.et.member.model.vo.News;

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

	//내가 작성한 QnA
	public HashMap<String, Board> selectMyNewQnA(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Board> list = null;
		
		String query = prop.getProperty("selectMyNewQnA");//내가 작성한 QnA 리스트 
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			list = new HashMap<String, Board>();
			while(rset.next()) {
				Board b = new Board();//보드객체에 반복적으루 담는당
				
				b.setbNo(rset.getInt("B_NO"));
				b.setBtitle(rset.getString("B_TITLE"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbDate(rset.getDate("B_DATE"));
				b.setbCheckBest(rset.getString("B_CHECK_BEST"));
				
				list.put("my", b);	//보드객체 생성 후 필요한 값들을 넣어주고 키-밸류로 넣어준다. ->b(값=밸류)의 이름(키)을 "my"라고 해줬다
			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	//내가 스크랩한 다른 회원의 QnA
	public Board selectYourNewQnA(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectYourNewQnA");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setbNo(rset.getInt("B_NO"));
				b.setBtitle(rset.getString("B_TITLE"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbDate(rset.getDate("B_DATE"));
				b.setbCheckBest(rset.getString("B_CHECK_BEST"));
		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return b;
	}

	//내 소식보기
	//보드
	public ArrayList<News> selectMyNewsBoard(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<News> list = null;
		
		String query = prop.getProperty("selectMyNewsBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			
			list = new ArrayList<News>();
			if(list != null) {
				while(rset.next()) {
				News n = new News();
				System.out.println("다오 - 보드 있어요 ");
				n.setTitle(rset.getString("B_TITLE"));
				n.setName(rset.getString("M_NAME"));
				n.setType(rset.getString("BI_TYPE"));
				
				list.add(n);
				}
			}
	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println(list);
		return list;
	}
	
	//댓글 달기
	public int insertReply(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		//insertReply=INSERT INTO BOARD VALUES(SEQ_B_NO.NEXTVAL, ? , NULL, ? , DEFAULT, 'N', 1, 'Y', ?)
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getbWriter());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, b.getbNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
	
		return result;
	}
	
	//댓글 조회
	public ArrayList<Board> selectReplyList(Connection con, int getbNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectReplyList");
		//selectReplyList=SELECT B.B_NO, B.B_CONTENT, M.M_ID , B.B_REF_NO, B.B_TYPE, B.B_DATE FROM BOARD B JOIN MEMBER M ON(B.B_N_NO = M.M_NO) WHERE B.B_REF_NO = ? AND B.B_TYPE=1 AND B.B_STATUS ='Y' ORDER BY B.B_NO DESC
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getbNo );
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setbNo(rset.getInt("B_NO"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbWriter(rset.getString("M_ID"));
				b.setbRefNo(rset.getInt("B_REF_NO"));
				//b.set(rset.getInt("REPLY_LEVEL"));
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
	
	
	//글번호를 알아오기 위한 메서드
	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int tno = 0;
		
		String query = prop.getProperty("selectCurrval2");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				tno = rset.getInt("CURRVAL");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		
		return tno;
	}

	//내가 쓴 QnA 리스트 전체 불러오기
	public int getQnaListCount(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int QnaListCount = 0;
		
		String query = prop.getProperty("QnaListCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				QnaListCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return QnaListCount;
	}

	//QnaList 페이지 처리 후
	public ArrayList<Board> QnaList(Connection con, int currentPage, int limit, int mno, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> QnaList = null;
		String bitype1 = "좋아요";
		String bitype2 = "스크랩";
		
		String query = prop.getProperty("QnaListPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;	//각 페이징 페이지 마다 처음 페이지 번호(ex.1,11,21,31...)
			int endRow = startRow + limit - 1;	//각 페이징 페이지 마다 마지막 페이지 번호(ex.10,20,30,40...)
			
			pstmt.setString(1, bitype1);
			pstmt.setInt(2, mno);
			pstmt.setInt(3, num);
			pstmt.setString(4, bitype2);
			pstmt.setInt(5, mno);
			pstmt.setInt(6, num);
			pstmt.setInt(7, mno);
			pstmt.setInt(8, num);
			pstmt.setInt(9, startRow);
			pstmt.setInt(10, endRow);
			
			rset = pstmt.executeQuery();
			
			
			if(rset != null) {
				QnaList = new ArrayList<Board>();	//페이징 리스트 생성하고
				while(rset.next()) {
					Board b = new Board();
					
					b.setbNo(rset.getInt("B_NO"));
					b.setbLike(rset.getInt("LIKES"));
					b.setbScrap(rset.getInt("SCRAPS"));
					b.setBtitle(rset.getString("B_TITLE"));
					b.setbContent(rset.getString("B_CONTENT"));
					b.setbDate(rset.getDate("B_DATE"));
					
					
					QnaList.add(b);
				}
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return QnaList;
	
}

}



