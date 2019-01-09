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

import javax.mail.Session;

import com.kh.et.board.model.vo.Board;
import com.kh.et.board.model.vo.BoardInterest;
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
		//selectOne=SELECT B.B_NO, B.B_N_NO, M.M_ID, B.B_TITLE, B.B_CONTENT, B.B_DATE FROM BOARD B JOIN MEMBER M ON(B.B_N_NO = M.M_NO) WHERE B.B_NO = ? AND B.B_STATUS = 'Y' AND B.B_TYPE=0
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setbNo(rset.getInt("B_NO"));
				/*b.setbWriterNo(rset.getInt("B_N_NO"));*/
				b.setbWriter(rset.getString("M_ID"));
				b.setBtitle(rset.getString("B_TITLE"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbDate(rset.getDate("B_DATE"));
				if(rset.getString("A_CHANGE_NAME")== null) {
					b.setbCheckBest("/et/image/common/logo_c.png");
				}else {
					b.setbCheckBest("/et/profileUpload/"+rset.getString("A_CHANGE_NAME"));
				}
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
	
	
	///글번호를 알아오기 위한 메서드
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

	
	// QnaList 페이지 처리 후
	public ArrayList<HashMap<String, Object>> QnaList(Connection con, int currentPage, int limit, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> QnaList = null;
		HashMap<String, Object> hmap = null;
		String bitype1 = "좋아요";
		String bitype2 = "스크랩";

		String query = prop.getProperty("QnaListPaging");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1; // 각 페이징 페이지 마다 처음 페이지 번호(ex.1,11,21,31...)
			int endRow = startRow + limit - 1; // 각 페이징 페이지 마다 마지막 페이지 번호(ex.10,20,30,40...)

			pstmt.setInt(1, mno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			if (rset != null) {
				QnaList = new ArrayList<HashMap<String, Object>>(); // 페이징 리스트 생성하고
				while (rset.next()) {
					hmap = new HashMap<String, Object>();

					hmap.put("bNo", rset.getInt("B_NO"));
					/*
					 * hmap.put("bLikes", rset.getString("LIKES")); 
					 * hmap.put("bScraps",rset.getString("SCRAPS"));
					 */
					hmap.put("bTitle", rset.getString("B_TITLE"));
					hmap.put("bContent", rset.getString("B_CONTENT"));
					hmap.put("bDate", rset.getDate("B_DATE"));
					hmap.put("rnum", rset.getInt("RNUM"));


					QnaList.add(hmap);
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return QnaList;

	}
	
	// 내가 스크랩한 QnA 리스트 전체 불러오기
	public int getYourQnaListCount(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int QnaListCount = 0;

		String query = prop.getProperty("YourQnaListCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				QnaListCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("리스트 카운트 : " + QnaListCount);
		return QnaListCount;
	}

	// QnaList 페이지 처리 후
	public ArrayList<HashMap<String, Object>> YourQnaList(Connection con, int currentPage, int limit, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> QnaList = null;
		HashMap<String, Object> hmap = null;
		String bitype1 = "좋아요";
		String bitype2 = "스크랩";

		String query = prop.getProperty("YourQnaListPaging");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1; // 각 페이징 페이지 마다 처음 페이지 번호(ex.1,11,21,31...)
			int endRow = startRow + limit - 1; // 각 페이징 페이지 마다 마지막 페이지 번호(ex.10,20,30,40...)

			pstmt.setInt(1, mno);
			pstmt.setString(2, bitype2);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rset = pstmt.executeQuery();

			if (rset != null) {
				QnaList = new ArrayList<HashMap<String, Object>>(); // 페이징 리스트 생성하고
				while (rset.next()) {
					hmap = new HashMap<String, Object>();

					hmap.put("bNo", rset.getInt("B_NO"));
					/*
					 * hmap.put("bLikes", rset.getString("LIKES")); 
					 * hmap.put("bScraps",rset.getString("SCRAPS"));
					 */
					hmap.put("bTitle", rset.getString("B_TITLE"));
					hmap.put("bContent", rset.getString("B_CONTENT"));
					hmap.put("bDate", rset.getDate("B_DATE"));
					hmap.put("rnum", rset.getInt("RNUM"));

					QnaList.add(hmap);
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return QnaList;

	}

	
	//해당 글 좋아요 갯수 
	public int getLikeNum(Connection con, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		 
		String query = prop.getProperty("getBoardLikeNum");
		//getBoardLikeNum=SELECT BI.BI_B_NO, COUNT(BI.BI_B_NO) CNT FROM BOARDINTEREST BI JOIN BOARD B ON (BI.BI_B_NO = B.B_NO) WHERE B.B_NO = ? AND BI.BI_TYPE = ? GROUP BY BI_B_NO
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			pstmt.setString(2, "좋아요");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("CNT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	//좋아요 클릭
	public int clickLike(Connection con, BoardInterest bi, int getNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("clickLike");
		//clickLike=INSERT INTO BOARDINTEREST SELECT SEQ_BI_NO.NEXTVAL,?,?,?,? FROM DUAL A WHERE NOT EXISTS ( SELECT * FROM BOARDINTEREST WHERE BI_B_NO = ?  AND BI_GIVE_NO = ? AND BI_TYPE = ? )
		try {
			System.out.println("사용자 번호"+getNo);
			String type = "좋아요";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getNo);
			pstmt.setInt(2, bi.getBno());
			pstmt.setInt(3, bi.getUser());
			pstmt.setString(4, type);
			pstmt.setInt(5, bi.getBno());
			pstmt.setInt(6, bi.getUser());
			pstmt.setString(7, type);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("클릭해서 인설트가 됬을까?"+result);
		return result;
	}
	
	//좋아요 취소
	public int clickUnLike(Connection con, BoardInterest bi,int getNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("clickUnLike");
		System.out.println("좋아요취소 다오전이야");
		//clickUnLike=DELETE FROM BOARDINTEREST WHERE  BI_B_NO = ? AND BI_GIVE_NO = ? AND BI_TYPE = ?
		try {
			String type = "좋아요";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bi.getBno());
			pstmt.setInt(2, bi.getUser());			
			pstmt.setString(3, type);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("서비스 다오 후야");
		System.out.println(result);
		return result;
	}
	
	
		
	//넘버가져오기
	public int getNo(Connection con, String writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		 
		String query = prop.getProperty("getWriterNo");
		//getWriterNo=SELECT M_NO FROM  MEMBER  WHERE M_ID = ? 
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,writer);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("M_NO");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	

	public int insertClaim(Connection con, String reason, int userNo, int boardNo, int boardwriterNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		 
		String query = prop.getProperty("insertClaim");
		//getWriterNo=SELECT M_NO FROM  MEMBER  WHERE M_ID = ? 
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardwriterNo);
			pstmt.setInt(2, boardNo);
			pstmt.setInt(3, userNo);
			pstmt.setString(4,reason);
			
			result = pstmt.executeUpdate();
			System.out.println("insertClaim 실행 - dao");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//스크랩 수 가져오기
	public int getScrapNum(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		 
		String query = prop.getProperty("getBoardLikeNum");
		//getBoardLikeNum=SELECT BI.BI_B_NO, COUNT(BI.BI_B_NO) CNT FROM BOARDINTEREST BI JOIN BOARD B ON (BI.BI_B_NO = B.B_NO) WHERE B.B_NO = ? AND BI.BI_TYPE = ? GROUP BY BI_B_NO
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setString(2, "스크랩");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("CNT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	
	
	//보드 좋아요 포인트 시작
	public ArrayList<HashMap<String, Object>> sameListBoardLike(Connection con, BoardInterest bi, int getNo) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("sameListBoardLike");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bi.getBno());
			pstmt.setInt(2, bi.getUser());
			pstmt.setInt(3, getNo);
			pstmt.setString(4, "게시글좋아요받기");
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();  //멤버 객체대신 hash맵사용
				
				hmap.put("ponno", rset.getInt("PO_N_NO"));  //DB 대소문자 상관없음. 단, 값은 구분함
				hmap.put("bibno", rset.getInt("BI_B_NO"));
				hmap.put("biGiveno", rset.getString("BI_GIVE_NO"));

				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int insertBoardLikePoint(Connection con, BoardInterest bi, int getNo) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("insertBoardLikePoint");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, getNo);
			pstmt.setString(2, "게시글좋아요받기");
			pstmt.setInt(3, bi.getBno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {	
			close(pstmt);
		}
	

		return result;
	}

	public int updataBoardClickedMember(Connection con, BoardInterest bi, int getNo) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updataBoardClickedMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	return result;
	}

	// 신고기록 확인하기 (신고한 회원, 신고된 글번호 )
	public int checkExistClaim(Connection con, int userNo, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkExistClaim");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, boardNo);
			
			rset = pstmt.executeQuery();
			if(rset != null	) {
				
				while(rset.next()) {
					result++;
				}
			}
			System.out.println("dao - 이전에 신고한 기록 : "+ result);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}



