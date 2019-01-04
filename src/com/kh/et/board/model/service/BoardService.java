package com.kh.et.board.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.commit;
import static com.kh.et.common.JDBCTemplate.getConnection;
import static com.kh.et.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.et.board.model.dao.BoardDao;
import com.kh.et.board.model.vo.Board;
import com.kh.et.member.model.dao.MemberDao;
import com.kh.et.member.model.vo.Member;
import com.kh.et.member.model.vo.News;
import com.kh.et.plan.model.dao.PlanDao;
import com.kh.et.plan.model.vo.Plan;
import com.kh.et.point.model.dao.PointDao;
import com.kh.et.point.model.service.PointService;
import com.kh.et.tourBoard.model.dao.TourBoardDao;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;


public class BoardService {

	//글 작성 //포인트 부분 Member m매개변수 추가
	//리턴도 Member로 리턴하도록 변환
	public Member insertBoard(Board b, Member m) {
		Connection con = getConnection();
		//포인트 부분  작성
		int result =0;
		//result = result1로변경(변수나 Dao에서 건드리지 않음)
		int result1 = new BoardDao().insertBoard(con, b);
		
		//글번호를 가져오기위해 커발추가
		if(result1>0) {
			int tno  = new BoardDao().selectCurrval(con);
			b.setbNo(tno);
		}
		
		//포인트 테이블 삽입을 위해 실행 dao는 PointDao에 배치
		int result2 = new PointDao().insertPointBoard(con,m,b);
		
		//멤버의 포인트값을 업데이트하기 위해 실행(dao는 PointDao에 배치)
		int result3 = new PointDao().BoardMemberPointUpdate(con,m);
		
		/*if(result1>0 && result2>0 && result3>0 ) {
			result=1;
			commit(con);
		}else {
			rollback(con);
		}
		
		//아래 if문이 기존의 if문
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;*/
		
		//아래는 세션 request를 위해 실행함. 이것을 실행하지 않으면 로그아웃 후에 마이페이지 포인트값이 바뀌기 때문에 꼭 필요.
		Member loginUser = null;
		if(result1>0 && result2>0 && result3>0) {
			loginUser = new MemberDao().selectLoginUser(con, m);
			if(loginUser != null) {
				Member profile = new MemberDao().profileChcek(con, m);
				if(profile != null) {
					loginUser.setA_change_Name("/et/profileUpload/"+profile.getA_change_Name());
				} else {
					loginUser.setA_change_Name("/et/image/common/logo_c.png");
				}
			}
		}else {
			rollback(con);
		}
		close(con);
		
		return loginUser;
	}
	
	//전체 게시글 조회
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new BoardDao().getListCount(con);
		
		if(listCount>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return listCount;
	}

	////페이징처리 적용한 게시물 조회용 메소드
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list 
			= new BoardDao().selectList(con, currentPage, limit);
		
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return list;
	}
	
	//상세 글 보기 메소드
	public Board selectOne(int num) {
		Connection con = getConnection();
		
		Board b = null;
		
			
		b = new BoardDao().selectOne(con, num);
	
		close(con);
		return b;
	}

	

	

	public ArrayList<Board> selectTopBoard() {
		Connection con = getConnection();
		
		ArrayList<Board> boardList = new BoardDao().selectTopBoard(con);
		
		if(boardList != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return boardList;
	}

	
	//게시글 수정
	public int updateBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().updateBoard(con, b);
		
		if(result > 0) commit(con);
		
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	//게시글 삭제
	public int deleteBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().deleteBoard(con, b);
		
		if(result > 0) commit(con);
		
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	//내 QnA, 내가 스크랩한 QnA 리스트 보기(최근)
	public HashMap<String, Board> selectMyActivityQnA(int mno) {
		Connection con = getConnection();
		
		HashMap<String, Board> list = new BoardDao().selectMyNewQnA(con, mno);	//내가 작성한 QnA리스트 해쉬맵으로 뽑기
		
		Board b = new BoardDao().selectYourNewQnA(con,mno);//내가 스크랩한 QnA 해쉬맵으로 뽑기
		
		if(list != null) {
			
			if(b != null) {
				list.put("you", b);
			}
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return list;
	}

	//내 소식 보기
	public ArrayList<News> selectMyNews(int mno) {
		Connection con = getConnection();
		System.out.println("service진입");
		
		ArrayList<News> Boardlist = new BoardDao().selectMyNewsBoard(con, mno);
		
		ArrayList<News> Planlist = new PlanDao().selectMyNewsPlan(con, mno);
		
		ArrayList<News> allList = new ArrayList<News>();
		allList.addAll(Boardlist);
		allList.addAll(Planlist);
		
		close(con);
		
		return allList;
	}
	
	//댓글 달기
	public ArrayList<Board> insertReply(Board b) {
		Connection con = getConnection();
		ArrayList<Board> replyList = null;
		
		int result = new BoardDao().insertReply(con, b);
		
		if(result > 0) {
			commit(con);
			replyList = new BoardDao().selectReplyList(con, b.getbNo());
		}else {
			rollback(con);
		}
		
		close(con);
		
		return replyList;
	}

	//내가 쓴 QnA 리스트 전체 불러오기
	public int getQnaListCount(int mno) {
		Connection con = getConnection();
		int QnaListCount = new BoardDao().getQnaListCount(con, mno);

		if (QnaListCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return QnaListCount;
	}

	//내가 쓴 Qna리스트 페이징 처리 후 조회
	public ArrayList<Board> QnaList(int currentPage, int limit, int mno) {
		Connection con = getConnection();
		ArrayList<Board> QnaList = new BoardDao().QnaList(con, currentPage, limit, mno);

		if (QnaList != null) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return QnaList;
	}
	


}
