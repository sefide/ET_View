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
import com.kh.et.member.model.vo.News;
import com.kh.et.plan.model.dao.PlanDao;
import com.kh.et.plan.model.vo.Plan;


public class BoardService {

	//글 작성
	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con, b);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
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
	public ArrayList<News> selectMyNewsBoard(int mno) {
		Connection con = getConnection();
		System.out.println("service진입");
		ArrayList<News> list = new BoardDao().selectMyNewsBoard(con, mno);
		
		News n = new PlanDao().selectMyNewsPlan(con, mno);
		
		if(list != null) {
			System.out.println("보드 있어요 ");
			if(n != null) {
				list.add(n);
				System.out.println("플랜 있어요 ");
				System.out.println("반환 LIST 사이즈 "+list.size());
			}
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return list;
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


}
