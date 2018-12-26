package com.kh.et.board.model.service;

import java.sql.Connection;

import com.kh.et.board.model.dao.BoardDao;
import com.kh.et.board.model.vo.Board;

import static com.kh.et.common.JDBCTemplate.*;

public class BoardService {

	//글 작성
	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con,b);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
			
		return result;
	}

}
