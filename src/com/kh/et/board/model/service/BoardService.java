package com.kh.et.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.et.board.model.dao.BoardDao;
import com.kh.et.board.model.vo.Board;

import static com.kh.et.common.JDBCTemplate.*;


public class BoardService {

	//글 작성
	public int insertBoard(Board b) {
		Connection con = getConnection();
		System.out.println("Service 제목 :"+ b.getBtitle());
		System.out.println("Service 내용 : "+ b.getbContent() );
		
		int result = new BoardDao().insertBoard(con,b);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
			
		return result;
	}

	//전체 게시글 조회 
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new BoardDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	//페이징처리 적용한 게시물 조회용 메소드
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		System.out.println(limit);
		
		ArrayList<Board> list 
			= new BoardDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}


}
